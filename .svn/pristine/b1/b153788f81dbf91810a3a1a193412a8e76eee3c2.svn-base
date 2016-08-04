//
//  ALoginViewController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-24.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ALoginViewController.h"
#import "AMainRootController.h"
#import "ALoginActionButtonElement.h"
#import "ALogintActionButtonElementView.h"
#import "EncryptAndDecryptTool.h"
#import "ALoginServer.h"

#import "AStarViewController.h"

@implementation ALoginViewController

- (id)init {
    self = [super init];
    self.isPush = NO;
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    root.title = @"登 录";
    self.root = root;
    self.resizeWhenKeyboardPresented =YES;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[AStarViewController sharedInstance]updateStatuBarColorByStyle:UIStatusBarStyleLightContent];
    
    //
    QSection *accountSection = [[QSection alloc]init];
    [accountSection setKey:@"AccountSection"];
    [self.root addSection:accountSection];
    
    QEntryElement *accountElement = [[QEntryElement alloc]initWithTitle:@"" Value:@"" Placeholder:@"手机号"];
    accountElement.keyboardType = UIKeyboardTypeNumberPad;
    [accountElement setKey:@"AccountElement"];
    accountElement.delegate = self;
    [accountSection addElement:accountElement];
    
    QEntryElement *passwordElement = [[QEntryElement alloc]initWithTitle:@"" Value:@"" Placeholder:@"密  码"];
    [passwordElement setKey:@"PasswordElement"];
    passwordElement.delegate = self;
    [passwordElement setSecureTextEntry:YES];
    [accountSection addElement:passwordElement];
    
    //
    QSection *actionSection = [[QSection alloc]init];
    [self.root addSection:actionSection];
    
    ALoginActionButtonElement *nextButtonElement = [[ALoginActionButtonElement alloc]init];
    [nextButtonElement setKey:@"ALoginActionButtonElement"];
    [actionSection addElement:nextButtonElement];
}

- (void)doLoginAction {
    [self hiddenKeyBoard];
    QEntryElement *phoneEle = (QEntryElement*)[self.root elementWithKey:@"AccountElement"];
    
    QEntryElement *passwdEle = (QEntryElement*)[self.root elementWithKey:@"PasswordElement"];
    NSString *phoneNo = phoneEle.textValue;
    
    ALoginActionButtonElement *nextActionButtonElement = (ALoginActionButtonElement*)[self.root elementWithKey:@"ALoginActionButtonElement"];
    ALogintActionButtonElementView *nextActionButtonElementView =
    (ALogintActionButtonElementView*)[self.quickDialogTableView cellForElement:nextActionButtonElement];
    [nextActionButtonElementView setButtonState:WorkState];
    
    
    [[AServerFactory getServerInstance:@"ALoginServer"]doLoginByPhoneNo:phoneNo andPasswd:passwdEle.textValue callback:^(BOOL opBool) {
        [nextActionButtonElementView setButtonState:EnableState];
        
        [self dismissViewControllerAnimated:YES completion:^{
            [[AStarViewController sharedInstance]switchBusiness];
        }];
        
    } failureCallback:^(NSString *resp) {
        [nextActionButtonElementView setButtonState:EnableState];
        [self verifyLoginAction:resp andSection:@"AccountSection"];
    }];
}

- (void)QEntryEditingChangedForElement:(QEntryElement *)element  andCell:(QEntryTableViewCell *)cell {
    BOOL isInput = [self isFinishInput];
    
    ALoginActionButtonElement *actionButtionElement = (ALoginActionButtonElement*)[self.root elementWithKey:@"ALoginActionButtonElement"];
    ALogintActionButtonElementView *accountButtonViewCell = (ALogintActionButtonElementView*)[self.quickDialogTableView cellForElement:actionButtionElement];
    
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

- (void)leftButtonAction {
    [self hiddenKeyBoard];
    [super leftButtonAction];
    [[AStarViewController sharedInstance]updateStatuBarColorByStyle:UIStatusBarStyleDefault];
}

@end
