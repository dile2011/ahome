//
//  ARegisterServer.h
//  AtHomeApp
//
//  Created by dilei liu on 14-10-7.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ARegisterLocalServer.h"
#import "ARegisterForm.h"

@interface ARegisterServer : ARegisterLocalServer


/**
 * 注册时验证手机号是否被登录过
 */
- (void)doVerifyPhoneUnique:(NSString*)phoneNo callback:(void(^)(BOOL unique))callback
            failureCallback:(void(^)(NSString *resp))failureCallback;

/**
 * 注册时获取验证码
 */
- (void)doGetVerifyCode:(NSString*)phoneNo callback:(void(^)(NSString *code))callback
        failureCallback:(void(^)(NSString *resp))failureCallback;


/**
 * 提交注册用户信息
 */
- (void)doRegisterUser:(ARegisterForm*)registerForm callback:(void(^)(NSString *uid))callback
        failureCallback:(void(^)(NSString *resp))failureCallback;

/**
 * 保存用户地区信息
 */
- (void)doSetRegionForRegister:(NSString*)region regionName:(NSString*)regionName
                      cityCode:(NSString*)cityCode regionCode:(NSString*)regionCode
                      callback:(void(^)(NSString *state))callback
               failureCallback:(void(^)(NSString *resp))failureCallback;
@end
