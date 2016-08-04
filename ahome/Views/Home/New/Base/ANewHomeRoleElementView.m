//
//  ANewHomeRoleElementView.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-1.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANewHomeRoleElementView.h"
#import "AHomeRole.h"
#import "AHomeRoleServer.h"
#import "ANewHomeBaseInfoController.h"

#define role_block_width   60

@implementation ANewHomeRoleElementView

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string {
    self = [super initWithReuseIdentifier:string];
    float H = [ANewHomeRoleElementView heightForCell];
    
    NSArray *roleNames = [[AServerFactory getServerInstance:@"AHomeRoleServer"]selectAllRecord];
    for (int i =0; i<roleNames.count; i++) {
        AHomeRole *homeRole = (AHomeRole*)[roleNames objectAtIndex:i];
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
    
    ANewHomeBaseInfoController *baseInfoCon = (ANewHomeBaseInfoController*)self.qControllerDelegate;
    int roleIndex = (int)button.tag;
    [baseInfoCon setRoleForNewHome:roleIndex andRoleName:button.titleLabel.text];
}


+ (float)heightForCell {
    return 50;
}

@end
