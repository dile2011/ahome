//
//  AAreaPickViewElement.m
//  AtHomeApp
//
//  Created by dilei liu on 14-10-3.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AAreaPickViewElement.h"
#import "AAreaPickViewElementView.h"

@implementation AAreaPickViewElement

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    
    AAreaPickViewElementView *cell = [tableView dequeueReusableCellWithIdentifier:@"AAreaPickViewElement"];
    if (cell==nil){
        cell = [[AAreaPickViewElementView alloc] init];
    }
    
    [cell prepareForElement:self inTableView:tableView];
    cell.selectionStyle = self.enabled ? UITableViewCellSelectionStyleBlue : UITableViewCellSelectionStyleNone;
    cell.textField.enabled = self.enabled;
    cell.textField.userInteractionEnabled = self.enabled;
    cell.imageView.image = self.image;
    cell.labelingPolicy = self.labelingPolicy;
    
    cell.textLabel.font = [UIFont systemFontOfSize:17];
    
    return cell;
}

@end
