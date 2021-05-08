//
//  UICustomGridViewCellCollectionViewCell.h
//  CustomPageControlViewDemo
//
//  Created by chuckchan on 2020/4/28.
//  Copyright © 2020年 chuckchan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICustomGridViewCell : UIView

@property UIImageView *imageView;
@property UILabel *titleLabel;

-(instancetype)initWithCoder:(NSCoder *)aDecoder;
-(instancetype)initWithFrame:(CGRect)frame;

@end
