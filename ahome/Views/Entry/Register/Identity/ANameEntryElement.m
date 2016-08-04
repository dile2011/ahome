//
//  ANameEntryElement.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-28.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANameEntryElement.h"
#import "ANameEntryElementView.h"

@implementation ANameEntryElement

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView
                              controller:(QuickDialogController *)controller {
    
    ANameEntryElementView *cell = [tableView dequeueReusableCellWithIdentifier:@"QuickformEntryElement"];
    if (cell==nil){
        cell = [[ANameEntryElementView alloc] init];

        _nameTextField = [[QTextField alloc] init];
        _nameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
        _nameTextField.borderStyle = UITextBorderStyleNone;
        _nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _nameTextField.autoresizingMask = ( UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        [_nameTextField setFrame:CGRectMake(cell.frame.size.width/2.+10, 10, cell.frame.size.width/2.0-20, [ANameEntryElementView heightForCell]-20)];
        _nameTextField.placeholder = @"名字";
        [cell setOTextField:_nameTextField element:self];
        [cell.contentView addSubview:_nameTextField];
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
    return [ANameEntryElementView heightForCell];
}

- (NSString*)getNameTextValue {
    return _nameTextField.text;
}


@end
