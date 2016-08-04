//
//  ANewHomeBaseController.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-31.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "QuickDialogController.h"
#import "ANewAtHomeDelegate.h"

@interface ANewHomeBaseController : QuickDialogController

@property (nonatomic,assign)id<ANewAtHomeDelegate> delegate;

@end
