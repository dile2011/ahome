//
//  AFamilyCollectionHeaderView.m
//  ahome
//
//  Created by andson-dile on 15/7/17.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AFamilyCollectionHeaderView.h"

#define header_margin_size  10

#define header_back_height_size    .2

#define header_front_height_size   2
#define header_front_width_size    120

@implementation AFamilyCollectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    _headerBackLabel = [[UIImageView alloc]init];
    [_headerBackLabel setFrame:CGRectMake(header_margin_size, frame.size.height-header_front_height_size+header_front_height_size/2., frame.size.width-2*header_margin_size, header_back_height_size)];
    [_headerBackLabel setBackgroundColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:.5]];
    [self addSubview:_headerBackLabel];
    
    _headerFrontLabel = [[UILabel alloc]initWithFrame:CGRectMake(header_margin_size, frame.size.height-header_front_height_size, header_front_width_size, header_front_height_size)];
    [_headerFrontLabel setBackgroundColor:[UIColor colorWithRed:98./255. green:255./255. blue:211./255. alpha:1.]];
    [self addSubview:_headerFrontLabel];
    
    _familyCategoryLabel = [[UILabel alloc]init];
    [self addSubview:_familyCategoryLabel];
    
    return self;
}
@end
