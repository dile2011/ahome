//
//  AHomeUserServer.m
//  ahome
//
//  Created by dilei liu on 15/1/14.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHomeUserServer.h"
#import "AHomeInfo.h"

@implementation AHomeUserServer

- (void)uploadFacePictureByFile:(NSData*)file
                       callback:(void(^)(NSString *userFaceUrl))callback
                failureCallback:(void(^)(NSString *resp))failureCallback {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/Upload", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    [item setPostValue:@"1" forKey:@"imgType"];
    [item setPostValue:@"0" forKey:@"uploadType"];
    [item addData:file withFileName:@"userface.jpg" andContentType:@"image/jpeg" forKey:@"file"];
    
    
    NSArray *objects = @[[callback copy] , [failureCallback copy]];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoUserPictureRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];
}

- (void)selectUserInfoByUid:(long)uid callback:(void(^)(AUser *user))callback
            failureCallback:(void(^)(NSString *resp))failureCallback {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/user", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    if (uid > 0) [item setPostValue:[NSString stringWithFormat:@"%ld",uid] forKey:@"uid"];
    
    NSArray *objects = @[[callback copy] , [failureCallback copy]];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoGetUserInfoRequest],USER_INFO_KEY_TYPE, nil]];
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
    
    if ([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue] == DoUserPictureRequest) {
        NSArray *datas = [packData objectForKey:@"data"];
        
        NSDictionary *dataDic = [datas firstObject];
        NSString *faceUrl = [dataDic objectForKey:@"image"];
        
        id callback  = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(NSString *))callback)(faceUrl);
    }
    
    if ([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue] == DoGetUserInfoRequest) {
        NSDictionary *uinfoDic = [packData objectForKey:@"uinfo"];
        
        int gender = [[uinfoDic objectForKey:@"gender"]intValue];
        NSString *region = [uinfoDic objectForKey:@"region"];
        NSString *birthday = [uinfoDic objectForKey:@"birthday"];
        NSString *photo = [uinfoDic objectForKey:@"photo"];
        NSString *avatar = [uinfoDic objectForKey:@"avatar"];
        
        AUser *user = [AUser sharedInstance];
        [user setGender:gender];
        [user setRegion:region];
        [user setBrithday:birthday];
        [user setPhone:photo];
        [user setAvatar:avatar];
        
        NSArray *familyDicts = [packData objectForKey:@"family"];
        NSMutableArray *familys = [NSMutableArray array];
        for (NSDictionary *fd in familyDicts) {
            AHomeInfo *family = [[AHomeInfo alloc]initWithJsonDictionary:fd];
            [familys addObject:family];
        }
        [user setFamilys:familys];
        
        
        id callback  = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(AUser *))callback)(user);
    }
    
}

@end
