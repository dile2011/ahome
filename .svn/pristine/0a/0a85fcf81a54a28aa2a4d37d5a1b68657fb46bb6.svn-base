//
//  ACommunitySelController.h
//  AtHomeApp
//
//  Created by dilei liu on 14-10-5.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ABaseViewController.h"
#import "HZActivityIndicatorView.h"
#import "ASearchBar.h"

// UITableViewDataSource,UITableViewDelegate
@interface ACommunitySelController : ABaseViewController<UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate> {
    /**
     * 搜索栏定义，封装常用功能
     */
    ASearchBar *_theSearchBar;
    
    NSString *_cityCode; // 城市ID
    NSString *_regionCode; // 地区代码
    NSString *_region; // 地区
    NSString *_region_name; // 街道或楼盘
    
    UICollectionView *_tableView;
    NSMutableArray *_regionData;
    
    
    BOOL _isPopNewRegion;
    
}

@property (nonatomic,retain) HZActivityIndicatorView *activityIndicator;
@property(nonatomic, copy) void (^onSelected)(NSDictionary *regioninfo);

- (instancetype)initWithCityCode:(NSString*)cityCode districtCode:(NSString*)districtCode andRegion:(NSString*)region;


@end
