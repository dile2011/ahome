//
//  ASideDrawerController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-23.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ASideDrawerController.h"
#import "MMSideDrawerTableViewCell.h"
#import "AMainRootController.h"
#import "UIViewController+MMDrawerController.h"
#import "FBShimmeringView.h"
#import "ARootViewController.h"
#import "ASideDrawer.h"
#import "AUserLevelController.h"
#import "MMSideDrawerHeaderCell.h"

#define copyrightView_size      80.

@implementation ASideDrawerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableHeaderHeight = 10;
    
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-copyrightView_size);
    self.tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self.tableView setSeparatorColor:[UIColor colorWithRed:1 green:1.0 blue:1.0 alpha:.1]];
    [self.tableView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.8]];
    
    UIView *copyrightView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-copyrightView_size, self.view.frame.size.width, copyrightView_size)];
    [copyrightView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.8]];
    [self.view addSubview:copyrightView];
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, copyrightView.frame.size.width, .3)];
    [copyrightView addSubview:line];
    [line setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:.2]];

    UIImageView *logoImageView = [[UIImageView alloc]init];
    [logoImageView setCenter:CGPointMake(40, copyrightView.frame.size.height/2.)];
    [logoImageView setBounds:CGRectMake(0, 0, 20., 20.)];
    [copyrightView addSubview:logoImageView];
    [logoImageView setImage:[UIImage imageNamed:@"Bracket_Copy.png"]];
    logoImageView.alpha = .4;

    FBShimmeringView *shimmeringView = [[FBShimmeringView alloc] init];
    shimmeringView.shimmering = YES;
    shimmeringView.shimmeringBeginFadeDuration = .5;
    shimmeringView.shimmeringOpacity = 0.1;
    shimmeringView.frame = CGRectMake(logoImageView.frame.origin.x+logoImageView.frame.size.width+20, 0, copyrightView.frame.size.width-logoImageView.frame.size.width-logoImageView.frame.origin.x, copyrightView.frame.size.height);
    [copyrightView addSubview:shimmeringView];
    
    UILabel *copyrightLabel = [[UILabel alloc]init];
    [copyrightView addSubview:copyrightLabel];
    [copyrightLabel setFont:[UIFont boldSystemFontOfSize:16.]];
    copyrightLabel.textAlignment = NSTextAlignmentLeft;
    [copyrightLabel setTextColor:[UIColor whiteColor]];
    copyrightLabel.lineBreakMode = NSLineBreakByWordWrapping;
    copyrightLabel.numberOfLines = 1;
    [copyrightLabel setBackgroundColor:[UIColor clearColor]];
    NSAttributedString *attributedString =[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"北京星点科技有限公司"] attributes:@{NSKernAttributeName : @(1.)}];
    [copyrightLabel setAttributedText:attributedString];
    shimmeringView.contentView = copyrightLabel;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0?0:self.tableHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) return [MMSideDrawerHeaderCell heightForCell];
    return [MMSideDrawerTableViewCell heightForCell];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"MMSideDrawerTableViewCell";
    if (indexPath.section == 0)CellIdentifier = @"MMSideDrawerHeaderCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        Class controllerClass = NSClassFromString(CellIdentifier);
        cell = [[controllerClass alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.userInteractionEnabled = YES;
    }
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        [[AMainRootController sharedInstance]entryUserCenterView];
        
    } else {
        UINavigationController *navigationLevel = [self.mm_drawerController.levelControllers objectAtIndex:indexPath.row];
        [self.mm_drawerController setCenterViewController:navigationLevel withFullCloseAnimation:YES completion:nil];
    }
    
    [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) entryUserCenterController {
    AUserLevelController *userLevel = [AUserLevelController sharedInstance];
    UINavigationController *navigationLevel = [[UINavigationController alloc] initWithRootViewController:userLevel];
    navigationLevel.navigationBar.translucent = NO;
    
    [self.mm_drawerController setCenterViewController:navigationLevel withFullCloseAnimation:YES completion:nil];
}

@end
