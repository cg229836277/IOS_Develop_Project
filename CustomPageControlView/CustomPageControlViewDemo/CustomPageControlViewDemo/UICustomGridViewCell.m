//
//  UICustomGridViewCellCollectionViewCell.m
//  CustomPageControlViewDemo
//
//  Created by chuckchan on 2020/4/28.
//  Copyright © 2020年 chuckchan. All rights reserved.
//

#import "UICustomGridViewCell.h"

@implementation UICustomGridViewCell

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
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width)];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.width, frame.size.width, 32)];
    [self addSubview:_imageView];
    [self addSubview:_titleLabel];
}

@end
