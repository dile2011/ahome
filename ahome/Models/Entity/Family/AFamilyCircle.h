//
//  AFamilyCircle.h
//  ahome
//
//  Created by andson-dile on 15/7/2.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ARecord.h"

@interface AFamilyCircle : ARecord

@property (nonatomic,retain)NSString *circleName;
@property (nonatomic,assign)BOOL isUnlock;
@property(nonatomic, copy) void (^onSelected)(void);

- (instancetype)initWithCircleName:(NSString*)circleName isUnlock:(BOOL)unlock onSelect:(void (^)(void))selected;

@end
