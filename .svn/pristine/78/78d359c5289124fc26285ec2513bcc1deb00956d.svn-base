//
//  MMSideDrawerHeaderCell.m
//  ahome
//
//  Created by andson-dile on 15/8/18.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "MMSideDrawerHeaderCell.h"

#define avater_size     60.

@implementation MMSideDrawerHeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setSelectionStyle:UITableViewCellSelectionStyleBlue];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UIView *selectedView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, [MMSideDrawerHeaderCell heightForCell])];
    [selectedView setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:.3]];
    [self setSelectedBackgroundView:selectedView];
    
    CGRect avaterRect = CGRectMake(15,([MMSideDrawerHeaderCell heightForCell]-avater_size)/2, avater_size, avater_size);
    _faceImageView = [[PAImageView alloc]initWithFrame:avaterRect backgroundProgressColor:[UIColor whiteColor] progressColor:[UIColor greenColor]];
    [self addSubview:_faceImageView];

    _unameLabel = [[UILabel alloc]init];
    [_unameLabel setFont:[UIFont systemFontOfSize:16]];
    _unameLabel.textAlignment = NSTextAlignmentLeft;
    [_unameLabel setTextColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:.7]];
    [_unameLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_unameLabel];
    
    _descLabel = [[UILabel alloc]init];
    [_descLabel setFont:ahomefontWithSize(12)];
    _descLabel.textAlignment = NSTextAlignmentLeft;
    [_descLabel setTextColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:.5]];
    [_descLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_descLabel];
    
    _arrowImageView = [[UIImageView alloc]init];
    [self addSubview:_arrowImageView];
    
    return self;
}

- (void)setDataForCell:(id)data andDel:(id)delObj {
    AUser *user = (AUser*)data;
    [_faceImageView setImageURL:user.avatar];
    
    NSAttributedString *attributedString =[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",user.uname] attributes:@{NSKernAttributeName : @(1.)}];
    [_unameLabel setAttributedText:attributedString];
    CGSize titleSize = CGSizeMake(200, 200.0f);
    NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:_unameLabel.font, NSFontAttributeName,nil];
    titleSize =[_unameLabel.text boundingRectWithSize:titleSize options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_unameLabel setFrame:CGRectMake([[AUtilities sharedInstance]sizeLeftSideDrawer], ([MMSideDrawerHeaderCell heightForCell]-titleSize.height)/2.-10, 2*titleSize.width, titleSize.height)];
    
    [_descLabel setText:@"最近相关动态信息"];
    titleSize = CGSizeMake(200, 200.0f);
    tdic = [NSDictionary dictionaryWithObjectsAndKeys:_descLabel.font, NSFontAttributeName,nil];
    titleSize =[_descLabel.text boundingRectWithSize:titleSize options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_descLabel setFrame:CGRectMake(_unameLabel.frame.origin.x, _unameLabel.frame.size.height+_unameLabel.frame.origin.y, titleSize.width, titleSize.height)];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIColor *bcolor = [UIColor clearColor];
    for (UIView *view in [self subviews]) {
        if ([view isKindOfClass:NSClassFromString(@"_UITableViewCellSeparatorView")])
            view.backgroundColor = bcolor;
    }
}

+ (float)heightForCell {
    return 80.;
}

@end
