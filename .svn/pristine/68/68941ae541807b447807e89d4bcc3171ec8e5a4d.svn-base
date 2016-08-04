//
//  ACommunityCell.m
//  ahome
//
//  Created by dilei liu on 15/2/21.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ACommunityCell.h"

#define titlelabel_fontsize    14

@implementation ACommunityCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.layer.borderWidth = .3;
    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    
    _titleLabel = [[UILabel alloc]init];
    [_titleLabel setFrame:CGRectMake(5, 0,frame.size.width-10,frame.size.height)];
    
    [_titleLabel setFont:[UIFont systemFontOfSize:titlelabel_fontsize]];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
    _titleLabel.numberOfLines = 0;
    [self.contentView addSubview:_titleLabel];

    return self;
}

- (void)setDataForCell:(id)model isNewFlag:(BOOL)flag {
    
    NSString *valueText = (NSString*)model;
    [_titleLabel setText:valueText];
    
    if (flag) {
        [_titleLabel setTextColor:[UIColor redColor]];
    } else {
        [_titleLabel setTextColor:[UIColor blackColor]];
    }
}

@end
