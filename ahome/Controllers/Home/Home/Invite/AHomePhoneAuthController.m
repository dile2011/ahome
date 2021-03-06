//
//  AHomePhoneAuthController.m
//  ahome
//
//  Created by dilei liu on 15/2/11.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHomePhoneAuthController.h"
#import "ANextActionButtonElement.h"
#import "ANextActionButtonElementView.h"
#import "UIViewController+MJPopupViewController.h"

#import "APhoneAuthButtonElement.h"
#import "APhoneAuthButtonElementView.h"

#import "AHomeServer.h"
#import "AHomeLevelController.h"
#import "ANotificationCenter.h"


@implementation AHomePhoneAuthController

- (id)initWithMemberInfo:(AHomeMember*)homeMember {
    self = [super init];
    _homeMember = homeMember;
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    self.root = root;
    self.root.title = @"手机认证";
    self.resizeWhenKeyboardPresented = NO;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QSection *section = [[QSection alloc]init];
    [section setKey:@"baseSection"];
    [self.root addSection:section];
    
    QLabelElement *memberEle = [[QLabelElement alloc]initWithTitle:@"认证成员" Value:_homeMember.part];
    [section addElement:memberEle];
    QEntryElement *phoneEle = [[QEntryElement alloc]initWithTitle:@"" Value:@"" Placeholder:@"输入需要认证的手机号"];
    phoneEle.key = @"AHomePhoneAuth";
    phoneEle.delegate = self;
    phoneEle.keyboardType = UIKeyboardTypePhonePad;
    [section addElement:phoneEle];
    
    QSection *actionSection = [[QSection alloc]init];
    [self.root addSection:actionSection];
    APhoneAuthButtonElement *nextButtonElement = [[APhoneAuthButtonElement alloc]initWithWidth:self.width];
    nextButtonElement.buttonTitle = @"认  证";
    [nextButtonElement setKey:@"ANextActionButtonElement"];
    [actionSection addElement:nextButtonElement];
}

- (BOOL)isFinishInput {
    BOOL isInput = YES;
    
    for (QSection *section in self.root.sections) {
        for (QElement *element in section.elements) {
            if ([element isKindOfClass:[QEntryElement class]]) {
                if(((QEntryElement*)element).textValue.length == 0) {
                    isInput = NO;
                    break;
                }
            }
        }
        
        if (isInput == NO) break;
    }
    
    return isInput;
}

- (void)QEntryEditingChangedForElement:(QEntryElement *)element  andCell:(QEntryTableViewCell *)cell {
    BOOL isInput = [self isFinishInput];
    
    ANextActionButtonElement *actionButtionElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
    APhoneAuthButtonElementView *accountButtonViewCell = (APhoneAuthButtonElementView*)[self.quickDialogTableView cellForElement:actionButtionElement];
    
    if (isInput)[accountButtonViewCell setButtonState:EnableState];
    else [accountButtonViewCell setButtonState:DisableState];
}

- (void)doNextAction {
    ANextActionButtonElement *actionButtionElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
    APhoneAuthButtonElementView *accountButtonViewCell = (APhoneAuthButtonElementView*)[self.quickDialogTableView cellForElement:actionButtionElement];
    [accountButtonViewCell setButtonState:WorkState];
    
    QEntryElement *phoneElement = (QEntryElement*)[self.root elementWithKey:@"AHomePhoneAuth"];
    NSString *phoneText = phoneElement.textValue;
    
    if ([phoneText isMatchedByRegex:PhoneRegex]==NO) {
        [self verifyLoginAction:@"手机格式不符" andSection:@"baseSection"];
        return;
    }
    
    self.navigationItem.leftBarButtonItem.enabled = NO;
    [self hiddenKeyBoard];
    
    [self.view.window addSubview:[ANotificationCenter shareInstanceByNotifiType:notifiRequest info:@"发送认证请求"].view];
    [[AServerFactory getServerInstance:@"AHomeServer"]doAuthForHomeMember:phoneText andFamilyId:_familyId andMemberIndex:_index
                                                                 callback:^(BOOL status) {
                                                                     [accountButtonViewCell setButtonState:EnableState];
                                                                     self.navigationItem.leftBarButtonItem.enabled = YES;
                                                                     
                                                                     [[AHomeLevelController sharedInstance]afterMemberOpration];
                                                                     [[ANotificationCenter shareInstance]backCallByParam:@"认证成功!"];
                                                                     
                                                                } failureCallback:^(NSString *resp) {
                                                                    [accountButtonViewCell setButtonState:EnableState];
                                                                    self.navigationItem.leftBarButtonItem.enabled = YES;
                                                                    [self verifyLoginAction:resp andSection:@"baseSection"];
                                                                    [[ANotificationCenter shareInstance]backCallByParam:@"认证失败"];
                                                                }];
    
}

@end
