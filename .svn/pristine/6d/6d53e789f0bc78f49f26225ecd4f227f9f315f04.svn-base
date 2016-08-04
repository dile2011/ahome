//
//  ARegisterFinishButtonElement.m
//  Ahome
//
//  Created by dilei liu on 14/11/28.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ARegisterFinishButtonElement.h"
#import "ARegisterFinishButtonView.h"

@implementation ARegisterFinishButtonElement

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    ARegisterFinishButtonView *cell = (ARegisterFinishButtonView *) [super getCellForTableView:tableView controller:controller];
    if (cell.qControllerDelegate == nil) [cell setQControllerDelegate:controller];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (QTableViewCell *)getOrCreateEmptyCell:(QuickDialogTableView *)tableView {
    ARegisterFinishButtonView *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
    
    if (cell == nil){
        cell = [[ARegisterFinishButtonView alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
        UIColor *bcolor = [UIColor colorWithRed:249./255. green:249./255. blue:249./255. alpha:1.0];
        [cell.contentView setBackgroundColor:bcolor];
    }
    
    return cell;
}

- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    return [ARegisterFinishButtonView heightForCell];
}

@end
