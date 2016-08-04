//
//  AUserDeleteMemberController.m
//  ahome
//
//  Created by andson-dile on 15/6/24.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AUserDeleteMemberController.h"
#import "ANextActionButtonElement.h"
#import "APhoneAuthButtonElementView.h"
#import "AHomeServer.h"

@implementation AUserDeleteMemberController

- (id)initWithMemberInfo:(AHomeMember*)homeMember delegate:(id)delegate {
    self = [super initWithMemberInfo:homeMember];
    self.delegate = delegate;
    
    return self;
}

- (void)doNextAction {
    ANextActionButtonElement *actionButtionElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
    APhoneAuthButtonElementView *actionButtonViewCell = (APhoneAuthButtonElementView*)[self.quickDialogTableView cellForElement:actionButtionElement];
    [actionButtonViewCell setButtonState:WorkState];
    
    self.navigationItem.leftBarButtonItem.enabled = NO;
    [self hiddenKeyBoard];
    
    [self.view.window addSubview:[ANotificationCenter shareInstanceByNotifiType:notifiRequest info:@"发送删除请求"].view];
    [[AServerFactory getServerInstance:@"AHomeServer"]doDeleteForHomeMember:[NSString stringWithFormat:@"%i",_homeMember.mkey]
                                                                andFamilyId:self.familyId callback:^(BOOL status) {
                                                                    [actionButtonViewCell setButtonState:EnableState];
                                                                    [self.delegate afterMemberOpration];
                                                                    [[ANotificationCenter shareInstance]backCallByParam:@"删除成功:)"];
                                                                } failureCallback:^(NSString *resp) {
                                                                    [actionButtonViewCell setButtonState:EnableState];
                                                                    [[ANotificationCenter shareInstance]backCallByParam:resp];
                                                                }];
    
}

@end
