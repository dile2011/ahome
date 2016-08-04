//
//  AFamilyHomeCircleController.m
//  ahome
//
//  Created by dilei liu on 15/6/20.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AFamilyHomeCircleController.h"
#import "AFamilyCollectionView.h"
#import "AHomeServer.h"
#import "AFamily.h"
#import "AHome.h"
#import "AFamilyPageHomeController.h"
#import "AMainRootController.h"
#import "AFamilyLevelController.h"
#import "MZBookShelfCollectionViewLayout.h"
#import "AFamilyServer.h"

@implementation AFamilyHomeCircleController

- (instancetype)init {
    self = [super init];
    _familys = [NSMutableArray array];
    
    return self;
}

- (void)reloadDatas {
    CGRect frame = CGRectMake((self.view.frame.size.width-40)/2., (self.view.bounds.size.height-130)/2., 40., 40.);
    [[AUtilities sharedInstance]popTarget:self.view frame:frame];
    
    [[AServerFactory getServerInstance:@"AFamilyServer"]getFamilyHomesByUid:0 callback:^(NSArray *familys) {
        [_familys addObjectsFromArray:familys];
        
        [self relodaAlldata];
        [[AUtilities sharedInstance]dismiss];
        
    } failureCallback:^(NSString *resp) {
        [[AUtilities sharedInstance]dismiss];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reloadDatas];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _familys.count > 0 ?_familys.count:1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (_familys.count == 0) return 0.;
    
    AFamily *family = [_familys objectAtIndex:section];
    return family.homes.count>0?family.homes.count:0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    AFamily *family = [_familys objectAtIndex:indexPath.section];
    AHome *home = [family.homes objectAtIndex:indexPath.row];
    [((AFamilyCollectionView*)cell) setDataForCollectionCell:home];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AFamilyCollectionView *familyhomeCell = (AFamilyCollectionView*)[_collectionView cellForItemAtIndexPath:indexPath];
    UIImageView *photoView = [familyhomeCell getPhotoView];
    CGRect oldPhotoFrame = photoView.frame;
    CGPoint point = [familyhomeCell convertPoint:photoView.frame.origin toView:self.view];
    
    CGRect startAnimationFrame = CGRectMake(point.x, point.y, photoView.frame.size.width, photoView.frame.size.height);
    [self.view addSubview:photoView];
    [photoView setFrame:startAnimationFrame];
    
    [UIView animateWithDuration:.5 animations:^{
        CGRect endAnimationFrame = CGRectMake(([UIScreen mainScreen].bounds.size.width-photoView.image.size.width)/2., ([UIScreen mainScreen].bounds.size.height - photoView.image.size.height)/2.-64, photoView.image.size.width, photoView.image.size.height);
        photoView.frame = endAnimationFrame;
        
        UINavigationController *selectedItem = (UINavigationController*)[[AMainRootController sharedInstance]getCurrentSelectedItem];
        ARootViewController *rootController = [selectedItem.viewControllers firstObject];
        [rootController updateLeftBtnStyle:YES];
        
        AFamily *family = [_familys objectAtIndex:indexPath.section];
        rootController.title = family.familyCategory;
        
    } completion:^(BOOL finished) {
        AFamily *family = [_familys objectAtIndex:indexPath.section];
        NSUInteger selectedIndex = indexPath.row;
        AFamilyPageHomeController *familyHome = [[AFamilyPageHomeController alloc]initWithPushStyle:NO family:family selectedIndex:selectedIndex andImage:photoView.image];
        UINavigationController *familyHomeNavi = [[UINavigationController alloc]initWithRootViewController:familyHome];
        familyHomeNavi.navigationBar.translucent = NO;
        
        UINavigationController *selectedItem = (UINavigationController*)[[AMainRootController sharedInstance]getCurrentSelectedItem];
        
        [selectedItem presentViewController:familyHomeNavi animated:NO completion:^{
            [photoView removeFromSuperview];
            photoView.frame = oldPhotoFrame;
            [familyhomeCell addSubview:photoView];
            
            ARootViewController *rootController = [selectedItem.viewControllers firstObject];
            [rootController updateLeftBtnStyle:NO];
            rootController.title = rootController.sideDrawer.menuTitle;
        }];
    }];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10.;
}


@end
