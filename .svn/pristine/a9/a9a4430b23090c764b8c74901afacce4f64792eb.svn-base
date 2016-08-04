//
//  AInviteMemberInfoElementView.m
//  Ahome
//
//  Created by dilei liu on 14/12/22.
//  Copyright (c) 2014年 siwei. All rights reserved.
//

#import "AInviteMemberInfoElementView.h"
#import "AInviteMember.h"

#define labelFont_size  14

@implementation AInviteMemberInfoElementView

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string {
    self = [super initWithReuseIdentifier:string];
    [self initializer];
    
    _roleNameLabel = [[UILabel alloc]init];
    [_roleNameLabel setFont:[UIFont boldSystemFontOfSize:labelFont_size]];
    _roleNameLabel.textAlignment = NSTextAlignmentLeft;
    [_roleNameLabel setTextColor:[UIColor blackColor]];
    _roleNameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _roleNameLabel.numberOfLines = 1;
    [_roleNameLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:_roleNameLabel];
    
    _phoneLabel = [[UILabel alloc]init];
    [_phoneLabel setFont:[UIFont fontWithName:@"Heiti SC" size:12]];
    _phoneLabel.textAlignment = NSTextAlignmentLeft;
    [_phoneLabel setTextColor:[UIColor grayColor]];
    _phoneLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _phoneLabel.numberOfLines = 1;
    [_phoneLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:_phoneLabel];
    
    return self;
}

- (void)setDataForCell:(id)data {
    float H = [AInviteMemberInfoElementView heightForCell];
    AInviteMember *inviteMember = (AInviteMember*)data;
    
    [_roleNameLabel setText:inviteMember.rolename];
    CGSize titleSize = CGSizeMake(200, 20000.0f);
    NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:_roleNameLabel.font,
                          NSFontAttributeName,nil];
    titleSize =[_roleNameLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    float y = (H/2-titleSize.height);
    [_roleNameLabel setFrame:CGRectMake(15, y, titleSize.width, titleSize.height)];
    
    [_phoneLabel setText:inviteMember.phone];
    titleSize = CGSizeMake(200, 20000.0f);
    tdic = [NSDictionary dictionaryWithObjectsAndKeys:_phoneLabel.font, NSFontAttributeName,nil];
    titleSize =[_phoneLabel.text boundingRectWithSize:titleSize
                                                   options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading
                                                attributes:tdic context:nil].size;
    
    y = (H-titleSize.height)/2+10;
    [_phoneLabel setFrame:CGRectMake(15, y, titleSize.width, titleSize.height)];
}

+ (float)heightForCell {
    return 45;
}

@end
