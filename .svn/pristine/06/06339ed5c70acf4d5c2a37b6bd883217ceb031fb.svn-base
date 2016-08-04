//
//  ABaseViewController.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-23.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDrawerController.h"
#import "JSAnimatedImagesView.h"

@interface ABaseViewController : UIViewController<JSAnimatedImagesViewDelegate> {
    JSAnimatedImagesView *_kenBurnsView;
}

@property (nonatomic,assign)BOOL isPush;
@property (nonatomic,assign)BOOL isKenBlur;

- (id)initWithIsKenBlur:(BOOL)isKenBlur;
- (id)initWithPushStyle:(BOOL)isPush;

- (void)setDefaultNavigationStyle;

- (void)leftButtonAction;
- (void)rightButtonAction;

- (void)addKenBurnView;

@end
