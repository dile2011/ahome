//
//  AHomeAddMemberController.m
//  ahome
//
//  Created by dilei liu on 15/2/14.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHomeAddMemberController.h"
#import "AHomeLevelController.h"
#import "ANewHomeInviteRoleElement.h"
#import "ANewHomeInviteRoleElementView.h"
#import "ANextActionButtonElement.h"
#import "ANextActionButtonElementView.h"
#import "AHomeServer.h"
#import "AInviteMember.h"
#import "APhoneAuthButtonElement.h"

@implementation AHomeAddMemberController

- (id)init {
    self = [super init];
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    self.root = root;
    self.root.title = @"添加成员";
    self.resizeWhenKeyboardPresented =NO;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QSection *section = [[QSection alloc]initWithTitle:@"选择添加的成员角色"];
    [section setKey:@"basesection"];
    [self.root addSection:section];
    
    AInviteMember *inviteMember = [[AInviteMember alloc]initWithRolename:@"家母" andPhone:@""];
    ANewHomeInviteRoleElement *homeRoleElement = [[ANewHomeInviteRoleElement alloc]initWithRole:@"家父" andSelRoles:@[inviteMember]];
    [homeRoleElement setKey:@"AHomeInviteRoleElement"];
    [section addElement:homeRoleElement];
    
    QEntryElement *phoneEle = [[QEntryElement alloc]initWithTitle:@"" Value:@"" Placeholder:@"成员手机号"];
    [phoneEle setKey:@"phoneElement"];
    [section addElement:phoneEle];
    
    QSection *actionSection = [[QSection alloc]init];
    [self.root addSection:actionSection];
    APhoneAuthButtonElement *nextButtonElement = [[APhoneAuthButtonElement alloc]initWithWidth:self.width];
    nextButtonElement.key = @"AddMemberAction";
    nextButtonElement.buttonTitle = @"添  加";
    [actionSection addElement:nextButtonElement];
}

- (void)checkInviteInfo {
    APhoneAuthButtonElement *inviteEle =  (APhoneAuthButtonElement*)[self.root elementWithKey:@"AHomeInviteRoleElement"];
    ANewHomeInviteRoleElementView *eleView = (ANewHomeInviteRoleElementView*)[self.quickDialogTableView cellForElement:inviteEle];
    
    ANextActionButtonElement *actionButtionElement = (ANextActionButtonElement*)[self.root elementWithKey:@"AddMemberAction"];
    ANextActionButtonElementView *accountButtonViewCell = (ANextActionButtonElementView*)[self.quickDialogTableView cellForElement:actionButtionElement];
    if (eleView.roleName.length > 0) {
        [accountButtonViewCell setButtonState:EnableState];
    }
}

- (void)doNextAction {
    APhoneAuthButtonElement *nextActionButtonElement = (APhoneAuthButtonElement*)[self.root elementWithKey:@"AddMemberAction"];
    ANextActionButtonElementView *nextActionButtonElementView = (ANextActionButtonElementView*)[self.quickDialogTableView cellForElement:nextActionButtonElement];
    [nextActionButtonElementView setButtonState:WorkState];
    
    APhoneAuthButtonElement *inviteEle =  (APhoneAuthButtonElement*)[self.root elementWithKey:@"AHomeInviteRoleElement"];
    ANewHomeInviteRoleElementView *eleView = (ANewHomeInviteRoleElementView*)[self.quickDialogTableView cellForElement:inviteEle];
    
    QEntryElement *phoneEle = (QEntryElement*)[self.root elementWithKey:@"phoneElement"];
    NSString *phoneText = phoneEle.textValue;
    
    self.navigationItem.leftBarButtonItem.enabled = NO;
    [self.view.window addSubview:[ANotificationCenter shareInstanceByNotifiType:notifiRequest info:@"请求添加一个成员"].view];
    [[AServerFactory getServerInstance:@"AHomeServer"]doAddForHomeMember:phoneText andFamilyId:_familyId andPart:eleView.roleName
                                                                callback:^(BOOL status) {
                                                                    
        self.navigationItem.leftBarButtonItem.enabled = YES;
        [[AHomeLevelController sharedInstance]afterMemberOpration];
        [nextActionButtonElementView setButtonState:EnableState];
        [[ANotificationCenter shareInstance]backCallByParam:@"添加成功:)"];
    } failureCallback:^(NSString *resp) {
        self.navigationItem.leftBarButtonItem.enabled = YES;
        [self verifyLoginAction:@"添加失败" andSection:@"basesection"];
        [nextActionButtonElementView setButtonState:EnableState];
        [[ANotificationCenter shareInstance]backCallByParam:@"添加失败:)"];
    }];
}

@end
