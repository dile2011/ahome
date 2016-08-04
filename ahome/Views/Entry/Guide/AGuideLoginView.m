//
//  AGuideLoginView.m
//  ahome
//
//  Created by dilei liu on 15/3/10.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AGuideLoginView.h"


#define btn_size_width      100
#define btn_size_height     50
#define margin_left_size    10
#define margin_right_size   10

@implementation AGuideLoginView

- (instancetype)initWithFrame:(CGRect)frame andTarget:(id)target {
    self = [super initWithFrame:frame];
    
    UIButton *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(margin_left_size, 0, btn_size_width, btn_size_height)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTintColor:[UIColor whiteColor]];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"guide_go.png"] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"guide_go_h.png"] forState:UIControlStateHighlighted];
    [loginBtn addTarget:target action:@selector(doLoginAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:loginBtn];
    
    UIButton *registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-margin_right_size-btn_size_width, 0, btn_size_width, btn_size_height)];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTintColor:[UIColor whiteColor]];
    [registerBtn setBackgroundImage:[UIImage imageNamed:@"guide_go.png"] forState:UIControlStateNormal];
    [registerBtn setBackgroundImage:[UIImage imageNamed:@"guide_go_h.png"] forState:UIControlStateHighlighted];
    [registerBtn addTarget:target action:@selector(doRegisterAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:registerBtn];
    
    return self;
}

- (void)doLoginAction {

}
- (void)doRegisterAction {

}

@end
