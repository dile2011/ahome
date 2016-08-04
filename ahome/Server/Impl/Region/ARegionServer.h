//
//  ARegionServer.h
//  AtHomeApp
//
//  Created by dilei liu on 14-10-6.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ARegionLocalServer.h"

@interface ARegionServer : ARegionLocalServer

/**
 * 搜索楼盘或社区
 */
- (void)doSearchRegionByCidyCode:(NSString*)cityCode andDistrictCode:(NSString*)districtCode andRegionName:(NSString *)regionName
                        callback:(void(^)(NSArray *data))callback
                 failureCallback:(void(^)(NSString *resp))failureCallback;

/**
 * 创建社区
 */
- (void)newRegionByCityCode:(NSString*)cityCode andRegionName:(NSString*)regionName andRegionCode:(NSString*)regionCode
                   callback:(void(^)(NSString* region))callback
            failureCallback:(void(^)(NSString *resp))failureCallback;

@end
