//
//  ARegisterDelegate.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-31.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ARegisterDelegate <NSObject>

- (void)doNextAction:(int)index;
- (void)doSelCommunity:(NSString*)cityCode districtCode:(NSString*)districtCode andRegion:(NSString*)region;

//
- (void)setRegisterData:(ARecord*)registerForm;

@end
