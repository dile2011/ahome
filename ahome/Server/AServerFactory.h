//
//  AServerFactory.h
//  AtHomeApp
//
//  Created by dilei liu on 14-9-2.
//  Copyright (c) 2014年 ushome. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface AServerFactory : NSObject {
    NSMutableDictionary *_serverDicts;
}

+ (id)getServerInstance:(NSString*)serverName;

@end
