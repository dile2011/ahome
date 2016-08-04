//
//  ANewHomeInviteRoleElementView.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-3.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANewHomeInviteRoleElementView.h"
#import "AInviteActionMemberController.h"
#import "AHomeRoleServer.h"
#import "AInviteMember.h"
#import "AHomeRole.h"

#define role_block_width    60

@implementation ANewHomeInviteRoleElementView

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string andRole:(NSString*)role andSelRoles:(NSArray*)selRoles {
    self = [super initWithReuseIdentifier:string];
    float H = [ANewHomeInviteRoleElementView heightForCell];

    NSArray *roleNames = [[AServerFactory getServerInstance:@"AHomeRoleServer"]selectAllRecord];
    NSMutableArray *localRoleNames = [NSMutableArray arrayWithArray:roleNames];
    
    NSString *reRole1 = @"";
    NSString *reRole2 = @"";
    
    if ([role isEqualToString:@"家父"] || [role isEqualToString:@"家母"]) {
        reRole1 = role;
    }
    
    for (AInviteMember *im in selRoles) {
        if ([im.rolename isEqualToString:@"家父"] || [im.rolename isEqualToString:@"家母"]) {
            if (![reRole1 isEqualToString:im.rolename]) {
                reRole2 = im.rolename;
                break;
            }
        }
    }
    
    for (int i =0; i<localRoleNames.count; i++) {
        AHomeRole *homeRole = (AHomeRole*)[localRoleNames objectAtIndex:i];
        NSString *roleName = homeRole.roleName;
        
        CGRect rect = CGRectMake(i*(15+role_block_width)+20, 5, role_block_width, H-2*5);
        UIButton *parentsSelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        parentsSelButton.tag = (i+1);
        [parentsSelButton setFrame:rect];
        parentsSelButton.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        [parentsSelButton setTitle:roleName forState:UIControlStateNormal];
        [parentsSelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [parentsSelButton setBackgroundImage:[UIImage imageNamed:@"NewAtHome_Base_RoleDef.png"] forState:UIControlStateNormal];
        [parentsSelButton setBackgroundImage:[UIImage imageNamed:@"NewAtHome_Base_RoleSel.png"] forState:UIControlStateHighlighted];
        [parentsSelButton addTarget:self action:@selector(roleParentsAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:parentsSelButton];
        
        if ([roleName isEqual:reRole1])[parentsSelButton setEnabled:NO];
        if ([roleName isEqual:reRole2])[parentsSelButton setEnabled:NO];
    }

    return self;
}

- (void)roleParentsAction:(UIButton*)button {
    if (button.selected)return;
    [button setSelected:!button.selected];
    
    NSString *buttonImageName_0 = @"NewAtHome_Base_RoleDef.png";
    NSString *buttonImageName_1 = @"NewAtHome_Base_RoleSel.png";
    if (button.selected) {
        buttonImageName_0 = @"NewAtHome_Base_RoleSel.png";
        buttonImageName_1 = @"NewAtHome_Base_RoleDef.png";
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    [button setBackgroundImage:[UIImage imageNamed:buttonImageName_0] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:buttonImageName_1] forState:UIControlStateHighlighted];
    
    for (UIButton *otherButton in self.contentView.subviews) {
        if (otherButton == button) continue;
        
        otherButton.selected = !button.selected;
        [otherButton setBackgroundImage:[UIImage imageNamed:buttonImageName_1] forState:UIControlStateNormal];
        [otherButton setBackgroundImage:[UIImage imageNamed:buttonImageName_0] forState:UIControlStateHighlighted];
        
        [otherButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
    
    self.roleName = button.titleLabel.text;
    [((AInviteActionMemberController*)self.qControllerDelegate) checkInviteInfo];
}

+ (float)heightForCell {
    return 50;
}


@end
