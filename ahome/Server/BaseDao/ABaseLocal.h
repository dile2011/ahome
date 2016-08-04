//
//  ABaseLocal.h
//  AtHomeApp
//
//  Created by dilei liu on 14-9-2.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARecord.h"
#import "RequestDelegate.h"

@class ADatabase;

@interface ABaseLocal : NSObject {
	ADatabase *db;
}


@property (nonatomic, retain) ADatabase *db;

-(NSMutableDictionary*)resultSet;
-(BOOL)insertWithObject:(ARecord*)record;
-(BOOL)updateAtIndex:(NSInteger)index record:(ARecord*)record;
-(BOOL)deleteAtIndex:(NSInteger)index;
- (BOOL)deleteAllRecord;
-(ARecord*)selectRecordById:(NSInteger)idx;
- (NSArray*)selectAllRecord;

-(NSString *)SQL:(NSString *)sql inTable:(NSString *)table;

@end