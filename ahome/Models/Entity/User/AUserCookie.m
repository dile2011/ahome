//
//  AUserCookie.m
//  ahome
//
//  Created by dilei liu on 15/1/15.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AUserCookie.h"
#import "NSString+SBJSON.h"
#import "NSHTTPCookieStorage+Info.h"
#import "AUser.h"

@implementation AUserCookie

+ (id)userCookie {
    AUserCookie *userCookie = nil;
    
    NSDictionary *cookies = [NSHTTPCookieStorage describeCookies];
    for (NSString *key in cookies) {
        if ([key isEqualToString:@"ah_uinfo"]) {
            NSDictionary *dataDic = [cookies objectForKey:key];
            
            NSDate *dexpiresDate = [dataDic objectForKey:@"expiresDate"];
            NSDate *currentDate = [NSDate date];
            NSTimeInterval expiresDate_int =[dexpiresDate timeIntervalSince1970]*1;
            NSTimeInterval nowDate_int =[currentDate timeIntervalSince1970]*1;
            NSTimeInterval cha = expiresDate_int - nowDate_int;
            if (cha <= 0) return nil;
            
            NSString *athomeDicStr = [dataDic objectForKey:@"value"];
            athomeDicStr = [athomeDicStr stringByReplacingOccurrencesOfString:@"athome:" withString:@""];
            NSDictionary *athomeDic = [athomeDicStr JSONValue];
            
            NSString *uid = [athomeDic objectForKey:@"uid"];
            NSString *phone = [athomeDic objectForKey:@"phone"];
            NSString *uname = [[athomeDic objectForKey:@"uname"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            int familyNo = [[athomeDic objectForKey:@"hasFamily"]intValue];
            
            userCookie = [[AUserCookie alloc]init];
            [userCookie setServerId:(long)[uid longLongValue]];
            [userCookie setPhone:phone];
            [userCookie setUname:uname];
            [userCookie setFamilyNo:familyNo];
            
            AUser *user = [AUser sharedInstance];
            [user setServerId:(long)[uid longLongValue]];
            [user setPhone:phone];
            [user setUname:uname];
            [user setFamilyNo:familyNo];
        }
    }
    
    return userCookie;
}


@end
