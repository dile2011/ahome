//
//  ACommunityCell.h
//  ahome
//
//  Created by dilei liu on 15/2/21.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACommunityCell : UICollectionViewCell {
    UILabel *_titleLabel;
}

- (void)setDataForCell:(id)model isNewFlag:(BOOL)flag;

@end
