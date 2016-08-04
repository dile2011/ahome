//
//  AFamilyBaseCircleController.m
//  ahome
//
//  Created by dilei liu on 15/6/20.
//  Copyright (c) 2015年 ushome. All rights reserved.
//
#import "AFamilyBaseCircleController.h"
#import "MZBookShelfCollectionViewLayout.h"

@implementation AFamilyBaseCircleController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setFrame:_theFrame];
    [self.view setBackgroundColor:[UIColor whiteColor]];
   
    MZBookshelfCollectionViewLayout *flowLayout = [[MZBookshelfCollectionViewLayout alloc]init];
    [flowLayout registerNib:[UINib nibWithNibName:@"MZBookShelfDecorationView" bundle:nil] forDecorationViewOfKind:MZBookshelfCollectionViewLayoutDecorationViewKind];

    // 1:top margin  2:left margin 3:bottom margin  4:right margin
    flowLayout.sectionInset = UIEdgeInsetsMake(10.f, 20.0f, 0.0, 20.0);
    [flowLayout setHeaderReferenceSize:CGSizeMake(self.view.frame.size.width, 30.)];
    [flowLayout setFooterReferenceSize:CGSizeMake(self.view.frame.size.width, 30)];
    flowLayout.itemSize = [[AUtilities sharedInstance]itemSizeBySpaceSize:20];
    
    
    _collectionView = [[UICollectionView alloc] initWithFrame:_theFrame collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"family_background.jpeg"]];
    [_collectionView registerClass:NSClassFromString(@"AFamilyCollectionView") forCellWithReuseIdentifier:@"Cell"];
    [_collectionView registerClass:NSClassFromString(@"AFamilyCollectionHeaderView") forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    [_collectionView registerClass:NSClassFromString(@"AFamilyCollectionFooterView") forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];
    
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        reusableview = headerView;
        [reusableview setBackgroundColor:[UIColor clearColor]];
        
    } else if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        reusableview = footerView;
        [reusableview setBackgroundColor:[UIColor clearColor]];
    }
    
    
    return reusableview;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)relodaAlldata {
    [_collectionView reloadData];
}


@end
