//
//  CustomBanner.h
//  CustomPageControlViewDemo
//
//  Created by chuckchan on 2020/4/26.
//  Copyright © 2020年 chuckchan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UICustomBannerDelegate <NSObject>

@optional
-(void)pageSelected:(int)index;

@end

@interface CustomBanner : UIView

@property bool showIndicator;//whether show bottom page control view
@property UIColor *indicatorColor;//default page indicator
@property UIColor *currentIndicatorColor;//selected page indicator color
@property float playIntervalTime;//images or some other uiviews interval play time
@property bool showScrollIndicator;//whether show scroll view indicator,including horizontal and vertical

@property (nonatomic, weak) id<UICustomBannerDelegate> delegate;

-(void)start:(NSArray *)views;
-(void)stop;

@end
