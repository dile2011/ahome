//
//  AHomeInviteActiveController.h
//  ahome
//
//  Created by dilei liu on 15/2/11.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AQuickPopupController.h"
#import "AHomeMember.h"

@interface AHomeInviteActiveController : AQuickPopupController {
    AHomeMember *_homeMember;
}

@property (nonatomic,assign)float width;
@property (nonatomic,assign)long familyId;

- (id)initWithMemberInfo:(AHomeMember*)homeMember;
@end
