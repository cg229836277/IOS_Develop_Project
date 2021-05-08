//
//  CustomBanner.m
//  CustomPageControlViewDemo
//
//  Created by chuckchan on 2020/4/26.
//  Copyright © 2020年 chuckchan. All rights reserved.
//

#import "CustomBanner.h"

@interface CustomBanner () <UIScrollViewDelegate>

//@property NSTimer *timer;
@property dispatch_source_t timer;

@property CGSize currentViewSize;

@property UIScrollView *contentScrollView;
@property UIPageControl *pageControlView;
@property CGSize scrollViewSize;

@end


@implementation CustomBanner

NSInteger CHILD_ITEM_COUNT = 0;
const CGFloat FIX_PAGE_CONTROL_VIEW_HEIGHT = 37;
int default_init_index = 0;

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self initView:self.frame];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self initView:frame];
    }
    return self;
}

-(void)initView:(CGRect)frame{
    _contentScrollView = [[UIScrollView alloc] init];
    _contentScrollView.delegate = self;
    [_contentScrollView setPagingEnabled:true];
    
    _pageControlView = [[UIPageControl alloc] init];
    _pageControlView.currentPage = 0;
    _pageControlView.hidesForSinglePage = true;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
}

-(void)customInit{
    _currentViewSize = self.frame.size;
    NSLog(@"size width height %f %f ",_currentViewSize.width,_currentViewSize.height);
    CGRect scrollViewRect = CGRectMake(0, 0, _currentViewSize.width, _showIndicator?_currentViewSize.height - FIX_PAGE_CONTROL_VIEW_HEIGHT:_currentViewSize.height);
    [_contentScrollView setFrame:scrollViewRect];
    _scrollViewSize = scrollViewRect.size;
    
    if(!_showScrollIndicator){
        _contentScrollView.showsHorizontalScrollIndicator = false;
        _contentScrollView.showsVerticalScrollIndicator = false;
    }
    
    if(_showIndicator){
        _pageControlView.pageIndicatorTintColor = _indicatorColor?_indicatorColor:[UIColor colorWithRed:190.0/255 green:190.0/255 blue:190.0/255 alpha:1];
        _pageControlView.currentPageIndicatorTintColor = _currentIndicatorColor?_indicatorColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _pageControlView.currentPage = 0;
        _pageControlView.hidesForSinglePage = true;
        _pageControlView.center = _contentScrollView.center;
        [_pageControlView setFrame:CGRectMake(_contentScrollView.center.x, _scrollViewSize.height, 39, FIX_PAGE_CONTROL_VIEW_HEIGHT)];
    }
    [self addSubview:_contentScrollView];
    if(_showIndicator){
        [self addSubview:_pageControlView];
    }
}

-(void)start:(NSArray *)views{
    if(!views || views.count == 0){
        return;
    }
    [self customInit];
    NSInteger count = views.count;
    CHILD_ITEM_COUNT = count;
    _pageControlView.numberOfPages = count;
    CGRect pageScrollRect = _pageControlView.frame;
    [_pageControlView setFrame:CGRectMake(pageScrollRect.origin.x - pageScrollRect.size.width / 2, _scrollViewSize.height, 39, FIX_PAGE_CONTROL_VIEW_HEIGHT)];
    
    for(int index = 0; index < count;index++){
        UIView *childView = [views objectAtIndex:index];
        float childViewPointX = index * _scrollViewSize.width;
        [childView setFrame:CGRectMake(childViewPointX, 0, _scrollViewSize.width, _scrollViewSize.height)];
        [_contentScrollView addSubview:childView];
    }
    [_contentScrollView setContentSize:CGSizeMake(_scrollViewSize.width * count, _scrollViewSize.height)];
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), (_playIntervalTime == 0?2:_playIntervalTime) * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            // 在主线程中实现需要的功能
            [self updateTimer];
        });
     });
    [self startTimer];
}

-(void)startTimer{
    dispatch_resume(_timer);
//    _timer = [NSTimer timerWithTimeInterval:_playIntervalTime == 0?2:_playIntervalTime
//                                     target:self
//                                   selector:@selector(updateTimer:)
//                                   userInfo:nil
//                                    repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

- (void)updateTimer {
//    NSLog(@"updateTimer");
    ++default_init_index;
    if(default_init_index == CHILD_ITEM_COUNT){
        default_init_index = 0;
    }
    [self startScroll];
}

-(void)startScroll{
    if ([self.delegate respondsToSelector:@selector(pageSelected:)]) {
         [self.delegate pageSelected:default_init_index];
     }
    _pageControlView.currentPage = default_init_index;
    int offsetIndex = default_init_index % CHILD_ITEM_COUNT;
    float currentPointX = offsetIndex * _currentViewSize.width;
    [_contentScrollView setContentOffset:CGPointMake(currentPointX, 0) animated:true];
}

-(void)stop{
    if(_timer){
        NSLog(@"stop Timer");
       dispatch_source_cancel(_timer);
        _timer = nil;
    }
}

#pragma scrollview delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    float currentOffsetX = _contentScrollView.contentOffset.x;
    default_init_index = (int)(currentOffsetX / _currentViewSize.width);
    NSLog(@"scrollViewDidEndDecelerating currentOffsetX = %f,default_init_index:%d",currentOffsetX,default_init_index);
    _pageControlView.currentPage = default_init_index;
    if ([self.delegate respondsToSelector:@selector(pageSelected:)]) {
        [self.delegate pageSelected:default_init_index];
    }
    [self startTimer];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDragging");
    dispatch_suspend(_timer);
}
#pragma scrollview delegate

@end
