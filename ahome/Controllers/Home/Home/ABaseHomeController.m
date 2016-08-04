//
//  ABaseHomeController.m
//  demoe
//
//  Created by andson-dile on 15/3/11.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "ABaseHomeController.h"
#import "ParallaxHeaderView.h"
#import "AHomePageToolView.h"

#define tool_size_height    45

@implementation ABaseHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    float header_height = [[AUtilities sharedInstance]homeTableHeaderHeight];
    self.headerView = [ParallaxHeaderView parallaxHeaderViewWithCGSize:CGSizeMake(self.tableView.frame.size.width, header_height)];
    [self.tableView setTableHeaderView:_headerView];
    AHomePageToolView *homePageToolView = [[AHomePageToolView alloc]initWithFrame:CGRectMake(0, _headerView.frame.size.height-tool_size_height, _headerView.frame.size.width, tool_size_height)];
    homePageToolView.tag = 100;
    [_headerView addSubview:homePageToolView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10.;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    
    return cell;
}

@end
