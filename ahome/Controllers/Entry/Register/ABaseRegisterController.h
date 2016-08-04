//
//  ABaseRegisterController.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-25.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "QuickDialogController.h"
#import "ARegisterDelegate.h"
#import "ARecord.h"

@interface ABaseRegisterController : QuickDialogController

@property (nonatomic,assign) id<ARegisterDelegate> delegate;

@end
