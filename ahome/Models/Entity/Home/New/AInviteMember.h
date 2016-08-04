//
//  AInviteMember.h
//  Ahome
//
//  Created by dilei liu on 14/12/21.
//  Copyright (c) 2014年 siwei. All rights reserved.
//

#import "ARecord.h"

@interface AInviteMember : ARecord

@property (nonatomic,retain)NSString *rolename;
@property (nonatomic,retain)NSString *phone;
@property (nonatomic,assign)int flag;

- (instancetype)initWithRolename:(NSString*)rolename andPhone:(NSString*)phone;

@end
