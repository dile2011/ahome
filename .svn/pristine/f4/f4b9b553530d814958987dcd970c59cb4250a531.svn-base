//
//  ABlurCollectionHeaderView.m
//  ahome
//
//  Created by andson-dile on 15/6/12.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ABlurCollectionHeaderView.h"

@implementation ABlurCollectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(15, 0, frame.size.width-2*15, frame.size.height)];
    [backgroundView setBackgroundColor:[UIColor colorWithRed:69./255. green:70./255 blue:159/255. alpha:1.]];
    [self addSubview:backgroundView];
    
    _textLabel = [[UILabel alloc]init];
    [self addSubview:_textLabel];

    [_textLabel setFont:[UIFont systemFontOfSize:14]];
    [_textLabel setTextColor:[UIColor whiteColor]];
    _textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [_textLabel setBackgroundColor:[UIColor clearColor]];

    return self;
}

- (void)setTitle:(NSString *)title color:(UIColor*)bgColor {
    self.title = title;
    UIView *titleBgView = [self.subviews firstObject];
    [titleBgView setBackgroundColor:bgColor];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    _textLabel.text = _title;
    
    CGSize titleSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:_textLabel.font, NSFontAttributeName,nil];
    titleSize =[_textLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_textLabel setFrame:CGRectMake(25, (self.frame.size.height-titleSize.height)/2., titleSize.width, titleSize.height)];
}

@end
