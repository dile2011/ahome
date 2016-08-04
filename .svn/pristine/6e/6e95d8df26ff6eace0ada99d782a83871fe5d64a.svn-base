//
//  APhoneAuthButtonElementView.m
//  ahome
//
//  Created by dilei liu on 15/2/13.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "APhoneAuthButtonElementView.h"

@implementation APhoneAuthButtonElementView

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string andButtonTitle:(NSString*)btnTitle andWidth:(float)width {
    self = [super initWithReuseIdentifier:string];
    self.isShowSeparator = NO;
    float H = [ANextActionButtonElementView heightForCell];
    
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGRect rect = CGRectMake(10, 5, width-2*10, H-10);
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.tag = 1000;
    nextButton.enabled = NO;
    [nextButton setFrame:rect];
    nextButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [nextButton setTitle:btnTitle forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageNamed:@"Button_Disenable.png"] forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageNamed:@"Button_Disenable.png"] forState:UIControlStateHighlighted];
    [nextButton addTarget:self.qControllerDelegate action:@selector(doNextAction) forControlEvents:UIControlEventTouchUpInside];
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

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string andButtonTitle:(NSString*)btnTitle {
    self = [super initWithReuseIdentifier:string];
    self.isShowSeparator = NO;
    float H = [ANextActionButtonElementView heightForCell];
    
    CGRect rect = CGRectMake(10, 5, SCREEN_WIDTH-2*10, H-10);
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.tag = 1000;
    nextButton.enabled = NO;
    [nextButton setFrame:rect];
    nextButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [nextButton setTitle:btnTitle forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageNamed:@"Button_Disenable.png"] forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageNamed:@"Button_Disenable.png"] forState:UIControlStateHighlighted];
    [nextButton addTarget:self.qControllerDelegate action:@selector(doNextAction) forControlEvents:UIControlEventTouchUpInside];
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

- (void)doNextAction {

}


@end
