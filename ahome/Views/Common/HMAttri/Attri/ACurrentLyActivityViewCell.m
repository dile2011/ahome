//
//  ACurrentLyActivityViewCell.m
//  ahome
//
//  Created by andson-dile on 15/8/4.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ACurrentLyActivityViewCell.h"
#import "AMergeHomeMember.h"
#import "AHomeMember.h"


#define margin_left_size    20.
#define margin_top_size     25.

#define margin_space_size   10.
#define width_line          120.

@implementation ACurrentLyActivityViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _caview = [[UIImageView alloc]initWithFrame:CGRectMake(15, 1, SCREEN_WIDTH-2*15, [ACurrentLyActivityViewCell heightForCell]-10)];
    [_caview.layer setMasksToBounds:YES];
    [_caview.layer setCornerRadius:5.0];
    [_caview.layer setBorderWidth:.3];
    [_caview.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self addSubview:_caview];
    
    //
    _leftTitleLabel = [[UILabel alloc]init];
    [_leftTitleLabel setTextColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:1.]];
    [_leftTitleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [_caview addSubview:_leftTitleLabel];
    
    _leftLineLabel = [[UILabel alloc]init];
    [_leftLineLabel setBackgroundColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:1.]];
    [_caview addSubview:_leftLineLabel];
    
    _goodatLabel = [[UILabel alloc]init];
    [_goodatLabel setFont:ahomefontWithSize(12.)];
    [_goodatLabel setTextColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:1.]];
    _goodatLabel.numberOfLines = 0;
    [_caview addSubview:_goodatLabel];
    
    //
    _rightTitleLabel = [[UILabel alloc]init];
    [_rightTitleLabel setTextColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:1.]];
    [_rightTitleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [_caview addSubview:_rightTitleLabel];
    
    _rightLineLabel = [[UILabel alloc]init];
    [_rightLineLabel setBackgroundColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:1.]];
    [_caview addSubview:_rightLineLabel];
    
    _cativeLabel = [[UILabel alloc]init];
    [_cativeLabel setFont:ahomefontWithSize(12.)];
    [_cativeLabel setTextColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:1.]];
    _cativeLabel.numberOfLines = 0;
    [_caview addSubview:_cativeLabel];

    return self;
}

- (void)setDataForCell:(id)member {
    NSString *lelfTitle = @"擅长";
    [_leftTitleLabel setText:lelfTitle];
    CGSize titleSize = CGSizeMake(width_line, 20000.0f);
    NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:_leftTitleLabel.font, NSFontAttributeName,nil];
    titleSize =[_leftTitleLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_leftTitleLabel setFrame:CGRectMake(margin_left_size, margin_top_size, titleSize.width, titleSize.height)];
    
    [_leftLineLabel setFrame:CGRectMake(_leftTitleLabel.frame.origin.x, 5+_leftTitleLabel.frame.origin.y+_leftTitleLabel.frame.size.height, width_line, .5)];
    
    NSString *goodat;
    NSString *cactive;
    if ([member isKindOfClass:[AMergeHomeMember class]]) {
        //AMergeHomeMember *mergeMember = (AMergeHomeMember*)member;
        goodat = @"这人一无事处，在这么重要的地方留下空白";
        cactive = @"福布斯为您带来最新的新闻动态,并集中搜索所有有关马云的新闻资讯和评论。";
        
    } else if ([member isKindOfClass:[AHomeMember class]]) {
        //AHomeMember *homeMember = (AHomeMember*)member;
        goodat = @"这人一无事处，在这么重要的地方留下空白";
        cactive = @"福布斯为您带来最新的新闻动态,并集中搜索所有有关马云的新闻资讯和评论。";
    }
    
    [_goodatLabel setText:goodat];
    titleSize = CGSizeMake(_caview.frame.size.width/2-margin_left_size*2, 20000.0f);
    tdic = [NSDictionary dictionaryWithObjectsAndKeys:_goodatLabel.font, NSFontAttributeName,nil];
    titleSize =[_goodatLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_goodatLabel setFrame:CGRectMake(_leftTitleLabel.frame.origin.x, _leftLineLabel.frame.origin.y+margin_space_size, titleSize.width, titleSize.height)];
    
    
    NSString *rightTitle = @"最近相关";
    [_rightTitleLabel setText:rightTitle];
    titleSize = CGSizeMake(width_line, 20000.0f);
    tdic = [NSDictionary dictionaryWithObjectsAndKeys:_rightTitleLabel.font, NSFontAttributeName,nil];
    titleSize =[_rightTitleLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_rightTitleLabel setFrame:CGRectMake(_caview.frame.size.width/2.+margin_left_size, margin_top_size, titleSize.width, titleSize.height)];
    
    [_rightLineLabel setFrame:CGRectMake(_rightTitleLabel.frame.origin.x, 5+_rightTitleLabel.frame.origin.y+_rightTitleLabel.frame.size.height, width_line, .5)];
    
    [_cativeLabel setText:cactive];
    titleSize = CGSizeMake(_caview.frame.size.width/2-margin_left_size*2, 20000.0f);
    tdic = [NSDictionary dictionaryWithObjectsAndKeys:_cativeLabel.font, NSFontAttributeName,nil];
    titleSize =[_cativeLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_cativeLabel setFrame:CGRectMake(_rightLineLabel.frame.origin.x, _rightLineLabel.frame.origin.y+margin_space_size, titleSize.width, titleSize.height)];
}



+ (float)heightForCell {
    return 150.;
}

@end
