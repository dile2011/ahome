//
//  AUserInviteActiveController.m
//  ahome
//
//  Created by andson-dile on 15/6/24.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AUserInviteActiveController.h"
#import "APhoneAuthButtonElement.h"
#import "APhoneAuthButtonElementView.h"
#import "AHomeServer.h"

@implementation AUserInviteActiveController

- (id)initWithMemberInfo:(AHomeMember*)homeMember delegate:(id)delegate {
    self = [super initWithMemberInfo:homeMember];
    self.delegate = delegate;
    
    return self;
}

- (void)doNextAction {
    APhoneAuthButtonElement *nextActionButtonElement = (APhoneAuthButtonElement*)[self.root elementWithKey:@"APhoneAuthButtonElement"];
    APhoneAuthButtonElementView *nextActionButtonElementView = (APhoneAuthButtonElementView*)[self.quickDialogTableView cellForElement:nextActionButtonElement];
    [nextActionButtonElementView setButtonState:WorkState];
    
    self.navigationItem.leftBarButtonItem.enabled = NO;
    [self.view.window addSubview:[ANotificationCenter shareInstanceByNotifiType:notifiRequest info:@"发送邀请"].view];
    [[AServerFactory getServerInstance:@"AHomeServer"]doInviteForHomeMember:_homeMember.phone andFamilyId:self.familyId callback:^(BOOL status) {
        self.navigationItem.leftBarButtonItem.enabled = YES;
        [[ANotificationCenter shareInstance]backCallByParam:@"邀请成功:)"];
        [self.delegate afterMemberOpration];
        [nextActionButtonElementView setButtonState:EnableState];
    } failureCallback:^(NSString *resp) {
        self.navigationItem.leftBarButtonItem.enabled = YES;
        [self verifyLoginAction:@"发送失败" andSection:@"basesection"];
        [[ANotificationCenter shareInstance]backCallByParam:@"邀请失败:O)"];
        [nextActionButtonElementView setButtonState:EnableState];
    }];
}


@end
