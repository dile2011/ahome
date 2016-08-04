//
//  AInviteMemberInfoElement.m
//  Ahome
//
//  Created by dilei liu on 14/12/22.
//  Copyright (c) 2014年 siwei. All rights reserved.
//

#import "AInviteMemberInfoElement.h"
#import "AInviteMemberInfoElementView.h"
#import "ANewHomeInviteController.h"

@implementation AInviteMemberInfoElement

- (QRootElement *)initWithInviteMemberInfo:(AInviteMember*)inviteMember; {
    self = [super init];
    self.inviteMember = inviteMember;
    
    return self;
}

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    AInviteMemberInfoElementView *cell = (AInviteMemberInfoElementView *) [super getCellForTableView:tableView controller:controller];
    if (cell.qControllerDelegate == nil) [cell setQControllerDelegate:controller];
    cell.rightUtilityButtons = [self rightButtons];
    cell.delegate = (ANewHomeInviteController*)controller;
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (QTableViewCell *)getOrCreateEmptyCell:(QuickDialogTableView *)tableView {
    AInviteMemberInfoElementView *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
    
    if (cell == nil){
        cell = [[AInviteMemberInfoElementView alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
        [cell.contentView setBackgroundColor:[UIColor whiteColor]];
    }
    
    [cell setDataForCell:_inviteMember];
    
    return cell;
}

- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    return [AInviteMemberInfoElementView heightForCell];
}

- (NSArray *)rightButtons {
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                title:@"删除"];
    
    return rightUtilityButtons;
}


@end
