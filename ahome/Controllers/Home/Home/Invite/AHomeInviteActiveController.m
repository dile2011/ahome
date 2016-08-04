//
//  AHomeInviteActiveController.m
//  ahome
//
//  Created by dilei liu on 15/2/11.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHomeInviteActiveController.h"
#import "APhoneAuthButtonElement.h"
#import "APhoneAuthButtonElementView.h"

#import "AHomeLevelController.h"
#import "AHomeServer.h"


@implementation AHomeInviteActiveController

- (id)initWithMemberInfo:(AHomeMember*)homeMember {
    self = [super init];
    _homeMember = homeMember;
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    self.root = root;
    self.root.title = @"邀请激活";
    self.resizeWhenKeyboardPresented =NO;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QSection *section = [[QSection alloc]init];
    [section setKey:@"basesection"];
    [self.root addSection:section];
    
    QLabelElement *memberEle = [[QLabelElement alloc]initWithTitle:@"邀请成员" Value:_homeMember.part];
    [section addElement:memberEle];
    
    QLabelElement *phoneEle = [[QLabelElement alloc]initWithTitle:@"发送手机号" Value:_homeMember.phone];
    [section addElement:phoneEle];
    
    QSection *actionSection = [[QSection alloc]init];
    [self.root addSection:actionSection];
    APhoneAuthButtonElement *nextButtonElement = [[APhoneAuthButtonElement alloc]initWithWidth:self.width];
    nextButtonElement.key = @"APhoneAuthButtonElement";
    nextButtonElement.buttonTitle = @"发送邀请";
    [actionSection addElement:nextButtonElement];   
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    APhoneAuthButtonElement *nextActionButtonElement = (APhoneAuthButtonElement*)[self.root elementWithKey:@"APhoneAuthButtonElement"];
    APhoneAuthButtonElementView *nextActionButtonElementView = (APhoneAuthButtonElementView*)[self.quickDialogTableView cellForElement:nextActionButtonElement];
    [nextActionButtonElementView setButtonState:EnableState];
}


- (void)doNextAction {
    APhoneAuthButtonElement *nextActionButtonElement = (APhoneAuthButtonElement*)[self.root elementWithKey:@"APhoneAuthButtonElement"];
    APhoneAuthButtonElementView *nextActionButtonElementView = (APhoneAuthButtonElementView*)[self.quickDialogTableView cellForElement:nextActionButtonElement];
    [nextActionButtonElementView setButtonState:WorkState];
    
    self.navigationItem.leftBarButtonItem.enabled = NO;
    [self.view.window addSubview:[ANotificationCenter shareInstanceByNotifiType:notifiRequest info:@"发送邀请"].view];
    [[AServerFactory getServerInstance:@"AHomeServer"]doInviteForHomeMember:_homeMember.phone andFamilyId:_familyId callback:^(BOOL status) {
                                                                     self.navigationItem.leftBarButtonItem.enabled = YES;
                                                                     [[ANotificationCenter shareInstance]backCallByParam:@"邀请成功:)"];
                                                                     [[AHomeLevelController sharedInstance]afterMemberOpration];
                                                                     [nextActionButtonElementView setButtonState:EnableState];
                                                                 } failureCallback:^(NSString *resp) {
                                                                     self.navigationItem.leftBarButtonItem.enabled = YES;
                                                                     [self verifyLoginAction:@"发送失败" andSection:@"basesection"];
                                                                     [[ANotificationCenter shareInstance]backCallByParam:@"邀请失败:O)"];
                                                                     [nextActionButtonElementView setButtonState:EnableState];
                                                                 }];
}




@end
