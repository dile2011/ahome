//
//  AHomeLevelController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-23.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AHomeLevelController.h"
#import "ANewHomeController.h"
#import "AUnAtHomeController.h"
#import "AHomeServer.h"
#import "AHomeTitle.h"

#import "UIViewController+MJPopupViewController.h"
#import "AQuickPopupController.h"
#import "APopupHandler.h"
#import "AHomePhoneAuthController.h"
#import "AHomeInviteActiveController.h"
#import "AHomeAddMemberController.h"
#import "AHomeDeleteMemberController.h"
#import "APagingPopupController.h"
#import "AHomeShareController.h"

#import "ABlurMenu.h"

#define kPopupModalAnimationDuration 0.35

@implementation AHomeLevelController


static AHomeLevelController *sharedInstance = nil;
+ (id)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[AHomeLevelController alloc] init];
    }
    
    return sharedInstance;
}

+ (void)destroyDealloc {
    sharedInstance = nil;
}

- (ASideDrawer *)setSideDrawer {
    return [[ASideDrawer alloc]initWithTitle:@"家庭" menuImage:@"Bracket_Home.png"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([[AUtilities sharedInstance]isHadFamily]) {
        UIBarButtonItem *moreButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"home_tab_more.png"] style:UIBarButtonItemStylePlain target:self action:@selector(moreMenu)];
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace                                                                               target:nil action:nil];
        negativeSpacer.width = -10;
        self.navigationItem.rightBarButtonItems = @[negativeSpacer, moreButtonItem];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:@"HomeNotification" object:nil
                                                           queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * __unused notification) {
                                                               
                                                           }];
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (!self.homePage)[self updateHome];
}

- (void)updateHome {
    for (UIView *view in self.view.subviews)[view removeFromSuperview];
    UIViewController *showViewController = nil;
    
    if(![[AUtilities sharedInstance]isHadFamily]) {
        showViewController = [[AUnAtHomeController alloc]init];
        
    } else {
        self.homePage = [[AHomePageController alloc]init];
        showViewController = self.homePage;
    }
    
    [showViewController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:showViewController.view];
    [self addChildViewController:showViewController];
    [showViewController didMoveToParentViewController:self];
}

