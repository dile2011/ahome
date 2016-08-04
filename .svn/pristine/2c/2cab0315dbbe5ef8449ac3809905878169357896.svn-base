//
//  ARegisterViewController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-24.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ARegisterViewController.h"
#import "AEntryViewController.h"
#import "ARegisterLocalServer.h"
#import "ACommunitySelController.h"

#import "ARegisterAccountForm.h"
#import "ARegisterIdentityForm.h"
#import "ARegisterAreaForm.h"
#import "ARegisterServer.h"
#import "FRDLivelyButton.h"

#define progressview_size_height    70
#define registerpart_view_num       4 // 注册路标页数

@implementation ARegisterViewController

- (instancetype)init {
    self = [super init];
    self.isPush = NO;
    
    _registerForm = [[ARegisterForm alloc]init];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注 册";
    
    CGSize viewSize = [[UIScreen mainScreen] bounds].size;
    viewSize = CGSizeMake(viewSize.width, viewSize.height - self.navigationController.navigationBar.frame.size.height-20);
    _mainScrollView = [[AMainScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, viewSize.height) andPageNo:registerpart_view_num];
    
    _accountCon = [[ARegisterAccountController alloc]init];
    _identityCon = [[ARegisterIdentityController alloc]init];
    _areaCon = [[ARegisterAreaController alloc]init];
    _finishCon = [[ARegisterFinishController alloc]init];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
        
    _mainScrollView.delegate = self;
    [_mainScrollView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:_mainScrollView];
    
    UIView *accountView = [_mainScrollView getPageByIndex:RegisterAccountForm];
    _accountCon.delegate = self;
    [_accountCon.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, _mainScrollView.frame.size.height)];
    [accountView addSubview:_accountCon.view];
    
    UIView *identityView = [_mainScrollView getPageByIndex:RegisterIdentityForm];
    _identityCon.delegate = self;
    [_identityCon.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, _mainScrollView.frame.size.height)];
    [identityView addSubview:_identityCon.view];
    
    UIView *areaView = [_mainScrollView getPageByIndex:RegisterAreaForm];
    _areaCon.delegate = self;
    [_areaCon.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, _mainScrollView.frame.size.height)];
    [areaView addSubview:_areaCon.view];
    
    UIView *finishView = [_mainScrollView getPageByIndex:RegisterFinishForm];
    _finishCon.delegate = self;
    [_finishCon.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, _mainScrollView.frame.size.height)];
    [finishView addSubview:_finishCon.view];
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

/**
 * 注册流程的下一页
 */
- (void)entryNextRegisterForm:(int)pageNo {
    _indexForcurrentDisplayForm = pageNo;
    [_mainScrollView displayPageByindex:pageNo];
}

/**
 * 注册流程的下一步
 */
- (void)doNextAction:(int)index {
    if (index == RegisterEnd) {
        [self dismissViewControllerAnimated:YES completion:^{
            [[AStarViewController sharedInstance]updateStatuBarColorByStyle:UIStatusBarStyleDefault];
            [[AEntryViewController sharedInstance]doLoginAction];
        }];
        return;
    }
    
    [self entryNextRegisterForm:index];
    if (index == RegisterFinishForm)[_finishCon setDataForElement];
    
    [self changeBackBarButtonItem:index];
}


/**
 * 注册的时候选择社区
 */
- (void)doSelCommunity:(NSString*)cityCode districtCode:(NSString*)districtCode andRegion:(NSString *)region {
    ACommunitySelController *communitySelCon = [[ACommunitySelController alloc]initWithCityCode:cityCode
                                                                                   districtCode:districtCode andRegion:region];
    communitySelCon.onSelected = ^(NSDictionary *regionInfo){
        _areaCon.regionInfo = regionInfo;
        NSString *regionName = [regionInfo objectForKey:@"region_name"];
        [_areaCon setRegionValue:regionName];
    };
    
    [self.navigationController pushViewController:communitySelCon animated:YES];
}


- (void)setRegisterData:(ARecord*)registerForm {
    if ([registerForm isKindOfClass:[ARegisterAccountForm class]]) {
        ARegisterAccountForm *accountForm = (ARegisterAccountForm*)registerForm;
        _registerForm.phone = accountForm.phone;
        _registerForm.password = accountForm.passwd;
    }
    
    if ([registerForm isKindOfClass:[ARegisterIdentityForm class]]) {
        ARegisterForm * regForm = (ARegisterForm*)registerForm;
        _registerForm = regForm;
    }
    
    if ([registerForm isKindOfClass:[ARegisterAreaForm class]]) {
        ARegisterAreaForm *areaForm = (ARegisterAreaForm*)registerForm;
        _registerForm.regionStr = areaForm.region;
        _registerForm.communityStr = areaForm.community;
    }
}

- (void)hiddenKeyBoard {
    [_accountCon hiddenKeyBoard];
    [_identityCon hiddenKeyBoard];
    [_finishCon hiddenKeyBoard];
    [_areaCon hiddenKeyBoard];
}

- (void)leftButtonAction {
    [[AStarViewController sharedInstance]updateStatuBarColorByStyle:UIStatusBarStyleDefault];
    if (_indexForcurrentDisplayForm == 0) {
        [self hiddenKeyBoard];
        [super leftButtonAction];
        
    } else {
        [self backFormAction];
    }
}

@end
