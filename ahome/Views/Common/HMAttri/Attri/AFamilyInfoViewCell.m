//
//  AFamilyInfoViewCell.m
//  ahome
//
//  Created by andson-dile on 15/8/4.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AFamilyInfoViewCell.h"

#define margin_left_size    15
#define margin_top_size     5.

#define title_size_height   30.

@implementation AFamilyInfoViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _familyBgView = [[UIImageView alloc]initWithFrame:CGRectMake(margin_left_size, 1, SCREEN_WIDTH-2*margin_left_size, [AFamilyInfoViewCell heightForCell]-10)];
    [_familyBgView.layer setMasksToBounds:YES];
    [_familyBgView.layer setCornerRadius:5.0];
    [_familyBgView.layer setBorderWidth:.3];
    [_familyBgView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self addSubview:_familyBgView];
    
    _lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(.3, title_size_height, _familyBgView.frame.size.width-2*.3, .3)];
    [_lineLabel setBackgroundColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:1.]];
    [_familyBgView addSubview:_lineLabel];
    
    _familyLabel = [[UILabel alloc]init];
    [_familyLabel setText:@"家族信息"];
    [_familyLabel setTextColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:1.]];
    [_familyLabel setFont:[UIFont boldSystemFontOfSize:15.]];
    [_familyBgView addSubview:_familyLabel];
    
    CGSize titleSize = CGSizeMake(100, 20000.0f);
    NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:_familyLabel.font, NSFontAttributeName,nil];
    titleSize =[_familyLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_familyLabel setFrame:CGRectMake((_familyBgView.frame.size.width-titleSize.width)/2., (title_size_height-titleSize.height)/2., titleSize.width, titleSize.height)];
    
    return self;
}

+ (float)heightForCell {
    return 120.;
}

@end
