// Copyright (c) 2013 Mutual Mobile (http://mutualmobile.com/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "ARootViewController.h"
#import "ADrawerVisualStateManager.h"
#import "MMDrawerBarButtonItem.h"
#import "ALeftSideDrawerController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIViewController+MMDrawerController.h"

@implementation ARootViewController

- (instancetype)init {
    self = [super init];
    self.sideDrawer = [self setSideDrawer];
    
    return self;
}

- (id)initWithIsKenBlur:(BOOL)isKenBlur {
    self = [super initWithIsKenBlur:isKenBlur];
    self.sideDrawer = [self setSideDrawer];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.sideDrawer.menuTitle;
    [self setupLeftMenuButton];

}

- (ASideDrawer*)setSideDrawer {
    return nil;
}

-(void)setupLeftMenuButton{
    _leftButton = [[FRDLivelyButton alloc] initWithFrame:CGRectMake(0,0,28,28)];
    [_leftButton setStyle:kFRDLivelyButtonStyleHamburger animated:NO];
    [_leftButton addTarget:self action:@selector(leftDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:_leftButton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                   target:nil action:nil];
    negativeSpacer.width = -10;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer, buttonItem];
}

-(void)setupRightMenuButton{
    MMDrawerBarButtonItem * rightDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(rightDrawerButtonPress:)];
    [self.navigationItem setRightBarButtonItem:rightDrawerButton animated:YES];
}

#pragma mark - Button Handlers
-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)updateLeftBtnStyle:(BOOL)isClose {
    if (isClose) [_leftButton setStyle:kFRDLivelyButtonStyleClose animated:YES];
    else [_leftButton setStyle:kFRDLivelyButtonStyleHamburger animated:YES];
}

-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

- (void)disableLeftBtn {
    _leftButton.enabled = NO;
}

- (void)openLeftBtn {
    _leftButton.enabled = YES;
}

@end
