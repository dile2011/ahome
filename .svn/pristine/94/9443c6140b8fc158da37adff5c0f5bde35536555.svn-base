//
//  ANewHomeController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-30.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANewHomeController.h"
#import "AInviteActionMemberController.h"
#import "ACommunitySelController.h"
#import "AHomeLevelController.h"

#define progressview_size_height    70
#define newPart_view_num            4 // 注册路标页数

@implementation ANewHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新建家庭";
    _createHomeForm = [[ANewHomeForm alloc]init];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (_newAthomeProgressView) return;
    
    _newAthomeProgressView = [[ANewHomeProgressView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, progressview_size_height)];
    [_newAthomeProgressView setBackgroundColor:self.view.backgroundColor];
    [self.view addSubview:_newAthomeProgressView];
    
    _mainScrollView = [[AMainScrollView alloc]initWithFrame:CGRectMake(0, _newAthomeProgressView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height -progressview_size_height) andPageNo:newPart_view_num];
    _mainScrollView.delegate = self;
    [_mainScrollView setBackgroundColor:self.view.backgroundColor];
    [self.view addSubview:_mainScrollView];
    
    UIView *newAtHomeBaseView = [_mainScrollView getPageByIndex:NewAtHomeBaseForm];
    _baseInfoCon = [[ANewHomeBaseInfoController alloc]init];
    _baseInfoCon.delegate = self;
    [_baseInfoCon.view setFrame:CGRectMake(0, 0, _mainScrollView.frame.size.width, _mainScrollView.frame.size.height)];
    [newAtHomeBaseView addSubview:_baseInfoCon.view];
    
    UIView *newAtHomeAreaView = [_mainScrollView getPageByIndex:NewAtHomeAreaForm];
    _areaCon = [[ANewHomeAreaController alloc]init];
    _areaCon.delegate = self;
    [_areaCon.view setFrame:CGRectMake(0, 0, _mainScrollView.frame.size.width, _mainScrollView.frame.size.height)];
    [newAtHomeAreaView addSubview:_areaCon.view];
    
    UIView *newAtHomeInviteView = [_mainScrollView getPageByIndex:NewAtHomeInviteForm];
    _inviteCon = [[ANewHomeInviteController alloc]init];
    _inviteCon.delegate = self;
    [_inviteCon.view setFrame:CGRectMake(0, 0, _mainScrollView.frame.size.width, _mainScrollView.frame.size.height)];
    [newAtHomeInviteView addSubview:_inviteCon.view];
    
    UIView *newAtHomeFinishView = [_mainScrollView getPageByIndex:NewAtHomeFinishForm];
    _finishCon = [[ANewHomeFinishController alloc]init];
    _finishCon.delegate = self;
    [_finishCon.view setFrame:CGRectMake(0, 0, _mainScrollView.frame.size.width, _mainScrollView.frame.size.height)];
    [newAtHomeFinishView addSubview:_finishCon.view];
    
    self.navigationItem.titleView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

- (void)entryNextRegisterForm:(int)pageNo {
    _indexForhadStepForm = pageNo - 1;
    _indexForcurrentDisplayForm = pageNo;
    
    [_mainScrollView displayPageByindex:_indexForcurrentDisplayForm];
    [_newAthomeProgressView nextStepByIndex:_indexForcurrentDisplayForm];
}

- (void)doNextAction:(int)index {
    if (index == NewAtHomeEnd) {
        [[AHomeLevelController sharedInstance]updateHome];
        [self.navigationController dismissViewControllerAnimated:YES completion:^{}];
        
        return;
    }
    
    if (index == NewAtHomeFinishForm)[_finishCon setDataForElement];
    
    [self entryNextRegisterForm:index];
    [self changeBackBarButtonItem:index];
}

/**
 * 修改导航栏返回按钮
 */
- (void)changeBackBarButtonItem:(int)index {
    _indexForcurrentDisplayForm = index;
    
    FRDLivelyButton *leftBarButton = [[FRDLivelyButton alloc] initWithFrame:CGRectMake(0,0,28,28)];;
    if (index != 0) [leftBarButton setStyle:kFRDLivelyButtonStyleArrowLeft animated:YES];
    else[leftBarButton setStyle:kFRDLivelyButtonStyleClose animated:YES];
    
    [leftBarButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarButton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                   target:nil action:nil];
    negativeSpacer.width = -10;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer, buttonItem];
}

- (void)leftButtonAction {
    if (_indexForcurrentDisplayForm == 0) {
        [super leftButtonAction];
        
    } else {
        [self backFormAction];
    }
}

/**
 * 注册页的返回行为
 */
- (void)backFormAction {
    [self hiddenKeyBoard];
    
    [_mainScrollView displayPageByindex:_indexForcurrentDisplayForm-1];
    _indexForcurrentDisplayForm = _indexForcurrentDisplayForm - 1;
    
    if (_indexForcurrentDisplayForm == 0) {
        [self changeBackBarButtonItem:_indexForcurrentDisplayForm];
    }
}

- (void)hiddenKeyBoard {
    [_baseInfoCon hiddenKeyBoard];
    [_areaCon hiddenKeyBoard];
    [_inviteCon hiddenKeyBoard];
    [_finishCon hiddenKeyBoard];
}

/**
 * 发送添加成员入口
 */
- (void)doInviteAction {
    NSString *roleName = self.createHomeForm.part;
    
    AInviteActionMemberController *inviteMemberCon = [[AInviteActionMemberController alloc]initWithRoleName:roleName andSelRoles:_inviteCon.inviteMembers];
    inviteMemberCon.isPush = NO;
    UINavigationController *inviteNavi = [[UINavigationController alloc]initWithRootViewController:inviteMemberCon];
    inviteNavi.navigationBar.translucent = NO;
    [self.navigationController presentViewController:inviteNavi animated:YES completion:^{
        
    }];
}

- (void)doSelCommunity:(NSString*)cityCode districtCode:(NSString*)districtCode andRegion:(NSString *)region {
    ACommunitySelController *communitySelCon = [[ACommunitySelController alloc]initWithCityCode:cityCode districtCode:districtCode andRegion:region];
    
    __weak typeof(self) weakSelf = self;
    communitySelCon.onSelected = ^(NSDictionary *regionInfo){
        weakSelf.createHomeForm.region = [regionInfo objectForKey:@"region"];
        weakSelf.createHomeForm.region_code = [regionInfo objectForKey:@"regionCode"];
        weakSelf.createHomeForm.region_name = [regionInfo objectForKey:@"region_name"];
        weakSelf.createHomeForm.city_code = [regionInfo objectForKey:@"cityCode"];
        
        [_areaCon setRegionValue:weakSelf.createHomeForm.region_name];
        
        NSString *flag = [regionInfo objectForKey:@"flag"];
        if (flag.length > 0)  [self.navigationController popViewControllerAnimated:YES];
    };
    [self.navigationController pushViewController:communitySelCon animated:YES];
}

@end
