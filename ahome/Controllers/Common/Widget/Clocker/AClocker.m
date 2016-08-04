//
//  AClocker.m
//  ahome
//
//  Created by dilei liu on 14-8-23.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AClocker.h"

@implementation AClocker

+ (AClocker *)sharedInstance {
    static AClocker *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AClocker alloc] init];
    });
    
    return sharedInstance;
}


- (instancetype)init {
    self = [super init];
    
    return self;
}

- (void)startjs:(void (^)(BOOL))callback {
    [self resettimeout];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){
            [self canceltime];
            dispatch_async(dispatch_get_main_queue(), ^{
                ((void(^)(BOOL))callback)(YES);
            });
        }

        timeout--;
    });
    
    
    dispatch_resume(_timer);
}

- (void)startjs:(void (^)(BOOL))callback timeOut:(int)_timeOut {
    timeout = _timeOut;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){
            [self canceltime];
            dispatch_async(dispatch_get_main_queue(), ^{
                ((void(^)(BOOL))callback)(YES);
            });
        }

        timeout--;
    });
    
    
    dispatch_resume(_timer);
}

- (void)resettimeout {
    timeout = 50;
}

- (void)canceltime {
    if(_timer == nil) {
        
    } else {
        dispatch_source_cancel(_timer);
    }
    
}



@end
