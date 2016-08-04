//
//  AFamilyCircleView.m
//  ahome
//
//  Created by andson-dile on 15/7/2.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AFamilyCircleView.h"
#import "AFamilyCircle.h"

@implementation AFamilyCircleView

- (instancetype)initWIthCircles:(NSArray*)circles frame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    self.circles = circles;
    
    float ever_w = self.frame.size.width/self.circles.count;
    float ever_h = self.frame.size.height;
    
    for (AFamilyCircle *circle in self.circles) {
        NSUInteger index = [self.circles indexOfObject:circle];
        UIView *circleView = [[UIView alloc]initWithFrame:CGRectMake(index*ever_w, 0, ever_w, ever_h)];
        [self addSubview:circleView];
        
        UIView *circleBtn = [self circleButtonByCircle:circle];
        circleBtn.tag = index;
        [circleBtn setFrame:CGRectMake(5, 0, ever_w-10, ever_h)];
        [circleView addSubview:circleBtn];
    }

    return self;
}

- (UIView*)circleButtonByCircle:(AFamilyCircle*)circle {
    UIButton *circleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [circleBtn setTitleColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:.5] forState:UIControlStateNormal];
    [circleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [circleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    
    [circleBtn setTitle:circle.circleName forState:UIControlStateNormal];
    circleBtn.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:16];
    circleBtn.titleLabel.shadowColor = [UIColor whiteColor];
    circleBtn.enabled = circle.isUnlock;
    [circleBtn addTarget:self action:@selector(doClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return circleBtn;
}

- (void)doClicked:(id)sender {
    UIButton *circleBtn = (UIButton*)sender;
    if (circleBtn.selected) return;
    
    circleBtn.selected = !circleBtn.selected;
    if (circleBtn.selected) {
        [circleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    for (UIView *circleView in self.subviews) {
        for (UIView *subView in circleView.subviews) {
            if (subView == circleBtn) continue;
            
            if ([subView isKindOfClass:[UIButton class]]) {
                ((UIButton*)subView).selected = NO;
                [(UIButton*)subView setTitleColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:.5] forState:UIControlStateNormal];
            }
        }
    }
    
    AFamilyCircle *circle = [self.circles objectAtIndex:circleBtn.tag];
    circle.onSelected();
}

@end
