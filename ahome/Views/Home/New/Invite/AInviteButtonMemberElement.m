//
//  AInviteButtonMemberElement.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-2.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AInviteButtonMemberElement.h"
#import "AInviteButtonMemberElementView.h"

@implementation AInviteButtonMemberElement

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    AInviteButtonMemberElementView *cell = (AInviteButtonMemberElementView *) [super getCellForTableView:tableView controller:controller];
    if (cell.qControllerDelegate == nil) [cell setQControllerDelegate:controller];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (QTableViewCell *)getOrCreateEmptyCell:(QuickDialogTableView *)tableView {
    AInviteButtonMemberElementView *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
    
    if (cell == nil){
        cell = [[AInviteButtonMemberElementView alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
        UIColor *bcolor = [UIColor colorWithRed:249./255. green:249./255. blue:249./255. alpha:1.0];
        [cell.contentView setBackgroundColor:bcolor];
    }
    
    return cell;
}

- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    return [AInviteButtonMemberElementView heightForCell];
}


@end
