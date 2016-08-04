//
//  AFamilyHomeBottomView.m
//  ahome
//
//  Created by andson-dile on 15/8/13.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AFamilyHomeBottomView.h"


@implementation AFamilyHomeBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    UIImage *switchImage = [UIImage imageNamed:@"family_home_switch.png"];
    UIButton *switchBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, (frame.size.height-switchImage.size.height)/2., switchImage.size.width, switchImage.size.height)];
    [switchBtn setBackgroundImage:switchImage forState:UIControlStateNormal];
    switchBtn.alpha = .6;
    [self addSubview:switchBtn];
    [switchBtn addTarget:self action:@selector(switchBlockAction) forControlEvents:UIControlEventTouchUpInside];
    
    return self;
}

- (void)switchBlockAction {
    self.switchBlock();
}


@end
