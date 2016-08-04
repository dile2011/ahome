//
//  ARecord.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-2.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ARecord.h"

@implementation ARecord

- (id)initWithJsonDictionary:(NSDictionary*)dic {
    self = [super init];
    [self updateWithJSonDictionary:dic];
    
    return self;
}

- (void)updateWithJSonDictionary:(NSDictionary *)dic {
    
}

@end
