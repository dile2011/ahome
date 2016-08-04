//
//  AMainScrollView.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-25.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AMainScrollView.h"

@implementation AMainScrollView

- (id)initWithFrame:(CGRect)frame andPageNo:(int)pageNo {
    self = [super initWithFrame:frame];
    self.contentSize = CGSizeMake(pageNo*frame.size.width, frame.size.height);
    self.pagingEnabled = NO;
    [self setShowsHorizontalScrollIndicator:NO];
    [self setShowsVerticalScrollIndicator:NO];
    self.alwaysBounceHorizontal = NO;
    self.bounces = NO;
    self.scrollEnabled = false;
    
    for (int i=0; i<pageNo; i++) {
        UIView *stepView = [[UIView alloc]initWithFrame:CGRectMake(i*frame.size.width, 0, frame.size.width, frame.size.height)];
        [self addSubview:stepView];
    }
    
    return self;
}

- (UIView*)getPageByIndex:(int)index {
    NSArray *subViews = [self subviews];
    UIView *stepView =[subViews objectAtIndex:index];
    return stepView;
}

- (void)displayPageByindex:(int)index {
    [self scrollRectToVisible:CGRectMake(index*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height) animated:YES];
}

@end
