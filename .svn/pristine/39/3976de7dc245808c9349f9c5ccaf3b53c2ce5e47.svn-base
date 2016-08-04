//
//  AauthCodeElement.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-30.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AauthCodeElement.h"
#import "AAauthCodeElementView.h"

@implementation AauthCodeElement

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    
    AAauthCodeElementView *cell = [tableView dequeueReusableCellWithIdentifier:@"QuickformEntryElement"];
    if (cell==nil){
        cell = [[AAauthCodeElementView alloc] init];
    }
    
    [cell applyAppearanceForElement:self];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textField.enabled = self.enabled;
    cell.textField.userInteractionEnabled = self.enabled;
    cell.textField.textAlignment = self.appearance.entryAlignment;
    cell.imageView.image = self.image;
    [cell prepareForElement:self inTableView:tableView];
    return cell;
}

- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    return [AAauthCodeElementView heightForCell];
}

@end
