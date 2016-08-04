//
//  AppDelegate.m
//  ahome
//
//  Created by dilei liu on 15/1/10.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AppDelegate.h"
#import "AStarViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    AStarViewController *rootController = [AStarViewController sharedInstance];
    UINavigationController *rootNavi = [[UINavigationController alloc]initWithRootViewController:rootController];
    [rootNavi setNavigationBarHidden:YES];
    self.window.rootViewController = rootNavi;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
