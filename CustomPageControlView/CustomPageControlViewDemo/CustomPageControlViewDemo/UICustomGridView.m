//
//  UICustomGridView.m
//  CustomPageControlViewDemo
//
//  Created by chuckchan on 2020/4/28.
//  Copyright © 2020年 chuckchan. All rights reserved.
//

#import "UICustomGridView.h"

@interface UICustomGridView () <UIScrollViewDelegate>

@property UIScrollView *contentScrollView;
@property UIPageControl *pageControlView;

@property NSInteger pages;

@end

@implementation UICustomGridView

const CGFloat FIX_GRID_PAGE_CONTROL_VIEW_HEIGHT = 37;
const CGFloat FIX_HORIZONTAL_SPACING = 24;
const CGFloat FIX_VERTICAL_SPACING = 8;

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
    _pageControlView = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 39, FIX_GRID_PAGE_CONTROL_VIEW_HEIGHT)];
    _pageControlView.currentPage = 0;
    _pageControlView.hidesForSinglePage = true;
    
    _showPageIndicator = true;
    
    _horizontalSpacing = FIX_HORIZONTAL_SPACING;
    _verticalSpacing = FIX_VERTICAL_SPACING;
}

-(void)setChildItems:(NSArray<UIView*> *)items{
    if(!items || items.count == 0){
        return;
    }
    NSInteger itemsCount = items.count;
    
    CGFloat scrollViewHeight = _showPageIndicator ? CGRectGetHeight(self.frame) - FIX_GRID_PAGE_CONTROL_VIEW_HEIGHT:CGRectGetHeight(self.frame);
    CGSize scrollViewSize = CGSizeMake(CGRectGetWidth(self.frame), scrollViewHeight);
    UIView *tempItemView = [items objectAtIndex:0];
    CGSize itemViewSize = tempItemView.frame.size;
    
    if(_maxItemsPerHorizontal == 0 || _maxItemsPerVertical == 0){
        _maxItemsPerHorizontal = floor((float)scrollViewSize.width / (1.5 * _horizontalSpacing + itemViewSize.width));
        _maxItemsPerVertical = floor((float)scrollViewSize.height / (_verticalSpacing + itemViewSize.height));
        NSLog(@"items per vertical and horizontal %d %d",_maxItemsPerVertical , _maxItemsPerHorizontal);
    }
    
    if(_horizontalSpacing == FIX_HORIZONTAL_SPACING || _verticalSpacing == FIX_VERTICAL_SPACING){
        _horizontalSpacing = (scrollViewSize.width - _maxItemsPerHorizontal * itemViewSize.width) / (_maxItemsPerHorizontal + 1);
        _verticalSpacing = (scrollViewSize.height - _maxItemsPerVertical * itemViewSize.height) / (_maxItemsPerVertical + 1);
    }

    NSInteger maxItemsPerPage = _maxItemsPerVertical * _maxItemsPerHorizontal;
    bool needSplitPage = maxItemsPerPage < itemsCount;
    _pages = ceil((float)itemsCount / (_maxItemsPerVertical * _maxItemsPerHorizontal));
    
    _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, scrollViewSize.width, scrollViewSize.height)];
    _contentScrollView.delegate = self;
    _contentScrollView.showsVerticalScrollIndicator = false;
    _contentScrollView.showsHorizontalScrollIndicator = false;
    [_contentScrollView setPagingEnabled:true];
    NSInteger horizontalIndex = 0,verticalIndex = 0;
    NSInteger curPage = 0;

    for(int index = 0;index < itemsCount;index++){
        if(index % _maxItemsPerHorizontal == 0){
            ++verticalIndex;
            horizontalIndex = 0;
        }
        horizontalIndex = index % _maxItemsPerHorizontal;
        if(index % maxItemsPerPage == 0){
            verticalIndex = 0;
            horizontalIndex = 0;
            curPage = index == 0 ? curPage : ++curPage;
        }
        UIView *itemView = [items objectAtIndex:index];
        itemView.tag = index;
        [itemView setUserInteractionEnabled:YES];
        UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [itemView addGestureRecognizer:singleFingerTap];
        CGFloat pointX = scrollViewSize.width * curPage + (horizontalIndex + 1) * _horizontalSpacing + horizontalIndex * itemViewSize.width;
        CGFloat pointY = (verticalIndex + 1) * _verticalSpacing + verticalIndex * itemViewSize.height;
        NSLog(@"setChildItems horizontalIndex verticalIndex curPage %d %d %d",horizontalIndex , verticalIndex , curPage);
        NSLog(@"setChildItems point %f %f",pointX , pointY);
        [itemView setFrame:CGRectMake(pointX, pointY, itemViewSize.width, itemViewSize.height)];
        [_contentScrollView addSubview:itemView];
    }
    if(needSplitPage && _showPageIndicator){
        _pageControlView.numberOfPages = _pages;
        _pageControlView.pageIndicatorTintColor = _pageIndicatorColor?_pageIndicatorColor:[UIColor colorWithRed:190.0/255 green:190.0/255 blue:190.0/255 alpha:1];
        _pageControlView.currentPageIndicatorTintColor = _currentPageIndicatorColor?_currentPageIndicatorColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        
        CGSize pageControlSize = _pageControlView.frame.size;
        [_pageControlView setFrame:CGRectMake(_contentScrollView.center.x - pageControlSize.width / 2, scrollViewSize.height, 39, FIX_GRID_PAGE_CONTROL_VIEW_HEIGHT)];
        _pageControlView.autoresizingMask = UIViewAutoresizingNone;
        NSLog(@"_pageControlView size %f %f",pageControlSize.width , pageControlSize.height);
        NSLog(@"_pageControlView point %f %f",_pageControlView.frame.origin.x , _pageControlView.frame.origin.y);
        [self addSubview:_pageControlView];
    }
    _contentScrollView.contentSize = CGSizeMake(_pages * scrollViewSize.width, scrollViewSize.height);
    [self addSubview:_contentScrollView];
}

#pragma scrollview delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    float currentOffsetX = _contentScrollView.contentOffset.x;
    int index = (int)(currentOffsetX / _contentScrollView.frame.size.width);
    NSLog(@"scrollViewDidEndDecelerating currentOffsetX = %f,index:%d",currentOffsetX,index);
    _pageControlView.currentPage = index;
}


- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer{
    NSInteger index = (NSInteger)recognizer.view.tag;
    NSLog(@"tapDetected %d",index);
    if ([self.delegate respondsToSelector:@selector(gridItemSelected:)]) {
        [self.delegate gridItemSelected:index];
    }
}

@end
