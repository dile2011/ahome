//
//  AHomeDeleteMemberController.m
//  ahome
//
//  Created by andson-dile on 15/6/4.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHomeDeleteMemberController.h"
#import "APhoneAuthButtonElement.h"
#import "APhoneAuthButtonElementView.h"
#import "AHomeLevelController.h"
#import "AHomeServer.h"

@implementation AHomeDeleteMemberController

- (id)initWithMemberInfo:(AHomeMember*)homeMember {
    self = [super init];
    _homeMember = homeMember;
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    self.root = root;
    self.root.title = @"删除成员";
    self.resizeWhenKeyboardPresented =NO;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QSection *section = [[QSection alloc]init];
    [section setKey:@"basesection"];
    [self.root addSection:section];
    
    QLabelElement *memberEle = [[QLabelElement alloc]initWithTitle:@"所属成员" Value:_homeMember.part];
    [section addElement:memberEle];
    QLabelElement *phoneEle = [[QLabelElement alloc]initWithTitle:@"手机 号" Value:_homeMember.phone];
    [section addElement:phoneEle];
    
    QSection *actionSection = [[QSection alloc]init];
    [self.root addSection:actionSection];
    APhoneAuthButtonElement *nextButtonElement = [[APhoneAuthButtonElement alloc]initWithWidth:self.width];
    nextButtonElement.buttonTitle = @"删  除";
    [nextButtonElement setKey:@"ANextActionButtonElement"];
    [actionSection addElement:nextButtonElement];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    APhoneAuthButtonElement *nextActionButtonElement = (APhoneAuthButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
    APhoneAuthButtonElementView *nextActionButtonElementView = (APhoneAuthButtonElementView*)[self.quickDialogTableView cellForElement:nextActionButtonElement];
    [nextActionButtonElementView setButtonState:EnableState];
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
                                                                    [[AHomeLevelController sharedInstance] afterMemberOpration];
                                                                    [[ANotificationCenter shareInstance]backCallByParam:@"删除成功:)"];
                                                                } failureCallback:^(NSString *resp) {
                                                                    [actionButtonViewCell setButtonState:EnableState];
                                                                    [[ANotificationCenter shareInstance]backCallByParam:resp];
                                                                }];
    
}


@end
