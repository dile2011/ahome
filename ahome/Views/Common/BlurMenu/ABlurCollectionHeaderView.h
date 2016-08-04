//
//  ABlurCollectionHeaderView.h
//  ahome
//
//  Created by andson-dile on 15/6/12.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABlurCollectionHeaderView : UICollectionReusableView {
    UILabel *_textLabel;
}

@property (nonatomic,retain)NSString *title;

- (void)setTitle:(NSString *)title color:(UIColor*)bgColor;

@end
