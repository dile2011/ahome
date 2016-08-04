//
//  AEntryViewController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-24.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AEntryViewController.h"
#import "AGuideViewController.h"
#import "ALoginViewController.h"
#import "ARegisterViewController.h"

#define operaeview_size_height  150
#define btn_margin_size         15
#define btn_size_height         45

@implementation AEntryViewController


static AEntryViewController *sharedInstance = nil;
+ (id)sharedInstance {
    if(sharedInstance == nil) {
        sharedInstance = [[AEntryViewController alloc] init];
    }
    
    return sharedInstance;
}

+ (void)destroyDealloc {
    sharedInstance = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [[AStarViewController sharedInstance]updateStatuBarColorByStyle:UIStatusBarStyleDefault];
    
}

/**
 * 触发登录按钮
 */
- (void)doLoginAction {
    ALoginViewController *loginController = [[ALoginViewController alloc]init];
    UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginController];
    [self presentViewController:loginNav animated:YES completion:^{
        [[AStarViewController sharedInstance]updateStatuBarColorByStyle:UIStatusBarStyleLightContent];
    }];
}

/**
 * 触发注册按钮
 */
- (void)doRegisterAction {
    ARegisterViewController *registerController = [[ARegisterViewController alloc]init];
    UINavigationController *registerNav = [[UINavigationController alloc]
                                           initWithRootViewController:registerController];
    [self presentViewController:registerNav animated:YES completion:^{
        [[AStarViewController sharedInstance]updateStatuBarColorByStyle:UIStatusBarStyleLightContent];
    }];
    
}


@end
