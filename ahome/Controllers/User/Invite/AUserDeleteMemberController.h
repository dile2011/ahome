//
//  AUserDeleteMemberController.h
//  ahome
//
//  Created by andson-dile on 15/6/24.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHomeDeleteMemberController.h"
#import "AUserHomePageDelegate.h"

@interface AUserDeleteMemberController : AHomeDeleteMemberController

@property (nonatomic,assign)id<AUserHomePageDelegate> delegate;

- (id)initWithMemberInfo:(AHomeMember*)homeMember delegate:(id)delegate;

@end
