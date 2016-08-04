//
//  AQTableViewCell.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-30.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "QTableViewCell.h"
#import "AQuickControllerDelegate.h"

@interface AQTableViewCell : UITableViewCell

@property (nonatomic,assign)id<AQuickControllerDelegate> qControllerDelegate;

- (void)setDataForCell:(id)data;
+ (float)heightForCell;

@end
