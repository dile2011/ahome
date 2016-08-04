//
//  AGuideViewController.m
//  demoe
//
//  Created by andson-dile on 15/3/3.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "AGuideViewController.h"
#import "AGuidePageView0.h"
#import "AGuidePageView1.h"
#import "AGuidePageView2.h"
#import "AGuidePageView3.h"
#import "AGuideNextView.h"
#import "AGuideLoginView.h"
#import "ABlurMenu.h"

#define nextview_width  150
#define nextview_height 50

#define menu_plan_size  200

@implementation AGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    _kenBurnsView = [[JSAnimatedImagesView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _kenBurnsView.delegate = self;
    [self.view addSubview:_kenBurnsView];
    
    _guideScrollView = [[AGuidScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height- 70)];
    [_kenBurnsView addSubview:_guideScrollView];
    
    
    CGRect guideNextRect = CGRectMake((self.view.frame.size.width-nextview_width)/2., self.view.frame.size.height-nextview_height-(self.view.frame.size.height-_guideScrollView.frame.size.height-nextview_height)/2., nextview_width, nextview_height);
    AGuideNextView *guideNextBtn = [[AGuideNextView alloc]initWithFrame:guideNextRect];
    [guideNextBtn addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:guideNextBtn];
    
    UIView *pageView = [_guideScrollView pageByIndex:0];
    CGRect pageRect = CGRectMake(0, 0, pageView.frame.size.width, pageView.frame.size.height);
    AGuidePageView *pageView0 = [[AGuidePageView0 alloc]initWithFrame:pageRect];
    [pageView addSubview:pageView0];
    
    pageView = [_guideScrollView pageByIndex:1];
    AGuidePageView *pageView1 = [[AGuidePageView1 alloc]initWithFrame:pageRect];
    [pageView addSubview:pageView1];
    
    pageView = [_guideScrollView pageByIndex:2];
    AGuidePageView *pageView2 = [[AGuidePageView2 alloc]initWithFrame:pageRect];
    [pageView addSubview:pageView2];
    
    pageView = [_guideScrollView pageByIndex:3];
    AGuidePageView *pageView3 = [[AGuidePageView3 alloc]initWithFrame:pageRect];
    [pageView addSubview:pageView3];
}

- (NSUInteger)animatedImagesNumberOfImages:(JSAnimatedImagesView *)animatedImagesView {
    return 2;
}

- (UIImage *)animatedImagesView:(JSAnimatedImagesView *)animatedImagesView imageAtIndex:(NSUInteger)index {
    return [UIImage imageNamed:@"guide_background2.jpg"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_kenBurnsView startAnimating];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [_kenBurnsView stopAnimating];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self startGuide];
}

- (void)clicked {
    int pageIndex = _guideScrollView.contentOffset.x/self.view.frame.size.width;
    pageIndex += 1;
    
    if (pageIndex > (int)(_guideScrollView.contentSize.width/self.view.frame.size.width)-1)return;
    
    [_guideScrollView intoPageByIndex:pageIndex];
    [self executeByPageIndex:pageIndex];
    [self hidenNextView];
}

- (void)startGuide {
    [self executeByPageIndex:0];
}

- (void)executeByPageIndex:(int)pageIndex {
    UIView *pageView = [_guideScrollView pageByIndex:pageIndex];
    AGuidePageView *guidePageView = [pageView.subviews lastObject];
    [guidePageView showGuideContent];
    [guidePageView setCompleteShow:^{
        if (pageIndex == _guideScrollView.getAllPageNo-1) {
            for (UIView *view in self.view.subviews) {
                if ([view isKindOfClass:[AGuideNextView class]]) {
                    [view removeFromSuperview];
                    AGuideLoginView *guidLoginView = [[AGuideLoginView alloc]initWithFrame:CGRectMake(0, view.frame.origin.y, self.view.frame.size.width, view.frame.size.height) andTarget:self];
                    [self.view addSubview:guidLoginView];
                    break;
                }
            }
            
        } else {
            [self showNextView];
        }
    }];
}

- (void)doLoginAction {

}

- (void)doRegisterAction {

}

- (void)showNextView {
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[AGuideNextView class]]) {
            [((AGuideNextView*)view) show];
        }
    }
}

- (void)hidenNextView {
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[AGuideNextView class]]) {
            [((AGuideNextView*)view) hiden];
        }
    }
}

@end
