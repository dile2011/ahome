//
//  ANaviTitleController.m
//  ahome
//
//  Created by andson-dile on 15/6/16.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ANaviTitleController.h"
#import "AMainRootController.h"
#import "AHomeLevelController.h"
#import "AHomeTitleViewCell.h"
#import "AHomeTitleView.h"
#import "AHomeTitle.h"
#import "AMainRootController.h"

#define panelView_size_height   200

@implementation ANaviTitleController

- (instancetype)initWithItems:(NSArray*)items {
    self = [super init];
    _items = [NSMutableArray arrayWithArray:items];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *panelView = [self blurView];
    [self.view addSubview:panelView];
    
    _pullTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, panelView.frame.size.width, panelView.frame.size.height-7)];
    [_pullTable setBackgroundColor:[UIColor clearColor]];
    _pullTable.dataSource = self;
    _pullTable.delegate = self;
    [panelView addSubview:_pullTable];
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [_pullTable setTableFooterView:view];
    
    UIImageView *bottomImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, _pullTable.frame.size.height, self.view.frame.size.width, 7)];
    [bottomImageView setImage:[UIImage imageNamed:@"home_navi_bottom.png"]];
    [panelView addSubview:bottomImageView];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self closePullMenu];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self enablePullMenu];
}

- (void)tapHandler:(UITapGestureRecognizer *)recognizer {
    [self closePullMenu];
}

- (void)enablePullMenu {
    [UIView animateWithDuration:.4 animations:^{
        [self.view setBackgroundColor:[UIColor colorWithRed:0. green:0. blue:0. alpha:0.5]];
        
        UIView *paenlView = [self.view.subviews lastObject];
        CGRect frame = paenlView.frame;
        
        frame.origin.y = 0;
        paenlView.frame = frame;
    }];
}

- (void)closePullMenu {
    [UIView animateWithDuration:.5 animations:^{
        [self.view setBackgroundColor:[UIColor clearColor]];
    }];
    
    [UIView animateWithDuration:.3 animations:^{
        UIView *paenelView = [self.view.subviews firstObject];
        CGRect frame = paenelView.frame;
        
        frame.origin.y = -panelView_size_height;
        paenelView.frame = frame;
        
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];

        [[AMainRootController sharedInstance]setOpenDrawerGesture:YES];
        [[AHomeLevelController sharedInstance]openLeftBtn];
        
        UIViewController *selectedItem = [[AMainRootController sharedInstance]getCurrentSelectedItem];
        if ([selectedItem isKindOfClass:[UINavigationController class]]) {
            UIViewController *rootViewController = [((UINavigationController*)selectedItem).viewControllers firstObject];
            UIBarButtonItem *rightBarButton = [rootViewController.navigationItem.rightBarButtonItems lastObject];
            rightBarButton.enabled = YES;
        }
    
        UINavigationBar *navigationBar = ((UINavigationController*)selectedItem).navigationBar;
        for (UIView *barView in navigationBar.subviews) {
            if ([barView isKindOfClass:[AHomeTitleView class]]) {
                [((AHomeTitleView*)barView) setpullImage:@"home_navi_arrowUp.png"];
            }
        }
    }];
    
}

- (UIView*)blurView {
    UIVisualEffectView *visualEffectView = nil;
    CGRect blurBounds = CGRectMake(0, -panelView_size_height, self.view.frame.size.height, [AHomeTitleViewCell heightForCell]*_items.count+20);
    
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.frame = blurBounds;
    
    return visualEffectView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
    AHomeTitleViewCell *cell = (AHomeTitleViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[AHomeTitleViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    
    AHomeTitle *homeTitle = [_items objectAtIndex:indexPath.row];
    [cell setDataForCell:homeTitle];

    return cell;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [AHomeTitleViewCell heightForCell];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AHomeTitle *homeTitle = [_items objectAtIndex:indexPath.row];
    homeTitle.onSelected();
    [self closePullMenu];
    
    UIViewController *selectedItem = [[AMainRootController sharedInstance]getCurrentSelectedItem];
    UINavigationBar *navigationBar = ((UINavigationController*)selectedItem).navigationBar;
    for (UIView *barView in navigationBar.subviews) {
        if ([barView isKindOfClass:[AHomeTitleView class]]) {
            [((AHomeTitleView*)barView) setpullImage:@"home_navi_arrowUp.png"];
            [((AHomeTitleView*)barView) setTitle:homeTitle.title image:homeTitle.titleimage];
        }
    }
}


@end
