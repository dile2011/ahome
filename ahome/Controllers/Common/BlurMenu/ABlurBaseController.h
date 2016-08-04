//
//  ABlurBaseController.h
//  demoe
//
//  Created by andson-dile on 15/3/6.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABlurBaseController : UIViewController {
    NSArray *_blurMenus;

}

@property (nonatomic,assign)CGRect frame;

- (instancetype)initWithMenus:(NSArray*)menus;

@end
