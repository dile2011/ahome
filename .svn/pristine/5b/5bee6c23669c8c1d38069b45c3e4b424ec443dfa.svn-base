//
//  AInviteMember.m
//  Ahome
//
//  Created by dilei liu on 14/12/21.
//  Copyright (c) 2014年 siwei. All rights reserved.
//

#import "AInviteMember.h"

@implementation AInviteMember

- (instancetype)initWithRolename:(NSString*)rolename andPhone:(NSString*)phone {
    self = [super init];
    _rolename = rolename;
    _phone = phone;
    
    if ([_rolename isEqualToString:@"家父"]) {
        self.flag = 0;
    } else if ([_rolename isEqualToString:@"家母"]) {
        self.flag = 1;
    } else if ([_rolename isEqualToString:@"家子"]) {
        self.flag = 2;
    } else if ([_rolename isEqualToString:@"家女"]) {
        self.flag = 3;
    }
    
    return self;
}

@end
