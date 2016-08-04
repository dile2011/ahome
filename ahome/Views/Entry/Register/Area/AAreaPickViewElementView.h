//
//  AAreaPickViewElementView.h
//  AtHomeApp
//
//  Created by dilei liu on 14-10-3.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "QEntryTableViewCell.h"
#import "HZAreaPickerView.h"

@interface AAreaPickViewElementView : QEntryTableViewCell<HZAreaPickerDelegate>

@property(nonatomic, retain) UILabel *centeredLabel;
@property(nonatomic,retain) NSString *cityCode;
@property(nonatomic,retain) NSString *districtCode;

@property(nonatomic,retain) HZAreaPickerView *areaPicker;


@end
