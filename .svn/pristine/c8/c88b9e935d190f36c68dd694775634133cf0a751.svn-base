//
//  AFamilyBasePageHomeController.m
//  ahome
//
//  Created by andson-dile on 15/7/27.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AFamilyBasePageHomeController.h"
#import "UIImageView+WebCache.h"
#import "AHome.h"

@implementation AFamilyBasePageHomeController

- (id)initWithPushStyle:(BOOL)isPush family:(id)familyObj selectedIndex:(NSUInteger)selectedIndex andImage:(UIImage*)image {
    self = [super initWithPushStyle:isPush];
    
    _selectImage = image;
    _family = familyObj;
    _selectedIndex = selectedIndex;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _family.familyCategory;
    
    UIImageView *homeBgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [homeBgView setImage:[UIImage imageNamed:@"family_home_bg.jpeg"]];
    [self.view addSubview:homeBgView];
}

- (void)setDefaultNavigationStyle {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"family_navi_background.jpeg"]forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)leftButtonAction {
    [self.navigationController dismissViewControllerAnimated:NO completion:^{}];
}

- (void)addLeftButtonItem {
    
}

- (AFamily*)getFamily {
    return _family;
}


@end
