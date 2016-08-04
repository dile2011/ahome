//
//  ANewHomeImageElement.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-31.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANewHomeImageElement.h"
#import "ANewHomeImageElementView.h"

@implementation ANewHomeImageElement

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    ANewHomeImageElementView *cell = (ANewHomeImageElementView *) [super getCellForTableView:tableView controller:controller];
    cell.isShowSeparator = NO;
    if (cell.qControllerDelegate == nil) [cell setQControllerDelegate:controller];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (QTableViewCell *)getOrCreateEmptyCell:(QuickDialogTableView *)tableView {
    ANewHomeImageElementView *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
    
    if (cell == nil){
        cell = [[ANewHomeImageElementView alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
        UIColor *bcolor = [UIColor colorWithRed:249./255. green:249./255. blue:249./255. alpha:1.0];
        [cell.contentView setBackgroundColor:bcolor];
    }
    
    return cell;
}

- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    return [ANewHomeImageElementView heightForCell];
}

@end
