//
//  AQuickPopupController.h
//  ahome
//
//  Created by andson-dile on 15/6/5.
//  Copyright (c) 2015年 ushome. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "QuickDialogController.h"


@interface AQuickPopupController : QuickDialogController<UIGestureRecognizerDelegate>

@property(nonatomic, copy) void (^onSelected)(void);

@end
