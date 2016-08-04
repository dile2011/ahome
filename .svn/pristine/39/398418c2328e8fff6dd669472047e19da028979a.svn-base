//
//  APhoneAuthButtonElement.m
//  ahome
//
//  Created by dilei liu on 15/2/13.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "APhoneAuthButtonElement.h"
#import "APhoneAuthButtonElementView.h"

@implementation APhoneAuthButtonElement

- (instancetype)initWithWidth:(float)width {
    self = [super init];
    _width = width;
    
    return self;
}

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    APhoneAuthButtonElementView *cell = (APhoneAuthButtonElementView *) [super getCellForTableView:tableView controller:controller];
    if (cell.qControllerDelegate == nil) [cell setQControllerDelegate:controller];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (QTableViewCell *)getOrCreateEmptyCell:(QuickDialogTableView *)tableView {
    APhoneAuthButtonElementView *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
    
    if (cell == nil){
        if (self.buttonTitle.length > 0) {
            cell = [[APhoneAuthButtonElementView alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class] andButtonTitle:self.buttonTitle andWidth:_width];
        } else {
            cell = [[APhoneAuthButtonElementView alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
        }
        
        UIColor *bcolor = [UIColor colorWithRed:249./255. green:249./255. blue:249./255. alpha:1.0];
        [cell.contentView setBackgroundColor:bcolor];
    }
    
    return cell;
}


@end
