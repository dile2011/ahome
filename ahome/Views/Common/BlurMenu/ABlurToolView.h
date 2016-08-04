//
//  ABlurToolView.h
//  demoe
//
//  Created by andson-dile on 15/3/6.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABlurToolView : UIView {
    NSString *_closeStr;
}

@property(nonatomic, copy) void (^onSelected)(void);

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString*)title;
- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString*)title andSelect:(void (^)(void))onSelected;

@end
