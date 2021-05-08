//
//  UICustomGridView.h
//  CustomPageControlViewDemo
//
//  Created by chuckchan on 2020/4/28.
//  Copyright © 2020年 chuckchan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UICustomGridDelegate <NSObject>

@optional
-(void)gridItemSelected:(NSInteger)index;

@end

@interface UICustomGridView : UIView

@property bool showPageIndicator;

@property CGFloat horizontalSpacing;

@property CGFloat verticalSpacing;

@property NSInteger maxItemsPerHorizontal;

@property NSInteger maxItemsPerVertical;

@property (nonatomic, weak) id<UICustomGridDelegate> delegate;

-(void)setChildItems:(NSArray<UIView*> *)items;

@property UIColor *pageIndicatorColor;//default page indicator
@property UIColor *currentPageIndicatorColor;//selected page indicator color

@end
