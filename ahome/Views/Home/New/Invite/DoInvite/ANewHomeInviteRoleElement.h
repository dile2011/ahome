//
//  ANewHomeInviteRoleElement.h
//  AtHomeApp
//
//  Created by dilei liu on 14-9-3.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "QLabelElement.h"

@interface ANewHomeInviteRoleElement : QLabelElement {
    NSString *_role;
    NSArray *_selRoles;
}

- (QRootElement *)initWithRole:(NSString*)role andSelRoles:(NSArray*)selRoles;

@end
