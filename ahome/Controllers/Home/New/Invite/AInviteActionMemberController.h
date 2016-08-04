//
//  AInviteActionMemberController.h
//  AtHomeApp
//
//  Created by dilei liu on 14-9-2.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "QuickDialogController.h"
#import <AddressBookUI/AddressBookUI.h>

@interface AInviteActionMemberController : QuickDialogController<ABPeoplePickerNavigationControllerDelegate> {
    NSString *_role;
    NSArray *_selRoles;
}

- (instancetype)initWithRoleName:(NSString*)roleName andSelRoles:(NSArray*)selRoles;
- (void)checkInviteInfo;

@end
