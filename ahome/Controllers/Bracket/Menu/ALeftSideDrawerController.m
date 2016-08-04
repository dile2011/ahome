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


#import "ALeftSideDrawerController.h"
#import "ARootViewController.h"
#import "MMTableViewCell.h"
#import "UIViewController+MMDrawerController.h"
#import "MMSideDrawerTableViewCell.h"
#import "MMSideDrawerHeaderCell.h"
#import "AUserCookie.h"
#import "AHomeUserServer.h"

@implementation ALeftSideDrawerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    int fromNumber = 0,toNumber = 3;
    int randomNumber = (arc4random()%(toNumber-fromNumber))+fromNumber;
    [bgImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Bracket_Menu_Backgroup%i.jpg",randomNumber]]];
    bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    bgImageView.clipsToBounds = YES;
    bgImageView.userInteractionEnabled = YES;
    [self.view insertSubview:bgImageView atIndex:0];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"UpdateMenuFaceNotification" object:nil
                                                       queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * __unused notification) {
                                                           NSString *obj = [notification object];
                                                           AUser *user = [AUser sharedInstance];
                                                           user.avatar = obj;
                                                           
                                                           [self.tableView reloadData];
                                                       }];
    
    AUserCookie *userCookie =[AUserCookie userCookie];
    [[AServerFactory getServerInstance:@"AHomeUserServer"]selectUserInfoByUid:userCookie.serverId callback:^(AUser *user) {
        [self.tableView reloadData];
    } failureCallback:^(NSString *resp) {
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) return 1;
    return self.mm_drawerController.levelControllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MMTableViewCell *cell = (MMTableViewCell*)[super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell isKindOfClass:[MMSideDrawerTableViewCell class]]) {
        UINavigationController *navigationLevel = [self.mm_drawerController.levelControllers objectAtIndex:indexPath.row];
        ARootViewController *levelController = (ARootViewController*)[navigationLevel.viewControllers objectAtIndex:0];
        [cell setDataForCell:levelController.sideDrawer andDel:self];
        
    } else if ([cell isKindOfClass:[MMSideDrawerHeaderCell class]]) {
        AUser *user = [AUser sharedInstance];
        [cell setDataForCell:user andDel:self];
    }
    
    return cell;
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UpdateMenuFaceNotification" object:nil];
}

@end
