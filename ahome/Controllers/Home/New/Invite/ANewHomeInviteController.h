//
//  ANewHomeInviteController.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-31.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANewHomeBaseController.h"
#import "SWTableViewCell.h"

@interface ANewHomeInviteController : ANewHomeBaseController<SWTableViewCellDelegate>

@property (nonatomic,strong)NSMutableArray *inviteMembers;
@end
