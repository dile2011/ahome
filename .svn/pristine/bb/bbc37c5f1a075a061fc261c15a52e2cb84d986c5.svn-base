//
//  ARegisterAccountController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-25.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ARegisterAccountController.h"
#import "ARegisterViewController.h"
#import "ANextActionButtonElementView.h"
#import "AAreaPickViewElement.h"
#import "ARegisterServer.h"
#import "ANextActionButtonElement.h"
#import "EncryptAndDecryptTool.h"

@implementation ARegisterAccountController

- (id)init {
    self = [super init];
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    self.root = root;
    self.resizeWhenKeyboardPresented =YES;
    
    _accountForm = [[ARegisterAccountForm alloc]init];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QSection *accountSection = [[QSection alloc]init];
    [accountSection setKey:@"AccountSection"];
    [self.root addSection:accountSection];
    QEntryElement *phoneElement = [[QEntryElement alloc]initWithTitle:@"" Value:@"" Placeholder:@"手机号"];
    phoneElement.keyboardType = UIKeyboardTypeNumberPad;
    [phoneElement setKey:@"PhoneElement"];
    phoneElement.delegate = self;
    [accountSection addElement:phoneElement];
    
    QEntryElement *passwordElement = [[QEntryElement alloc]initWithTitle:@"" Value:@"" Placeholder:@"输入密码"];
    [passwordElement setKey:@"PasswordElement"];
    passwordElement.delegate = self;
    [passwordElement setSecureTextEntry:YES];
    [accountSection addElement:passwordElement];
    
    QEntryElement *rePasswordElement = [[QEntryElement alloc]initWithTitle:@"" Value:@"" Placeholder:@"验证密码"];
    [rePasswordElement setKey:@"RePasswordElement"];
    rePasswordElement.delegate = self;
    [rePasswordElement setSecureTextEntry:YES];
    [accountSection addElement:rePasswordElement];
    
    //
    QSection *actionSection = [[QSection alloc]init];
    [self.root addSection:actionSection];
    
    ANextActionButtonElement *nextButtonElement = [[ANextActionButtonElement alloc]init];
    [nextButtonElement setKey:@"ANextActionButtonElement"];
    [actionSection addElement:nextButtonElement];
}


- (void)doNextAction {
    [self hiddenKeyBoard];
    
    // 手机号验证
    QEntryElement *phoneEle = (QEntryElement*)[self.root elementWithKey:@"PhoneElement"];
    if ([phoneEle.textValue isMatchedByRegex:PhoneRegex]==NO){
        [self verifyLoginAction:@"手机格式不符" andSection:@"AccountSection"];
        return;
    }
    _accountForm.phone = phoneEle.textValue;
    
    // 密码验证
    QEntryElement *passwordEle = (QEntryElement*)[self.root elementWithKey:@"PasswordElement"];
    if(passwordEle.textValue.length < 6){
        [self verifyLoginAction:@"密码长度不能小于6位" andSection:@"AccountSection"];
        return;
    }
    
    // 验证信息
    QEntryElement *repasswordEle = (QEntryElement*)[self.root elementWithKey:@"RePasswordElement"];
    if(![repasswordEle.textValue isEqualToString:passwordEle.textValue]){
        [self verifyLoginAction:@"验证密码失败" andSection:@"AccountSection"];
        return;
    }
    _accountForm.passwd = repasswordEle.textValue;
    
    ANextActionButtonElement *nextActionButtonElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
    ANextActionButtonElementView *nextActionButtonElementView = (ANextActionButtonElementView*)[self.quickDialogTableView cellForElement:nextActionButtonElement];
    [nextActionButtonElementView setButtonState:WorkState];
    
    
    [[AServerFactory getServerInstance:@"ARegisterServer"]doVerifyPhoneUnique:_accountForm.phone callback:^(BOOL unique) {
        [nextActionButtonElementView setButtonState:EnableState];
        [self.delegate setRegisterData:_accountForm];
        [self.delegate doNextAction:RegisterIdentityForm];
        
    } failureCallback:^(NSString *resp) {
        [self verifyLoginAction:resp andSection:@"AccountSection"];
        [nextActionButtonElementView setButtonState:EnableState];
    }];
}

- (void)QEntryEditingChangedForElement:(QEntryElement *)element  andCell:(QEntryTableViewCell *)cell {
    BOOL isInput = [self isFinishInput];
    
    ANextActionButtonElement *actionButtionElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
    ANextActionButtonElementView *accountButtonViewCell = (ANextActionButtonElementView*)[self.quickDialogTableView cellForElement:actionButtionElement];
    
    if (isInput)[accountButtonViewCell setButtonState:EnableState];
    else [accountButtonViewCell setButtonState:DisableState];
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

@end
