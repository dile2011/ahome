
//
//  AHome.m
//  ahome
//
//  Created by dilei liu on 15/1/27.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHome.h"
#import "AHomeMember.h"

@implementation AHome

- (instancetype)init {
    self = [super init];
    self.members = [NSMutableArray array];

    return self;
}

- (void)updateWithJSonDictionary:(NSDictionary *)dic {
    self.familyId = [[dic objectForKey:@"family_id"]intValue];
    self.photo = [dic objectForKey:@"photo"];

    self.members = [NSMutableArray array];
    NSArray *members = [dic objectForKey:@"member"];
    for (NSDictionary *memberDic in members) {
        int mkey = (int)[members indexOfObject:memberDic];
        AHomeMember *homeMember = [[AHomeMember alloc]initWithJsonDictionary:memberDic];
        homeMember.mkey = mkey;
        [_members addObject:homeMember];
    }

}


@end