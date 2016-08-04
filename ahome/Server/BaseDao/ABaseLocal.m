//
//  ABaseLocal.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-2.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ADB.h"
#import "ABaseLocal.h"
#import "ADatabase.h"
#import "ARecordQuery.h"


@implementation ABaseLocal

@synthesize db;

- (id)init{
	if(self = [super init]) {
        db = [[ADB getDataBase]retain];
	}
	
	return self;
}

-(NSString *)SQL:(NSString *)sql inTable:(NSString *)table {
	return [NSString stringWithFormat:sql, table];
}

-(NSMutableDictionary*)resultSet {
    return nil;
}

-(BOOL)insertWithObject:(ARecord*)record {
    return YES;
}

-(BOOL)updateAtIndex:(NSInteger)index record:(ARecord*)record {
    return YES;
}

-(BOOL)deleteAtIndex:(NSInteger)index {
    return YES;
}

- (BOOL)deleteAllRecord {
    return YES;
}

-(ARecord *)selectRecordById:(NSInteger)idx {

    return nil;
}

- (NSArray *)selectAllRecord {
    return nil;
}

- (void)dealloc {
	[db release];
    db = nil;
	[super dealloc];
}

@end