//
//  AHomeUserServer.h
//  ahome
//
//  Created by dilei liu on 15/1/14.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHomeLocalServer.h"
#import "AUser.h"

@interface AHomeUserServer : AHomeLocalServer

/**
 * 个人头像上传
 */
- (void)uploadFacePictureByFile:(NSData*)file
                       callback:(void(^)(NSString *userFaceUrl))callback
                failureCallback:(void(^)(NSString *resp))failureCallback;

/**
 * 获取用户信息
 */
- (void)selectUserInfoByUid:(long)uid callback:(void(^)(AUser *user))callback
            failureCallback:(void(^)(NSString *resp))failureCallback;

@end
