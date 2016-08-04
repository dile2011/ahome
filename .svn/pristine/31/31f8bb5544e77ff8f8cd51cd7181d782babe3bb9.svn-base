//
//  AUser.m
//  ahome
//
//  Created by dilei liu on 15/1/14.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AUser.h"

@implementation AUser

+ (id)sharedInstance {
    static AUser *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[AUser alloc] init];
    });
    
    return sharedManager;
}

@end
