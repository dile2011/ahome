//
//  ANewAtHomeInviteRoleElement.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-3.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANewHomeInviteRoleElement.h"
#import "ANewHomeInviteRoleElementView.h"

@implementation ANewHomeInviteRoleElement

- (QRootElement *)initWithRole:(NSString*)role andSelRoles:(NSArray*)selRoles {
    self = [super init];
    _role = role;
    _selRoles = selRoles;
    
    return self;
}

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    ANewHomeInviteRoleElementView *cell = (ANewHomeInviteRoleElementView *) [super getCellForTableView:tableView controller:controller];
    if (cell.qControllerDelegate == nil) [cell setQControllerDelegate:controller];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (QTableViewCell *)getOrCreateEmptyCell:(QuickDialogTableView *)tableView {
    ANewHomeInviteRoleElementView *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
    
    if (cell == nil){
        cell = [[ANewHomeInviteRoleElementView alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class] andRole:_role andSelRoles:_selRoles];
    }
    
    return cell;
}

- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    return [ANewHomeInviteRoleElementView heightForCell];
}

@end