- (void)moreMenu {
    NSMutableArray *menus = [NSMutableArray array];
    
    switch (self.homePage.lookStyle) {
        case MergeHomeStyle: {
            // 分享
            ABlurMenu *qzoneShare = [[ABlurMenu alloc]initWithTitle:@"" menuImage:@"home_menu_mine.png" andColor:[UIColor colorWithRed:14./255. green:115./255 blue:176/255. alpha:1.] andSelect:^{
                [_panelMenu closeMenu];
            }];
            
            ABlurMenu *wxinShare = [[ABlurMenu alloc]initWithTitle:@"" menuImage:@"home_menu_parent.png" andColor:[UIColor colorWithRed:14./255. green:115./255 blue:176/255. alpha:1.] andSelect:^{
                [_panelMenu closeMenu];
            }];
            
            ABlurMenu *sinaShare = [[ABlurMenu alloc]initWithTitle:@"" menuImage:@"home_menu_merge.png" andColor:[UIColor colorWithRed:14./255. green:115./255 blue:176/255. alpha:1.] andSelect:^{
                [_panelMenu closeMenu];
            }];
            
            NSArray *showHomeData = @[qzoneShare,wxinShare,sinaShare];
            NSDictionary *showHomeDic = @{@"data":showHomeData,@"title":@"分享",@"bgColor":[UIColor colorWithRed:14./255. green:115./255 blue:176/255. alpha:1.]};
            [menus addObject:showHomeDic];
            
            // 日常
            ABlurMenu *pagingMesh = [[ABlurMenu alloc]initWithTitle:@"" menuImage:@"home_menu_findme.png" andColor:[UIColor colorWithRed:69./255. green:70./255 blue:159/255. alpha:1.] andSelect:^{
                [_panelMenu closeMenu];
                
                AViewPopupController *popVC = [[APagingPopupController alloc]initWithPushStyle:NO];
                UINavigationController *navi = [[APopupHandler sharedInstance]genPopupNavigation:popVC];
                ((APagingPopupController*)popVC).width = navi.view.frame.size.width;
                [self presentPopupViewController:navi animationType:MJPopupViewAnimationSlideBottomBottom];
                
                [popVC setOnSelected:^{
                    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideBottomBottom];
                }];
            }];
            
            ABlurMenu *shareMesh = [[ABlurMenu alloc]initWithTitle:@"" menuImage:@"home_menu_share.png" andColor:[UIColor colorWithRed:69./255. green:70./255 blue:159/255. alpha:1.] andSelect:^{
                [_panelMenu closeMenu];
                
                AHomeShareController *shareController = [[AHomeShareController alloc]initWithPushStyle:NO];
                UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:shareController];
                [self.navigationController presentViewController:navi animated:YES completion:^{
                    
                }];
                
            }];
            
            NSArray *everydayData = @[pagingMesh,shareMesh];
            NSDictionary *everydayDic = @{@"data":everydayData,@"title":@"日常",@"bgColor":[UIColor colorWithRed:69./255. green:70./255 blue:159/255. alpha:1.]};
            [menus addObject:everydayDic];
            
            _panelMenu = [[APanelMenuController alloc]initWithMenus:menus CloseStr:@"关闭" blurType:CollectionBlurViewType];
            [_panelMenu addToSuperView:self.view];
            
            break;
        }
        
        case (MineHomeStyle):{
            ABlurMenu *addMemberMesh = [[ABlurMenu alloc]initWithTitle:@"" menuImage:@"home_menu_addperson.png" andColor:[UIColor colorWithRed:59./255. green:71./255 blue:87/255. alpha:.5] andSelect:^{
                [_panelMenu closeMenu];
                
                AQuickPopupController *popVC = [[AHomeAddMemberController alloc]init];
                [APopupHandler sharedInstance].pageHeight = 290.;
                UINavigationController *navi = [[APopupHandler sharedInstance]genPopupNavigation:popVC];
                ((AHomeAddMemberController*)popVC).width = navi.view.frame.size.width;
                
                ((AHomeAddMemberController*)popVC).familyId = ((AHome*)_homePage.homeInfo).familyId;
                [self presentPopupViewController:navi animationType:MJPopupViewAnimationSlideBottomBottom];
                
                [popVC setOnSelected:^{
                    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideBottomBottom];
                }];
            }];
            
            ABlurMenu *addHomeMesh = [[ABlurMenu alloc]initWithTitle:@"" menuImage:@"home_menu_addhome.png" andColor:[UIColor colorWithRed:59./255. green:71./255 blue:87/255. alpha:.5] andSelect:^{
                [_panelMenu closeMenu];
                [self newHome];
                
            }];
            
            NSArray *halfwayData = @[addMemberMesh,addHomeMesh];
            NSDictionary *halfwayDic = @{@"data":halfwayData,@"title":@"",@"bgColor":[UIColor colorWithRed:59./255. green:71./255 blue:87/255. alpha:.5]};
            [menus addObject:halfwayDic];
            
            _panelMenu = [[APanelMenuController alloc]initWithMenus:menus CloseStr:@"关闭" blurType:CollectionBlurViewType];
            [_panelMenu addToSuperView:self.view];
            
            break;
        }
            
        case ParentHomeStyle: {
            ABlurMenu *addMemberMesh = [[ABlurMenu alloc]initWithTitle:@"" menuImage:@"home_menu_addperson.png" andColor:[UIColor colorWithRed:59./255. green:71./255 blue:87/255. alpha:.5] andSelect:^{
                [_panelMenu closeMenu];
                
                AQuickPopupController *popVC = [[AHomeAddMemberController alloc]init];
                [APopupHandler sharedInstance].pageHeight = 290.;
                UINavigationController *navi = [[APopupHandler sharedInstance]genPopupNavigation:popVC];
                ((AHomeAddMemberController*)popVC).width = navi.view.frame.size.width;
                
                ((AHomeAddMemberController*)popVC).familyId = ((AHome*)_homePage.homeInfo).familyId;
                [self presentPopupViewController:navi animationType:MJPopupViewAnimationSlideBottomBottom];
                
                [popVC setOnSelected:^{
                    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideBottomBottom];
                }];
            }];
            
            ABlurMenu *addHomeMesh = [[ABlurMenu alloc]initWithTitle:@"" menuImage:@"home_menu_addhome.png" andColor:[UIColor colorWithRed:59./255. green:71./255 blue:87/255. alpha:.5] andSelect:^{
                [_panelMenu closeMenu];
                [self newHome];
                
            }];
            
            NSArray *halfwayData = @[addMemberMesh,addHomeMesh];
            NSDictionary *halfwayDic = @{@"data":halfwayData,@"title":@"",@"bgColor":[UIColor colorWithRed:59./255. green:71./255 blue:87/255. alpha:.5]};
            [menus addObject:halfwayDic];
            
            _panelMenu = [[APanelMenuController alloc]initWithMenus:menus CloseStr:@"关闭" blurType:CollectionBlurViewType];
            [_panelMenu addToSuperView:self.view];
            
            break;
        }
            
        default:
            break;
    }
}

