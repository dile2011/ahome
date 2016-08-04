//
//  AFamilyCollectionView.h
//  ahome
//
//  Created by andson-dile on 15/7/17.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFamilyCollectionView : UICollectionViewCell {
    UIImageView *_homeBgPhoto;
    UIImageView *_homePhoto;
    
}

- (void)setDataForCollectionCell:(id)cellData;
- (UIImageView*)getPhotoView;

@end
