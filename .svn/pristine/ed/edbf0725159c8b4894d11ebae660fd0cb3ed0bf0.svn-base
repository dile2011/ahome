//
//  ARegionLocalServer.m
//  AtHomeApp
//
//  Created by dilei liu on 14-10-6.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ARegionLocalServer.h"
#import "ASiWeiArea.h"

#define TABLE_NAME      @"tb_region_division"

@implementation ARegionLocalServer

- (NSArray*)getAreaDataByRegionCode:(NSString*)code {

    NSMutableArray *areas = [NSMutableArray array];
    
    NSString *sqlString = [NSString stringWithFormat:@"SELECT id,region_code,region_name FROM '%@' where parent_div_code = %@",TABLE_NAME,code];
    AResultSet *rs = [db executeQuery:sqlString];
    
    while ([rs next]){
        ASiWeiArea *area = [[ASiWeiArea alloc]init];
        
        [area setLocalId:[rs stringForColumn:@"id"]];
        [area setRegionCode:[rs stringForColumn:@"region_code"]];
        [area setRegionName:[rs stringForColumn:@"region_name"]];
        
        [areas addObject:area];
    } [rs close];
    
    if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
        return nil;
	}
    
    return areas;
}


- (NSArray*)selectAreaDataByLevel:(int)areaLevel {
    NSMutableArray *areas = [NSMutableArray array];

    NSString *sqlString = [NSString stringWithFormat:@"SELECT id,region_code,region_name FROM '%@' where region_level= %i",TABLE_NAME,areaLevel];
    
    AResultSet *rs = [db executeQuery:sqlString];

    while ([rs next]){
        ASiWeiArea *area = [[ASiWeiArea alloc]init];
        
        [area setLocalId:[rs stringForColumn:@"id"]];
        [area setRegionCode:[rs stringForColumn:@"region_code"]];
        [area setRegionName:[rs stringForColumn:@"region_name"]];
        
        [areas addObject:area];
    } [rs close];
    
    if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
        return nil;
	}

    return areas;
}

@end
