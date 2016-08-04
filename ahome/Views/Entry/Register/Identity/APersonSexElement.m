//
//  APersonSexElement.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-28.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "APersonSexElement.h"
#import "APersonSecElementView.h"

@implementation APersonSexElement

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    APersonSecElementView *cell = (APersonSecElementView *) [super getCellForTableView:tableView controller:controller];
    if (cell.qControllerDelegate == nil) [cell setQControllerDelegate:controller];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (QTableViewCell *)getOrCreateEmptyCell:(QuickDialogTableView *)tableView {
    APersonSecElementView *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
    
    if (cell == nil){
        cell = [[APersonSecElementView alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
    }
    
    return cell;
}

- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    return [APersonSecElementView heightForCell];
}

@end
