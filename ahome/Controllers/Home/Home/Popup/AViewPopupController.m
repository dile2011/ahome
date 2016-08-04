//
//  AViewPopupController.m
//  ahome
//
//  Created by andson-dile on 15/6/5.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AViewPopupController.h"
#import "AMainRootController.h"

@implementation AViewPopupController

- (instancetype)init {
    self = [super init];
    self.isPush = NO;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setFrame:CGRectMake(0, 0,self.navigationController.view.frame.size.width,
                                   self.navigationController.view.frame.size.height - self.navigationController.navigationBar.frame.size.height)];
}

- (void)leftButtonAction {
    self.onSelected();
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[AMainRootController sharedInstance]setOpenDrawerGesture:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[AMainRootController sharedInstance]setOpenDrawerGesture:YES];
}

@end
