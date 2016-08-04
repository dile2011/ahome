//
//  AMergeHomeInfo.m
//  ahome
//
//  Created by andson-dile on 15/6/18.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AMergeHomeInfo.h"
#import "AUserCookie.h"

@implementation AMergeHomeInfo

- (instancetype)initWithHomeInfo:(NSDictionary*)homeInfoDic {
    self = [super init];
    self.members = [NSMutableArray array];
    
    BOOL hadMe = NO;
    AUserCookie *userCookie = [AUserCookie userCookie];

    NSMutableArray *mineHomeMembers = [NSMutableArray array];
    AHome *mineHomeInfo = [homeInfoDic objectForKey:@"mine"];
    for (AHomeMember *member in mineHomeInfo.members) {
        AMergeHomeMember *homemember = [[AMergeHomeMember alloc]initWithMember:member photo:mineHomeInfo.photo familyId:mineHomeInfo.familyId];
        homemember.homeType = MineHomeType;
        
        if (userCookie.serverId==homemember.uid) {
            [mineHomeMembers insertObject:homemember atIndex:0];hadMe = YES;
            
        } else {
            [mineHomeMembers addObject:homemember];
        }
    }
    
    NSMutableArray *parentHomeMembers = [NSMutableArray array];
    AHome *parentHomeInfo = [homeInfoDic objectForKey:@"parent"];
    for (AHomeMember *member in parentHomeInfo.members) {
        AMergeHomeMember *homemember = [[AMergeHomeMember alloc]initWithMember:member photo:parentHomeInfo.photo familyId:parentHomeInfo.familyId];
        homemember.homeType = ParentHomeType;
        if (userCookie.serverId==member.uid) {
            if (hadMe)continue;
            else [parentHomeMembers insertObject:homemember atIndex:0];
            
        } else {
            [parentHomeMembers addObject:homemember];
        }
    }
    
    if (mineHomeMembers.count >= parentHomeMembers.count) {
        _members = [NSMutableArray arrayWithArray:mineHomeMembers];
        for (AMergeHomeMember *mergeMemger in parentHomeMembers) {
            NSUInteger index = [parentHomeMembers indexOfObject:mergeMemger];
            [_members insertObject:mergeMemger atIndex:index*2+1];
        }
        
    } else if(mineHomeMembers.count < parentHomeMembers.count) {
        _members = [NSMutableArray arrayWithArray:parentHomeMembers];
        for (AMergeHomeMember *mergeMemger in mineHomeMembers) {
            NSUInteger index = [mineHomeMembers indexOfObject:mergeMemger];
            [_members insertObject:mergeMemger atIndex:index*2+1];
        }
    }

    __block NSUInteger memberNum = _members.count-1;
    float angle = 360./memberNum;
    for (AMergeHomeMember *homeMerge in _members) {
        NSUInteger index = [_members indexOfObject:homeMerge];
        homeMerge.angle = index*angle;
    }


    return self;
}

@end
