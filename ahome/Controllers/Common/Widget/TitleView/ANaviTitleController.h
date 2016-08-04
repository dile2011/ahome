//
//  ANaviTitleController.h
//  ahome
//
//  Created by andson-dile on 15/6/16.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANaviTitleController : UIViewController<UITableViewDataSource,UITableViewDelegate> {
    UITableView *_pullTable;
}

@property (nonatomic,retain)NSMutableArray *items;

- (instancetype)initWithItems:(NSArray*)items;
- (void)closePullMenu;

@end
