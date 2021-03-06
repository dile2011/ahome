//
//  AHomeMember.h
//  ahome
//
//  Created by dilei liu on 15/1/26.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ARecord.h"
#import "AOperate.h"

@interface AHomeMember : ARecord

typedef enum {
    StateDefault,
    StateAuth,
    StateInvite,
    StateWaitInvite,
    StateSelf,
    StateOther,
    
}MemberState;

/**
 * 大于0属于正常成员，小于0时属于添加项
 */
@property (nonatomic,assign)int flag;
@property (nonatomic,assign)int mkey;

@property (nonatomic,strong)NSString *placeHolderImage;
@property (nonatomic,assign)MemberState memberState;

@property (nonatomic,strong)NSString *uname;
@property (nonatomic,assign)long uid;
@property (nonatomic,strong)NSString *part;
@property (nonatomic,strong)NSString *phone;
@property (nonatomic,strong)NSString *avatar;

@property(nonatomic, copy) void (^selected)(void);
@property(nonatomic, copy) void (^menuOperate)(OperateType optye);

- (instancetype)initWithOtherMember:(AHomeMember*)other;

@end
