//
//  ARegisterIdentityController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-25.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ARegisterIdentityController.h"
#import "ARegisterViewController.h"
#import "AauthCodeElement.h"
#import "ANextActionButtonElement.h"
#import "ANextActionButtonElementView.h"
#import "ANameEntryElement.h"
#import "APersonSexElement.h"
#import "APersonSecElementView.h"
#import "QDateTimeInlineElement.h"
#import "AauthCodeElement.h"
#import "AAauthCodeElementView.h"
#import "ARegisterServer.h"

@implementation ARegisterIdentityController

- (id)init {
    self = [super init];
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    self.root = root;
    self.resizeWhenKeyboardPresented =YES;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QSection *identitySection = [[QSection alloc]init];
    [self.root addSection:identitySection];

    ANameEntryElement *nameELement = [[ANameEntryElement alloc]initWithTitle:@"" Value:@"" Placeholder:@"姓"];
    [nameELement setKey:@"ANameEntryElement"];
    [identitySection addElement:nameELement];
    
    APersonSexElement *sexElement = [[APersonSexElement alloc]initWithTitle:@"性别" Value:nil];
    [sexElement setKey:@"APersonSexElement"];
    [identitySection addElement:sexElement];
    
    QDateTimeInlineElement *brithdayElement = [[QDateTimeInlineElement alloc]initWithTitle:@"生日" date:[NSDate date] andMode:UIDatePickerModeDate];
    [brithdayElement setKey:@"BrithDayElement"];
    [identitySection addElement:brithdayElement];
    
    //
    QSection *authCodeSection = [[QSection alloc]init];
    [authCodeSection setKey:@"AuthCodeSection"];
    [self.root addSection:authCodeSection];
    AauthCodeElement *authCodeElement1 = [[AauthCodeElement alloc]initWithTitle:@"" Value:@"" Placeholder:@"6位验证码"];
    authCodeElement1.keyboardType = UIKeyboardTypeNumberPad;
    authCodeElement1.delegate = self;
    authCodeElement1.key = @"AuthCodeElement";
    [authCodeSection addElement:authCodeElement1];
    
    
    //
    QSection *actionSection = [[QSection alloc]init];
    [self.root addSection:actionSection];
    ANextActionButtonElement *nextButtonElement = [[ANextActionButtonElement alloc]init];
    [nextButtonElement setKey:@"ANextActionButtonElement"];
    [actionSection addElement:nextButtonElement];
}

- (void)doNextAction {
    //
    ANameEntryElement *nameElement = (ANameEntryElement*)[self.root elementWithKey:@"ANameEntryElement"];
    NSString *lastName = nameElement.textValue;
    NSString *firstName = [nameElement getNameTextValue];
    if (lastName.length ==0 && firstName.length ==0) {
        [self verifyLoginAction:@"请填写您的真实姓名" andSection:@"AuthCodeSection"];return;
    }
    
    //
    AauthCodeElement *authCodeEle = (AauthCodeElement*)[self.root elementWithKey:@"AuthCodeElement"];
    AAauthCodeElementView *cellView = (AAauthCodeElementView*)[self.quickDialogTableView cellForElement:authCodeEle];
    NSString *authcode = cellView.textField.text;
    
    //
    APersonSexElement *sexElement = (APersonSexElement*)[self.root elementWithKey:@"APersonSexElement"];
    APersonSecElementView *sexEleView = (APersonSecElementView*)[self.quickDialogTableView cellForElement:sexElement];
    int sexValue = sexEleView.sexValue;
    
    //
    QDateTimeInlineElement *brithDayElement = (QDateTimeInlineElement*)[self.root elementWithKey:@"BrithDayElement"];
    NSDate *brithDate = brithDayElement.dateValue;
    NSString *birthValue = [[AUtilities sharedInstance]formatDate:brithDate];
    
    //
    ARegisterViewController *registerCon = (ARegisterViewController*)self.delegate;
    ARegisterForm *registerForm = registerCon.registerForm;
    registerForm.lastName = lastName;
    registerForm.firstName = firstName;
    registerForm.sex = sexValue;
    registerForm.birth = birthValue;
    
    if (![registerForm.verifyCode isEqualToString:authcode]) {
        [self verifyLoginAction:@"验证码错误" andSection:@"AuthCodeSection"];return;
    }
    
    ANextActionButtonElement *nextActionButtonElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
    ANextActionButtonElementView *nextActionButtonElementView = (ANextActionButtonElementView*)[self.quickDialogTableView cellForElement:nextActionButtonElement];
    [nextActionButtonElementView setButtonState:WorkState];
    
    [[AServerFactory getServerInstance:@"ARegisterServer"]doRegisterUser:registerForm callback:^(NSString *uid) {
        registerForm.uid = uid;
        [nextActionButtonElementView setButtonState:EnableState];
        [self.delegate doNextAction:RegisterAreaForm];
        [self.delegate setRegisterData:registerForm];
        
    } failureCallback:^(NSString *resp) {
        [self verifyLoginAction:resp andSection:@"AuthCodeSection"];
    }];
}

/**
 * 发送获取验证码请求
 */
- (void)doSendValidateAction {
    ARegisterViewController *registerCon = (ARegisterViewController*)self.delegate;
    ARegisterForm *registerForm = registerCon.registerForm;
    
    [[AServerFactory getServerInstance:@"ARegisterServer"]doGetVerifyCode:registerForm.phone callback:^(NSString *code) {
        registerForm.verifyCode = code;
        [self verifyLoginAction:code andSection:@"AuthCodeSection"];
    } failureCallback:^(NSString *resp) {
        
    }];

}

- (void)QEntryEditingChangedForElement:(QEntryElement *)element  andCell:(QEntryTableViewCell *)cell {
    BOOL isInput = [self isFinishInput];
    ANextActionButtonElement *actionButtionElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
    ANextActionButtonElementView *accountButtonViewCell = (ANextActionButtonElementView*)[self.quickDialogTableView cellForElement:actionButtionElement];
    
    if (isInput)[accountButtonViewCell setButtonState:EnableState];
    else [accountButtonViewCell setButtonEnable:DisableState];
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
