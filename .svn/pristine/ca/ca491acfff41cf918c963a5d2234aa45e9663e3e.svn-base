//
//  AstatisticsView.m
//  ahome
//
//  Created by dilei liu on 15/1/15.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AstatisticsView.h"

#define blockNo 4

@implementation AstatisticsView

- (instancetype)initWithFrame:(CGRect)frame andX:(float)xValue {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    
    NSArray *blockViews = [self statisticsBlockViewByX:xValue];
    AUser *user = [AUser sharedInstance];
    
    
    // ahome统计
    UIView *ahomeBlockView = [blockViews objectAtIndex:0];
    [self blockDataArea:ahomeBlockView andTitle:@"家庭" andValue:(int)user.familys.count];
    [self addSubview:ahomeBlockView];
    
    // 订单统计
    UIView *orderBlockView = [blockViews objectAtIndex:1];
    [self blockDataArea:orderBlockView andTitle:@"社区" andValue:0];
    [self addSubview:orderBlockView];
    
    // 个人头像统计
    UIView *photoBlockView = [blockViews objectAtIndex:2];
    [self blockDataArea:photoBlockView andTitle:@"家族" andValue:0];
    [self addSubview:photoBlockView];
    
    return self;
}


- (void)blockDataArea:(UIView*)blockView andTitle:(NSString*)title andValue:(int)value {
    
    // title
    UILabel *titleLable = [[UILabel alloc]init];
    [titleLable setText:title];
    
    [titleLable setFont:[UIFont systemFontOfSize:12]];
    titleLable.textAlignment = NSTextAlignmentCenter;
    [titleLable setTextColor:[UIColor whiteColor]];
    titleLable.lineBreakMode = NSLineBreakByWordWrapping;
    [titleLable setBackgroundColor:[UIColor clearColor]];
    titleLable.numberOfLines = 1;
    CGSize titleSize = CGSizeMake(100, 20000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:titleLable.font, NSFontAttributeName,nil];
    titleSize =[titleLable.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    [titleLable setFrame:CGRectMake((blockView.frame.size.width-titleSize.width)/2., blockView.frame.size.height-titleSize.height, titleSize.width, titleSize.height)];
    [blockView addSubview:titleLable];
    
    // value
    UILabel *valueLable = [[UILabel alloc]init];
    [valueLable setText:[NSString stringWithFormat:@"%i",value]];
    [valueLable setFont:[UIFont fontWithName:@"Heiti SC" size:17]];
    valueLable.textAlignment = NSTextAlignmentCenter;
    [valueLable setTextColor:[UIColor whiteColor]];
    valueLable.lineBreakMode = NSLineBreakByWordWrapping;
    [valueLable setBackgroundColor:[UIColor clearColor]];
    valueLable.numberOfLines = 1;
    titleSize = CGSizeMake(100, 20000.0f);
    tdic = [NSDictionary dictionaryWithObjectsAndKeys:valueLable.font, NSFontAttributeName,nil];
    titleSize =[valueLable.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    [valueLable setFrame:CGRectMake((blockView.frame.size.width-titleSize.width)/2., (blockView.frame.size.height-titleSize.height)/2.-5, titleSize.width, titleSize.height)];
    [blockView addSubview:valueLable];
}


- (NSArray*)statisticsBlockViewByX:(float)xValue {
    NSMutableArray *blockViews = [NSMutableArray array];
    
    float w = self.frame.size.width - xValue;
    float blockw = w/blockNo;
    
    for (int i = 0; i<blockNo; i++) {
        CGRect rect = CGRectMake(xValue+i*blockw, 0, blockw, self.frame.size.height);
        UIView *blockView = [[UIView alloc]initWithFrame:rect];
        [blockView setBackgroundColor:[UIColor clearColor]];
        [blockViews addObject:blockView];
    }

    return blockViews;
}

- (void)setFamilyNo:(int)familyNo {
    UIView *familyNoView = [[self subviews]firstObject];
    UILabel *label = [familyNoView.subviews lastObject];
    [label setText:[NSString stringWithFormat:@"%i",familyNo]];
    
}


@end
