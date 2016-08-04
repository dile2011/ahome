//
//  AStarViewController.m
//  ahome
//
//  Created by dilei liu on 15/2/18.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AStarViewController.h"
#import "AEntryViewController.h"
#import "AMainRootController.h"

@implementation AStarViewController

+ (id)sharedInstance {
    static AStarViewController *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[AStarViewController alloc] init];
        sharedManager.statusBarStyle = UIStatusBarStyleLightContent;
    });
    
    return sharedManager;
}

- (instancetype)init {
    self = [super init];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];

    if([[AUtilities sharedInstance]isLogined]) {
        AMainRootController *mainRootController = [AMainRootController sharedInstance];
        [self.view addSubview:mainRootController.view];

    } else {
        AEntryViewController *entryController = [AEntryViewController sharedInstance];
        [self.view addSubview:entryController.view];
        [entryController beginAppearanceTransition:YES animated:NO];
        [entryController endAppearanceTransition];
    }
}

- (void)switchBusiness {
    [self removeSubView];
    
    [AMainRootController destroyDealloc];
    AMainRootController *mainRootController = [AMainRootController sharedInstance];
    [self.view addSubview:mainRootController.view];
    
    [mainRootController beginAppearanceTransition:YES animated:NO];
    [mainRootController endAppearanceTransition];
}

- (void)switchEntry {
    [self removeSubView];
    
    [AEntryViewController destroyDealloc];
    AEntryViewController *entryController = [AEntryViewController sharedInstance];
    [self.view addSubview:entryController.view];
    [self addChildViewController:entryController];
    [entryController didMoveToParentViewController:self];
}

- (void)removeSubView {
    for (UIView *view in self.view.subviews) {
        [view removeFromSuperview];
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return _statusBarStyle;
}

- (void)updateStatuBarColorByStyle:(UIStatusBarStyle)style {
    _statusBarStyle = style;
    [self setNeedsStatusBarAppearanceUpdate];
}

@end
