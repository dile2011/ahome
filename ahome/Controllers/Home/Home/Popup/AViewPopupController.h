//
//  AViewPopupController.h
//  ahome
//
//  Created by andson-dile on 15/6/5.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ABaseViewController.h"

@interface AViewPopupController : ABaseViewController

@property(nonatomic, copy) void (^onSelected)(void);

@end
