//
//  AMemberInfoViewCell.m
//  ahome
//
//  Created by andson-dile on 15/8/4.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AMemberInfoViewCell.h"
#import "AMergeHomeMember.h"
#import "AHomeMember.h"

@implementation AMemberInfoViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    CGFloat avaterImageSize = 80;
    CGRect avaterRect = CGRectMake(([UIScreen mainScreen].bounds.size.width-avaterImageSize)/2,
                                   ([AMemberInfoViewCell heightForCell]-avaterImageSize)/2, avaterImageSize, avaterImageSize);
    _avaterImageView = [[PAImageView alloc]initWithFrame:avaterRect backgroundProgressColor:[UIColor whiteColor] progressColor:[UIColor whiteColor]];
    [self addSubview:_avaterImageView];

    return self;
}

- (void)setDataForCell:(id)member {
    NSString *avater;
    
    if ([member isKindOfClass:[AMergeHomeMember class]]) {
        AMergeHomeMember *mergeMember = (AMergeHomeMember*)member;
        avater = mergeMember.avatar;
        
    } else if ([member isKindOfClass:[AHomeMember class]]) {
        AHomeMember *homeMember = (AHomeMember*)member;
        avater = homeMember.avatar;
    }
    
    [_avaterImageView setImageURL:avater];
}

+ (float)heightForCell {
    return 130.;
}

@end
