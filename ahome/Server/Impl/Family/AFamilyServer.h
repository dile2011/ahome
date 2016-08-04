//
//  AFamilyServer.h
//  ahome
//
//  Created by andson-dile on 15/7/28.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AFamilyLocalServer.h"

@interface AFamilyServer : AFamilyLocalServer

/**
 * 获取用户家族家庭列表
 */
- (void)getFamilyHomesByUid:(int)uid callback:(void(^)(NSArray *homeInfo))callback
     failureCallback:(void(^)(NSString *resp))failureCallback;

@end
