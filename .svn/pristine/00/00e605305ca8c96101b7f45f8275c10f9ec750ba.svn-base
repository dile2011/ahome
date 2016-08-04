//
//  AGuidScrollView.m
//  demoe
//
//  Created by andson-dile on 15/3/3.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "AGuidScrollView.h"

#define pagetotal   4

@implementation AGuidScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:0.]];
    _pageViews =[NSMutableArray array];
    
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
    self.scrollEnabled = NO;
    self.clipsToBounds = NO;
    self.bounces = NO;

    [self setContentSize:CGSizeMake(pagetotal*frame.size.width, frame.size.height)];
    for (int i=0; i<pagetotal; i++) {
        CGRect rect =  CGRectMake(i*frame.size.width, 0, frame.size.width, frame.size.height);
        UIView *pageView = [[UIView alloc]initWithFrame:rect];
        [self addSubview:pageView];
        [_pageViews addObject:pageView];
    }
    
    return self;
}

- (UIView*)pageByIndex:(int)pageIndex {
    UIView *pageView = [_pageViews objectAtIndex:pageIndex];
    return pageView;
}

- (void)intoPageByIndex:(int)pageIndex {
    [self scrollRectToVisible:CGRectMake(self.frame.size.width*pageIndex, 0, self.frame.size.width, self.frame.size.height) animated:YES];
}

- (int)getAllPageNo {
    return (int)_pageViews.count;
}

@end
