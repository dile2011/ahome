//
//  ANewAtHomeRoleElement.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-1.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANewHomeRoleElement.h"
#import "ANewHomeRoleElementView.h"

@implementation ANewHomeRoleElement

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    ANewHomeRoleElementView *cell = (ANewHomeRoleElementView *) [super getCellForTableView:tableView controller:controller];
    if (cell.qControllerDelegate == nil) [cell setQControllerDelegate:controller];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (QTableViewCell *)getOrCreateEmptyCell:(QuickDialogTableView *)tableView {
    ANewHomeRoleElementView *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
    
    if (cell == nil){
        cell = [[ANewHomeRoleElementView alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
    }
    
    return cell;
}

- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    return [ANewHomeRoleElementView heightForCell];
}

@end
