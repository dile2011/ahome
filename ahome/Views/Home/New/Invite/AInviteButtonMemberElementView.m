//
//  AInviteButtonMemberElementView.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-2.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AInviteButtonMemberElementView.h"

#define invite_button_size  200

@implementation AInviteButtonMemberElementView

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string {
    self = [super initWithReuseIdentifier:string];
    self.isShowSeparator = NO;
    float H = [AInviteButtonMemberElementView heightForCell];
    
    CGRect rect = CGRectMake(([UIScreen mainScreen].bounds.size.width-invite_button_size)/2, 5, invite_button_size, H-10);
    UIButton *inviteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    inviteButton.tag = 1000;
    [inviteButton setFrame:rect];
    inviteButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [inviteButton setTitle:@"添加成员" forState:UIControlStateNormal];
    [inviteButton setTitleColor:[UIColor colorWithRed:253./255 green:121./255. blue:36./255. alpha:1.0] forState:UIControlStateNormal];
    [inviteButton setBackgroundImage:[UIImage imageNamed:@"NewAtHome_Invite_Button.png"] forState:UIControlStateNormal];
    [inviteButton setBackgroundImage:[UIImage imageNamed:@"NewAtHome_Invite_ButtonSel.png"] forState:UIControlStateHighlighted];
    [inviteButton addTarget:self.qControllerDelegate action:@selector(doInviteAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:inviteButton];
    
    
    CALayer *separator = [CALayer layer];
    UIColor *bcolor = [UIColor colorWithRed:249./255. green:249./255. blue:249./255. alpha:1.0];
    separator.backgroundColor = bcolor.CGColor;
    separator.frame = CGRectMake(0, H-1, self.frame.size.width, 1);
    [self.layer addSublayer:separator];
    
    separator = [CALayer layer];
    separator.backgroundColor = bcolor.CGColor;
    separator.frame = CGRectMake(0, 0, self.frame.size.width, 1);
    [self.layer addSublayer:separator];
    
    return self;
}

- (void)doInviteAction {}


+ (float)heightForCell {
    return 50;
}
@end
