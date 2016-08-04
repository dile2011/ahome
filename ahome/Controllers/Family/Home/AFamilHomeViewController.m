//
//  AFamilHomeViewController.m
//  ahome
//
//  Created by andson-dile on 15/7/28.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AFamilHomeViewController.h"
#import "AFamilyPageHomeController.h"
#import "ABaseHomeCell.h"
#import "AHomeMemberCell.h"

@implementation AFamilHomeViewController

- (void)startLoading {
    [super startLoading];
    
    [self pageViewScrollByDisable:NO];
    
    [[AClocker sharedInstance]startjs:^(BOOL finish) {
        [self stopLoading];
    } timeOut:2.];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1.;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"AHomeMemberCell";
    UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        Class controllerClass = NSClassFromString(CellIdentifier);
        cell = [[controllerClass alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [((ABaseHomeCell*)cell) setDataForCell:_home];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [AHomeMemberCell heightForCell:(int)_home.members.count];
}



@end
