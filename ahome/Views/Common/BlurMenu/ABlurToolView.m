//
//  ABlurToolView.m
//  demoe
//
//  Created by andson-dile on 15/3/6.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "ABlurToolView.h"

@implementation ABlurToolView

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString*)title andSelect:(void (^)(void))onSelected {
    self = [super initWithFrame:frame];
    _closeStr = title;
    self.onSelected = onSelected;
    
    [self initCommon];
    
    return self;
}

- (void)initCommon {
    UIButton *closeButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [closeButton setTitle:_closeStr forState:UIControlStateNormal];
    [self addSubview:closeButton];
    
    [closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [closeButton addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, .3)];
    [line setImage:[UIImage imageNamed:@"blur_close_line.png"]];
    [self addSubview:line];
}

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString*)title {
    self = [super initWithFrame:frame];
    _closeStr = title;
    
    [self initCommon];
    
    return self;
}

- (void)clicked {
    self.onSelected();
}

@end
