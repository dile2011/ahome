//
//  ARegionLocalServer.h
//  AtHomeApp
//
//  Created by dilei liu on 14-10-6.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ABaseServer.h"

@interface ARegionLocalServer : ABaseServer

- (NSArray*)selectAreaDataByLevel:(int)areaLevel;
- (NSArray*)getAreaDataByRegionCode:(NSString*)code;

@end
