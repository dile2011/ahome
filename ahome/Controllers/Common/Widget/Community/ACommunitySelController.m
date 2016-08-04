//
//  ACommunitySelController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-10-5.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ACommunitySelController.h"
#import "ANewCommunityController.h"
#import "ARegionServer.h"
#import "ARegisterServer.h"
#import "ANewCommunityController.h"
#import "ACommunityCell.h"
#import "FRDLivelyButton.h"

#define searchBar_size_width   [[UIScreen mainScreen] bounds].size.width*5/6.

@implementation ACommunitySelController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (instancetype)initWithCityCode:(NSString*)cityCode districtCode:(NSString*)districtCode andRegion:(NSString *)region {
    self = [super init];
    _isPopNewRegion = NO;
    
    _cityCode = cityCode;
    _regionCode = districtCode;
    _region = region;
    _regionData = [NSMutableArray array];
    
    return self;
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (_tableView != nil) return;
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(10.0f, 10.0f, 10.0, 10.0);

    if (self.view.frame.size.width == 320) {    // iphone4
        flowLayout.itemSize = CGSizeMake(90.0f, 80.0);
    } else if (self.view.frame.size.width == 375) { // iphone 6
        flowLayout.itemSize = CGSizeMake(80.0f, 100.0);
    } else if (self.view.frame.size.width == 414) { // iphone 6pulus
        flowLayout.itemSize = CGSizeMake(120.0f, 100.0);
    }
    
    
    [flowLayout setMinimumInteritemSpacing:10.0f];
    [flowLayout setMinimumLineSpacing:10.0f];
    
    _tableView = [[UICollectionView alloc] initWithFrame:
                       CGRectMake(0, 0, self.view.frame.size.width,
                                  self.view.frame.size.height) collectionViewLayout:flowLayout];
    [_tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [_tableView setBackgroundColor:[UIColor whiteColor]];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

    _theSearchBar = [[ASearchBar alloc]initWithFrame:CGRectMake(self.view.frame.size.width-searchBar_size_width,22.0f,searchBar_size_width,0.0f)];
    _theSearchBar.showsCancelButton = YES;
    UIColor *bgColor = [UIColor colorWithRed:64./255.0 green:138.0/255 blue:57.0/255. alpha:1.0];
    [_theSearchBar resetPropertyByBgColor:bgColor andplaceHolderColor:[UIColor whiteColor] andLeftImageName:@""];
    _theSearchBar.tintColor = [UIColor colorWithRed:102./255.0 green:152.0/255 blue:73.0/255. alpha:1.0];
    _theSearchBar.barTintColor = [UIColor whiteColor];
    [_theSearchBar becomeFirstResponder];
    _theSearchBar.delegate = self;
    _theSearchBar.showsScopeBar = YES;
    
    self.navigationItem.titleView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.navigationController.navigationBar addSubview:_theSearchBar];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (!_isPopNewRegion)[_theSearchBar removeFromSuperview];
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [_theSearchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_theSearchBar resignFirstResponder];
    [[AUtilities sharedInstance]popTarget:_tableView];
    [[AServerFactory getServerInstance:@"ARegionServer"]doSearchRegionByCidyCode:_cityCode
                                                                 andDistrictCode:_regionCode
                                                                   andRegionName:searchBar.text
                                                                        callback:^(NSArray *data) {
                                                                            [[AUtilities sharedInstance]dismiss];
                                                                            [_regionData removeAllObjects];
                                                                            
                                                                            [_regionData addObjectsFromArray:data];
                                                                            [_regionData addObject:@"创建社区"];
                                                                                
                                                                            [_tableView reloadData];
                                                                        } failureCallback:^(NSString *resp) {
                                                                            [_theSearchBar resignFirstResponder];
                                                                                
                                                                        }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _regionData.count>0?_regionData.count:0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *itemIdentity = @"cellIdentity";
    [collectionView registerClass:NSClassFromString(@"ACommunityCell") forCellWithReuseIdentifier:itemIdentity];
    ACommunityCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentity" forIndexPath:indexPath];
    
    _region_name = [_regionData objectAtIndex:indexPath.row];
    
    BOOL isNewFlag = NO;
    if (indexPath.row == _regionData.count-1)isNewFlag = YES;
    
    [cell setDataForCell:_region_name isNewFlag:isNewFlag];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != _regionData.count-1) {
        _region_name = [_regionData objectAtIndex:indexPath.row];
        NSDictionary *regionInfo = @{@"region":_region,@"region_name":_region_name,@"cityCode":_cityCode,@"regionCode":_regionCode};
        _onSelected(regionInfo);
        [self.navigationController popViewControllerAnimated:YES];
        
    } else {
        [self doNewRegionAction];
    }
}

- (void)doNewRegionAction {
    _isPopNewRegion = YES;
    
    ANewCommunityController *newRegion = [[ANewCommunityController alloc]initWithRgionCode:_regionCode andCityCode:_cityCode andRegion:_region andDelegate:self];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:newRegion];
    [self.navigationController presentViewController:navi animated:YES completion:^{
        _isPopNewRegion = NO;
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_theSearchBar resignFirstResponder];
}

- (void)setDefaultNavigationStyle {
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:19.0], NSFontAttributeName, nil]];
    
    UIColor *navBgColor = [UIColor colorWithRed:102./255.0 green:152.0/255 blue:73.0/255. alpha:1.0];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBarTintColor:navBgColor];
    self.navigationController.navigationBar.translucent = NO;
}


@end
