//
//  ALogintActionButtonElementView.m
//  Ahome
//
//  Created by dilei liu on 14/11/29.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ALogintActionButtonElementView.h"

@implementation ALogintActionButtonElementView

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string {
    self = [super initWithReuseIdentifier:string];
    self.isShowSeparator = NO;
    float H = [ANextActionButtonElementView heightForCell];
    
    CGRect rect = CGRectMake(10, 5, [UIScreen mainScreen].bounds.size.width-2*10, H-10);
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.tag = 1000;
    nextButton.enabled = NO;
    [nextButton setFrame:rect];
    nextButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [nextButton setTitle:@"登 录" forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageNamed:@"Button_Disenable.png"] forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageNamed:@"Button_Disenable.png"] forState:UIControlStateHighlighted];
    [nextButton addTarget:self.qControllerDelegate action:@selector(doLoginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:nextButton];
    
    CALayer *separator = [CALayer layer];
    UIColor *bcolor = [UIColor colorWithRed:249./255. green:249./255. blue:249./255. alpha:1.0];
    separator.backgroundColor = bcolor.CGColor;
    separator.frame = CGRectMake(0, H-1, self.frame.size.width, 1);
    [self.layer addSublayer:separator];
    
    separator = [CALayer layer];
    separator.backgroundColor = bcolor.CGColor;
    separator.frame = CGRectMake(0, 0, self.frame.size.width, 1);
    [self.layer addSublayer:separator];
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityView.center = CGPointMake(self.contentView.center.x+100, self.contentView.center.y+5);
    [self.contentView addSubview:activityView];
    [activityView stopAnimating];
    
    return self;
}

- (void)setButtonEnable:(BOOL)enable {
    UIButton *nextButton = (UIButton*)[self.contentView viewWithTag:1000];
    if (nextButton.enabled == enable) return;
    
    if (enable) {
        [nextButton setBackgroundImage:[UIImage imageNamed:@"Button_Green_Def.png"] forState:UIControlStateNormal];
        [nextButton setBackgroundImage:[UIImage imageNamed:@"Button_Green_Sel.png"] forState:UIControlStateHighlighted];
    } else {
        [nextButton setBackgroundImage:[UIImage imageNamed:@"Button_Disenable.png"] forState:UIControlStateNormal];
        [nextButton setBackgroundImage:[UIImage imageNamed:@"Button_Disenable.png"] forState:UIControlStateHighlighted];
    }
    
    nextButton.enabled = enable;
}

- (void)setButtonState:(ButtonState)state {
    UIActivityIndicatorView *activityView = [self.contentView.subviews lastObject];
    
    if (state == DefaultState) {
        [self setButtonEnable:NO];
        [activityView stopAnimating];
        
    } else if (state == WorkState) { // 工作状态
        [self setButtonEnable:NO];
        [activityView startAnimating];
        
    } else if (state == DisableState) { // 不能工作状态
        [self setButtonEnable:NO];
        [activityView stopAnimating];
        
    } else if (state == EnableState) { // 高亮可点击状态
        [self setButtonEnable:YES];
        [activityView stopAnimating];
    }
}


+ (float)heightForCell {
    return 55;
}


- (void)doLoginAction {}


@end
