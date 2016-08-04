//
//  AFamilyPageHomeController.m
//  ahome
//
//  Created by dilei liu on 15/6/20.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AFamilyPageHomeController.h"
#import "AFamilHomeViewController.h"
#import "AFamily.h"
#import "AHome.h"

#define bottomtool_height   60
@implementation AFamilyPageHomeController

- (id)initWithPushStyle:(BOOL)isPush family:(id)familyObj selectedIndex:(NSUInteger)selectedIndex andImage:(UIImage*)image {
    self = [super initWithPushStyle:isPush family:familyObj selectedIndex:selectedIndex andImage:image];
    _pageContents = [NSMutableArray array];
    _dataSource = [NSMutableArray array];
    
    for (AHome *home in _family.homes) {
        [_pageContents addObject:home];
    }
    
    return self;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (_bottomToolView) return;
    
    _bottomToolView = [[AFamilyHomeBottomView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-bottomtool_height, self.view.frame.size.width, bottomtool_height)];
    __weak AFamilyPageHomeController *weakSelf = self;
    [_bottomToolView setSwitchBlock:^{[weakSelf leftButtonAction];}];
    [_bottomToolView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_bottomToolView];
    
    _pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [_pageViewController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-bottomtool_height)];
    [_pageViewController.view setBackgroundColor:[UIColor clearColor]];
    _pageViewController.delegate = self;
    _pageViewController.dataSource = self;
    
    for (AHome *home in _pageContents) {
        NSUInteger index = [_pageContents indexOfObject:home];
        CGRect frame = CGRectMake(0, 0, _pageViewController.view.frame.size.width, _pageViewController.view.frame.size.height);
        AFamilHomeViewController *familHome = [[AFamilHomeViewController alloc]initWithHome:home delObj:self andFrame:frame];
        if (_selectedIndex == index)familHome = [[AFamilHomeViewController alloc]initWithHome:home delObj:self selImage:_selectImage andFrame:frame];
        familHome.isKenBlur = YES;
        familHome.index = index;
        [_dataSource addObject:familHome];
    }
    
    [_pageViewController setViewControllers:@[_dataSource[_selectedIndex]]
                                  direction:UIPageViewControllerNavigationDirectionForward
                                   animated:YES completion:nil];
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [_pageViewController didMoveToParentViewController:self];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(id)viewController index];
    if(index == 0)return nil;
    
    index--;
    return _dataSource[index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(id)viewController index];
    index++;
    if(index == _dataSource.count)return nil;
    
    return _dataSource[index];
}


@end
