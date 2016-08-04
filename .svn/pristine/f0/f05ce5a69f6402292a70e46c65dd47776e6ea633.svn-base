//
//  ARootTableRefreshController.h
//  ahome
//
//  Created by andson-dile on 15/6/24.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APullRefreshView.h"
#import "ARootViewController.h"
#import "ATableRefreshController.h"

@interface ARootTableRefreshController : ARootViewController<UITableViewDataSource,UITableViewDelegate> {
    PullToRefreshState _pullState;
    BOOL _isLoading;
    BOOL _isTask;
    
    float _lastPosition;
    ScrollDirection _direction;
}

@property (nonatomic,retain)UITableView *tableView;
@property (strong, nonatomic) APullRefreshView *refreshImgView;


/**
 *  停止刷新状态
 */
-(void)stopLoading;
- (void)startLoading;

-(void)scrollViewDidScroll:(UIScrollView *)scrollView;

@end

