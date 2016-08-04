//
//  AHomeTitleViewCell.m
//  ahome
//
//  Created by andson-dile on 15/6/16.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHomeTitleViewCell.h"
#import "AHomeTitle.h"

@implementation AHomeTitleViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _titleImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_titleImageView];
    
    _titleLabel = [[UILabel alloc]init];
    [_titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [_titleLabel setTextColor:[UIColor whiteColor]];
    _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _titleLabel.numberOfLines = 1;
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:_titleLabel];
    
    _confirmImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_confirmImageView];
    
    return self;
}

- (void)setDataForCell:(ARecord*)record {
    AHomeTitle *homeTitle = (AHomeTitle*)record;
    
    _titleImageView.image = [UIImage imageNamed:homeTitle.cellimage];
    [_titleImageView setFrame:CGRectMake(15, ([AHomeTitleViewCell heightForCell]-_titleImageView.image.size.height)/2., _titleImageView.image.size.width, _titleImageView.image.size.height)];
    
    
    [_titleLabel setText:homeTitle.title];
    CGSize titleSize = CGSizeMake(self.contentView.frame.size.width, 20000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:_titleLabel.font, NSFontAttributeName,nil];
    titleSize =[_titleLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_titleLabel setFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-titleSize.width)/2., ([AHomeTitleViewCell heightForCell]-titleSize.height)/2., titleSize.width, titleSize.height)];
}


+ (float)heightForCell {
    return 50.;
}

@end
