//
//  AUser.h
//  ahome
//
//  Created by dilei liu on 15/1/14.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ARecord.h"

@interface AUser : ARecord

@property (nonatomic,retain) NSString *phone;
@property (nonatomic,retain) NSString *uname;
@property (nonatomic,assign) BOOL familyNo;

/*!
 性别 0:女 1:男
 */
@property (nonatomic,assign) int gender;

/*!
 所在地区
 */
@property (nonatomic,retain) NSString *region;

/*!
 头像url路径地址
 */
@property (nonatomic,retain) NSString *avatar;

/*!
 生日
 */
@property (nonatomic,retain) NSString *brithday;

/*!
 照片url路径地址
 */
@property (nonatomic,retain) NSString *photo;

/*!
 用户家庭列表
 */
@property (nonatomic,retain) NSMutableArray *familys;

+ (id)sharedInstance;

@end
