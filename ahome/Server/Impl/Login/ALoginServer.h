//
//  ALoginServer.h
//  Ahome
//
//  Created by dilei liu on 14/11/29.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ALoginLocalServer.h"

@interface ALoginServer : ALoginLocalServer

/**
 * 发送登录请求
 */
- (void)doLoginByPhoneNo:(NSString*)phoneNo andPasswd:(NSString*)passwd
                callback:(void(^)(BOOL opBool))callback failureCallback:(void(^)(NSString *resp))failureCallback;


- (void)doLogout:(void(^)(BOOL opBool))callback failureCallback:(void(^)(NSString *resp))failureCallback;

@end
