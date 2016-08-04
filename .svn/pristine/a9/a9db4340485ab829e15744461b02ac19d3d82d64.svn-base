//
//  AFamilyServer.m
//  ahome
//
//  Created by andson-dile on 15/7/28.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AFamilyServer.h"
#import "AFamily.h"
#import "AHome.h"

@implementation AFamilyServer

- (void)getFamilyHomesByUid:(int)uid callback:(void(^)(NSArray *homeInfo))callback
            failureCallback:(void(^)(NSString *resp))failureCallback {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/user/family", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    [item setPostValue:[NSString stringWithFormat:@"%i",uid] forKey:@"uid"];
    
    NSArray *objects = @[[callback copy] , [failureCallback copy]];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoGetFamilyHomeListRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    [super requestFinished:request];
    NSDictionary *requestDictionary = [request userInfo];
    NSDictionary *packData = [requestDictionary objectForKey:@"packedData"];
    
    if ([[packData objectForKey:@"status"]intValue] != 1) {
        NSString *error = [packData objectForKey:@"msg"];
        id failureCallback  = [requestDictionary objectForKey:kFailureCallback];
        ((void(^)(NSString *))failureCallback)(error);
        
        return;
    }
    
    if ([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue] == DoGetFamilyHomeListRequest) {
        AFamily *family =[[AFamily alloc]init];
        [family setFamilyCategory:@"父母圈"];
        [family setServerId:1];
        
        NSMutableArray *familyHomeList = [NSMutableArray array];
        NSDictionary *mineHomeDic = [packData objectForKey:@"mine"];
        if (mineHomeDic != nil && mineHomeDic.count > 0) {
            AHome *mineHomeInfo = [[AHome alloc]initWithJsonDictionary:mineHomeDic];
            [familyHomeList addObject:mineHomeInfo];
        }
        
        NSDictionary *parentHomeDict = [packData objectForKey:@"parent"];
        if (parentHomeDict != nil && parentHomeDict.count>0) {
            AHome *parentHomeInfo = [[AHome alloc]initWithJsonDictionary:parentHomeDict];
            [familyHomeList addObject:parentHomeInfo];
        }
        [family setHomes:familyHomeList];
        
        NSArray *familys = @[family];
        id callback  = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(NSArray*))callback)(familys);
    }
    
}

@end
