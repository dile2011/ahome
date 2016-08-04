//
//  ABlurCollectionView.h
//  ahome
//
//  Created by andson-dile on 15/6/12.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABlurMenu.h"
#import "ABlurMeshView.h"

@interface ABlurCollectionView : UICollectionViewCell {
    ABlurMeshView *_meshView;
}

- (void)setDataForCell:(ABlurMenu*)blurMenu;

@end
