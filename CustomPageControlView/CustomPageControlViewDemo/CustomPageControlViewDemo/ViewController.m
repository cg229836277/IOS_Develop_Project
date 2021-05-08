//
//  ViewController.m
//  CustomPageControlViewDemo
//
//  Created by chuckchan on 2020/4/26.
//  Copyright © 2020年 chuckchan. All rights reserved.
//

#import "ViewController.h"
#import "CustomBanner.h"
#import <Foundation/Foundation.h>
#import "UICustomGridView.h"
#import "UICustomGridViewCell.h"

@interface ViewController ()<UIScrollViewDelegate , UICustomBannerDelegate , UICustomGridDelegate>

@property (strong, nonatomic) IBOutlet CustomBanner *customBanner;

@property (strong, nonatomic) IBOutlet UICustomGridView *customGridView;

@property NSArray* myImages;

@property CGSize destSize;
@property CGFloat scale;

@property NSString *bundlePath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _bundlePath = [[NSBundle mainBundle] pathForResource:@"banner" ofType:@"bundle"];
    NSLog(@"custom view width size %f %f",_customBanner.frame.size.width,_customBanner.frame.size.height);
}

-(void)viewWillAppear:(BOOL)animated{
    [self initBannerView];
    [self initCustomGridView];
}

-(void)initBannerView{
    CGSize currentSize = self.view.frame.size;
    NSLog(@"parent size %f %f",currentSize.width,currentSize.height);
    _customBanner.showIndicator = true;
    _customBanner.delegate = self;
    NSArray *imagesUrl = [[NSArray alloc] initWithObjects:@"a1.jpg",
                          @"a2.jpg",
                          @"a3.jpeg",
                          @"a4.jpeg",nil];
    double bannerViewHeight = _customBanner.frame.size.height;
    NSMutableArray *imageViewArray = [NSMutableArray new];
    
    _destSize = CGSizeMake(currentSize.width, 200);
    _scale = 1;
    if ([[UIScreen mainScreen] scale] > 1.0) {
        _scale = 2;
        _destSize.width *= 2;
        _destSize.height *= 2;
    }
    
    for(int index = 0;index < imagesUrl.count;index++){
        NSString *imgPath= [_bundlePath stringByAppendingPathComponent:[imagesUrl objectAtIndex:index]];
        NSLog(@"imgPath is %@",imgPath);
        NSData *data = [[NSFileManager defaultManager] contentsAtPath:imgPath];
        UIImage *image = [self downsample:data pointSize:_destSize scale:_scale];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, currentSize.width, bannerViewHeight)];
        imageView.image = image;
        [imageViewArray addObject:imageView];
    }
    
    CGPoint bannerPoint = CGPointMake(_customBanner.frame.origin.x, _customBanner.frame.origin.y);
    [_customBanner setFrame:CGRectMake(bannerPoint.x, bannerPoint.y, currentSize.width, _customBanner.frame.size.height)];
    [_customBanner start:imageViewArray];
}

-(UIImage*)downsample:(NSObject *)imageSource pointSize:(CGSize)pointSize scale:(CGFloat)scale{
    CGFloat maxw = pointSize.width;
    CGFloat maxh = pointSize.height;
    
    CGImageSourceRef src = NULL;
    if ([imageSource isKindOfClass:[NSURL class]])
        src = CGImageSourceCreateWithURL((__bridge CFURLRef)imageSource, nil);
    else if ([imageSource isKindOfClass:[NSData class]])
        src = CGImageSourceCreateWithData((__bridge CFDataRef)imageSource, nil);
    
    // load the image at the desired size
    NSDictionary* d = @{
                        (id)kCGImageSourceShouldAllowFloat: (id)kCFBooleanTrue,
                        (id)kCGImageSourceCreateThumbnailWithTransform: (id)kCFBooleanTrue,
                        (id)kCGImageSourceCreateThumbnailFromImageAlways: (id)kCFBooleanTrue,
                        (id)kCGImageSourceThumbnailMaxPixelSize: @((int)(maxw > maxh ? maxw : maxh))
                        };
    CGImageRef imref = CGImageSourceCreateThumbnailAtIndex(src, 0, (__bridge CFDictionaryRef)d);
    if (NULL != src)
        CFRelease(src);
    UIImage* im = [UIImage imageWithCGImage:imref scale:scale orientation:UIImageOrientationUp];
    if (NULL != imref)
        CFRelease(imref);
    return im;
}

-(void)pageSelected:(int)index{
//    NSLog(@"pageSelected %d",index);
}

-(void)initCustomGridView{
    CGSize currentSize = self.view.frame.size;
    CGPoint currentPoint = _customGridView.frame.origin;
    _destSize = CGSizeMake(88, 120);
    _scale = 1;
    if ([[UIScreen mainScreen] scale] > 1.0) {
        _scale = 2;
        _destSize.width *= 2;
        _destSize.height *= 2;
    }
    
    NSBundle *bundle = [NSBundle bundleWithPath:_bundlePath];
    _myImages = [bundle pathsForResourcesOfType:@"jpeg" inDirectory:nil];
    _customGridView.delegate = self;
    _customGridView.backgroundColor = [UIColor whiteColor];
    [_customGridView setFrame:CGRectMake(currentPoint.x, currentPoint.y, currentSize.width, 293)];
    NSMutableArray *itemsArray = [NSMutableArray new];
    NSInteger imagesCount = _myImages.count;
    for (int index = 0; index < imagesCount; index++) {
        UICustomGridViewCell *itemCell = [[UICustomGridViewCell alloc] initWithFrame:CGRectMake(0, 0, 88, 120)];
        NSString *imgPath= [_myImages objectAtIndex:index];
        NSLog(@"initCell imgPath is %@",imgPath);
        NSData *data = [[NSFileManager defaultManager] contentsAtPath:imgPath];
        UIImage *image = [self downsample:data pointSize:_destSize scale:_scale];
        itemCell.imageView.image = image;
        itemCell.titleLabel.text = @(index).stringValue;
        itemCell.titleLabel.font = [UIFont systemFontOfSize:13];
        itemCell.titleLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        itemCell.titleLabel.textAlignment = NSTextAlignmentCenter;
        [itemsArray addObject:itemCell];
    }
    _customGridView.showPageIndicator = true;
    [_customGridView setChildItems:itemsArray];
}

-(void)gridItemSelected:(NSInteger)index{
    NSLog(@"gridItemSelected index is %d",index);
}

-(void)viewWillDisappear:(BOOL)animated{
    [_customBanner stop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [_customBanner stop];
}


@end
