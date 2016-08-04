//
//  ANewHomeAreaController.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-31.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANewHomeBaseController.h"

@interface ANewHomeAreaController : ANewHomeBaseController<QuickDialogEntryElementDelegate>

- (void)setRegionValue:(NSString*)regionName;

@end
