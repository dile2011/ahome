//
//  ANextActionButton.m
//  Ahome
//
//  Created by dilei liu on 14-11-18.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANextActionButtonElement.h"
#import "ANextActionButtonElementView.h"

@implementation ANextActionButtonElement

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    ANextActionButtonElementView *cell = (ANextActionButtonElementView *) [super getCellForTableView:tableView controller:controller];
    if (cell.qControllerDelegate == nil) [cell setQControllerDelegate:controller];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (QTableViewCell *)getOrCreateEmptyCell:(QuickDialogTableView *)tableView {
    ANextActionButtonElementView *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
    
    if (cell == nil){
        if (_buttonTitle.length > 0) {
            cell = [[ANextActionButtonElementView alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class] andButtonTitle:_buttonTitle];
        } else {
            cell = [[ANextActionButtonElementView alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
        }
        
        UIColor *bcolor = [UIColor colorWithRed:249./255. green:249./255. blue:249./255. alpha:1.0];
        [cell.contentView setBackgroundColor:bcolor];
    }

    return cell;
}

- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    return [ANextActionButtonElementView heightForCell];
}

@end
