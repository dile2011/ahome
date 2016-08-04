//
//  AGuideNextView.m
//  demoe
//
//  Created by andson-dile on 15/3/3.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "AGuideNextView.h"

@implementation AGuideNextView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.alpha = .0;
    [self setBackgroundColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:0.]];

    [self setTitle:@"继续" forState:UIControlStateNormal];
    [self setTintColor:[UIColor whiteColor]];
    
    [self setBackgroundImage:[UIImage imageNamed:@"guide_go.png"] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:@"guide_go_h.png"] forState:UIControlStateHighlighted];
    
    
    
    return self;
}

- (void)show {
    [UIView animateWithDuration:1.5 animations:^{
        self.alpha = 1.;
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hiden {
    [UIView animateWithDuration:1. animations:^{
        self.alpha = 0.;
        
    } completion:^(BOOL finished) {
        
    }];
}


@end
