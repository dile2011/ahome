//
//  ABlurCollectionController.h
//  ahome
//
//  Created by andson-dile on 15/6/12.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ABlurBaseController.h"

@interface ABlurCollectionController : ABlurBaseController<UICollectionViewDataSource,UICollectionViewDelegate> {
    UICollectionView *_collectionView;
    
}

@end
