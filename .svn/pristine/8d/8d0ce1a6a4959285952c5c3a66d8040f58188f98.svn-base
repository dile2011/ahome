//
//  AClocker.h
//  ahome
//
//  Created by dilei liu on 14-8-23.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AClocker : NSObject {
    dispatch_source_t _timer;
    __block int timeout;
}


+ (AClocker *)sharedInstance;

- (void)startjs:(void (^)(BOOL))callback;
- (void)startjs:(void (^)(BOOL))callback timeOut:(int)timeOut;

- (void)resettimeout;
- (void)canceltime;

@end
