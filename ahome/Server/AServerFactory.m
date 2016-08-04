//
//  AServerFactory.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-2.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AServerFactory.h"

static AServerFactory *sharedInstance = nil;

@implementation AServerFactory

- (id)init {
    self = [super init];
    _serverDicts = [[NSMutableDictionary alloc]init];
    return self;
}

+ (id)getServerInstance:(NSString*)serverName {
    
    @synchronized(self)	{ // 避免多线程并发创建多个实例
		if (sharedInstance == nil) {
            sharedInstance = [[AServerFactory alloc]init];
        }
	}
    
    id theServer = [sharedInstance getServer:serverName];
    if (theServer == nil) {
        theServer = [sharedInstance addServer:serverName];
    }
    
    return theServer;
}

- (id)getServer:(NSString*)serverName {
    id theServer = [_serverDicts objectForKey:serverName];
    return theServer;
}

- (id)addServer:(NSString*)serverName {
    Class controllerClass = NSClassFromString(serverName);
    id theServer = [[controllerClass alloc]init];
    
    if (theServer == nil) {
        return nil;
    }
    
    [_serverDicts setObject:theServer forKey:serverName];
    
    [theServer release];
    return theServer;
}

- (void)dealloc {
    [_serverDicts release];
    _serverDicts = nil;
    [super dealloc];
}

@end
