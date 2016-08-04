//
//  AHomeRoleLocalServer.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-6.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AHomeRoleLocalServer.h"
#import "AHomeRole.h"

#define TABLE_NAME      @"tb_home_role"

@implementation AHomeRoleLocalServer

- (NSArray *)selectAllRecord {
    NSString *sqlString = [NSString stringWithFormat:@"SELECT * FROM '%@'",TABLE_NAME];
    AResultSet *rs = [db executeQuery:sqlString];
    
    NSMutableArray *roles = [NSMutableArray array];
    while ([rs next]){
        AHomeRole *role = [[AHomeRole alloc]init];
        [role setRecordId:[rs intForColumn:@"record_id"]];
        [role setRoleName:[rs stringForColumn:@"rolename"]];
        
        [roles addObject:role];
    } [rs close];
    
    if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
    
    return roles;
}

@end