- (void)addTitleView:(NSDictionary*)homeInfoDic {
    NSMutableArray *titleMenus = [NSMutableArray array];
    
    AHomeTitle *mergeHome = [[AHomeTitle alloc]initWithTitle:@"我的家人" image:@"home_navi_merge.png" cellimage:@"home_navicell_merge.png" isPull:YES andSelect:^{
        self.homePage.lookStyle = MergeHomeStyle;
        [self.homePage reloadHomeInfo];
    }];
    [titleMenus addObject:mergeHome];
    
    AHome *mineHomeInfo = [homeInfoDic objectForKey:@"mine"];
    if (mineHomeInfo != nil) {
        AHomeTitle *mineHome = [[AHomeTitle alloc]initWithTitle:@"妻儿子女一家" image:@"home_navi_mine.png" cellimage:@"home_navicell_mine.png" isPull:YES andSelect:^{
            self.homePage.lookStyle = MineHomeStyle;
            [self.homePage reloadHomeInfo];
        }];
        
        [titleMenus addObject:mineHome];
    }
    
    AHome *parentHomeInfo = [homeInfoDic objectForKey:@"parent"];
    if (parentHomeInfo != nil) {
        AHomeTitle *parentHome = [[AHomeTitle alloc]initWithTitle:@"父母兄妹一家" image:@"home_navi_parent.png" cellimage:@"home_navicell_parent.png" isPull:YES andSelect:^{
            self.homePage.lookStyle = ParentHomeStyle;
            [self.homePage reloadHomeInfo];
        }];
        
        [titleMenus addObject:parentHome];
    }

    _titleView = [[AHomeTitleView alloc]initWithTitleItems:titleMenus index:self.homePage.lookStyle];
    for (UIView *subView in self.navigationController.navigationBar.subviews) {
        if ([subView isKindOfClass:[AHomeTitleView class]]) {
            [subView removeFromSuperview];
        }
    }
    
    for (UIView *subView in self.navigationController.navigationBar.subviews) {
        if ([subView isKindOfClass:[APullRefreshView class]]) {
            int index = (int)[self.navigationController.navigationBar.subviews indexOfObject:subView];
            [self.navigationController.navigationBar insertSubview:_titleView atIndex:index];
        }
    }
}

/**
 * 手机认证
 */
- (void)phoneAuth:(AMergeHomeMember*)member familyId:(long)familyId{
    
    AQuickPopupController *popVC = [[AHomePhoneAuthController alloc]initWithMemberInfo:member];
    [APopupHandler sharedInstance].pageHeight = 260.;
    UINavigationController *navi = [[APopupHandler sharedInstance]genPopupNavigation:popVC];
    ((AHomePhoneAuthController*)popVC).width = navi.view.frame.size.width;
    ((AHomePhoneAuthController*)popVC).familyId = familyId;
    ((AHomePhoneAuthController*)popVC).index = member.mkey;
    
    [self presentPopupViewController:navi animationType:MJPopupViewAnimationSlideBottomBottom];
    [popVC setOnSelected:^{
        [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideBottomBottom];
    }];
}

/**
 * 发送邀请
 */
- (void)sendInvite:(AMergeHomeMember*)member familyId:(long)familyId{
    AQuickPopupController *popVC = [[AHomeInviteActiveController alloc]initWithMemberInfo:member];
    UINavigationController *navi = [[APopupHandler sharedInstance]genPopupNavigation:popVC];
    ((AHomeInviteActiveController*)popVC).width = navi.view.frame.size.width;
    ((AHomeInviteActiveController*)popVC).familyId = familyId;
    [self presentPopupViewController:navi animationType:MJPopupViewAnimationSlideBottomBottom];
    
    [popVC setOnSelected:^{
        [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideBottomBottom];
    }];
}

/**
 * 删除一个成员
 */
- (void)deleteMember:(AMergeHomeMember*)member familyId:(long)familyId{
    AQuickPopupController *popVC = [[AHomeDeleteMemberController alloc]initWithMemberInfo:member];
    UINavigationController *navi = [[APopupHandler sharedInstance]genPopupNavigation:popVC];
    ((AHomeDeleteMemberController*)popVC).width = navi.view.frame.size.width;

    ((AHomeDeleteMemberController*)popVC).familyId = familyId;
    [self presentPopupViewController:navi animationType:MJPopupViewAnimationSlideBottomBottom];
    
    [popVC setOnSelected:^{
        [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideBottomBottom];
    }];
}

- (void)newHome {
    ANewHomeController *newAtHomeCon = [[ANewHomeController alloc]initWithPushStyle:NO];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:newAtHomeCon];
    [self.navigationController presentViewController:navi animated:YES completion:^{
        
    }];
}

//==============================================
- (void)afterMemberOpration {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideBottomBottom];
    [_homePage reloadHomeInfo];
}

//==============================================
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"HomeNotification" object:nil];
}

@end
