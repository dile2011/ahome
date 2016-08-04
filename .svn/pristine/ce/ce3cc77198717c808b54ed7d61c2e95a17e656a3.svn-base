//
//  ARegisterFinishController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-25.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ARegisterFinishController.h"
#import "ARegisterViewController.h"
#import "ARegisterFinishShowElement.h"
#import "ARegisterFinishButtonElement.h"
#import "ARegisterViewController.h"

@implementation ARegisterFinishController

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
    
    QSection *finishShowSection = [[QSection alloc]init];
    [self.root addSection:finishShowSection];
    ARegisterFinishShowElement *registerFinishShowEle = [[ARegisterFinishShowElement alloc]init];
    [finishShowSection addElement:registerFinishShowEle];

    QSection *baseSection = [[QSection alloc]initWithTitle:@"基本信息"];
    [self.root addSection:baseSection];
    QLabelElement *accountElement = [[QLabelElement alloc]initWithTitle:@"账号" Value:nil];
    [accountElement setKey:@"AccountElement"];
    [baseSection addElement:accountElement];
    
    QLabelElement *unameElement = [[QLabelElement alloc]initWithTitle:@"姓名" Value:nil];
    [unameElement setKey:@"UnameElement"];
    [baseSection addElement:unameElement];
    
    QLabelElement *sexElement = [[QLabelElement alloc]initWithTitle:@"性别" Value:nil];
    [sexElement setKey:@"SexElement"];
    [baseSection addElement:sexElement];
    
    QLabelElement *brithElement = [[QLabelElement alloc]initWithTitle:@"生日" Value:nil];
    [brithElement setKey:@"BrithElement"];
    [baseSection addElement:brithElement];
    
    QSection *regionSection = [[QSection alloc]initWithTitle:@"地区"];
    [self.root addSection:regionSection];
    
    QLabelElement *regionElement = [[QLabelElement alloc]initWithTitle:@"地区" Value:nil];
    [regionElement setKey:@"RegionElement"];
    [regionSection addElement:regionElement];
    
    QLabelElement *communityElement = [[QLabelElement alloc]initWithTitle:@"社区" Value:nil];
    [communityElement setKey:@"CommunityElement"];
    [regionSection addElement:communityElement];
    
    QSection *actionSection = [[QSection alloc]init];
    [self.root addSection:actionSection];
    ARegisterFinishButtonElement *finishButtonElement = [[ARegisterFinishButtonElement alloc]init];
    [finishButtonElement setKey:@"finishButtonElement"];
    [actionSection addElement:finishButtonElement];
}

- (void)setDataForElement {
    ARegisterViewController *registerVC = (ARegisterViewController*)self.delegate;
    ARegisterForm *registerForm = registerVC.registerForm;
    
    QLabelElement *accountEle = (QLabelElement*)[self.root elementWithKey:@"AccountElement"];
    [accountEle setValue:registerForm.phone];
    
    QLabelElement *unameElement = (QLabelElement*)[self.root elementWithKey:@"UnameElement"];
    NSString *uname = [NSString stringWithFormat:@"%@%@",registerForm.lastName,registerForm.firstName];
    [unameElement setValue:uname];
    
    QLabelElement *sexElement = (QLabelElement*)[self.root elementWithKey:@"SexElement"];
    NSString *sex = @"男";
    if (registerForm.sex == 1) sex = @"女";
    [sexElement setValue:sex];
    
    QLabelElement *brithElement = (QLabelElement*)[self.root elementWithKey:@"BrithElement"];
    [brithElement setValue:registerForm.birth];
    
    QLabelElement *regionElement = (QLabelElement*)[self.root elementWithKey:@"RegionElement"];
    [regionElement setValue:registerForm.regionStr];
    
    QLabelElement *communityElement = (QLabelElement*)[self.root elementWithKey:@"CommunityElement"];
    [communityElement setValue:registerForm.communityStr];
    
    [self.quickDialogTableView reloadData];
}

- (void)doRegisterFinishAction {
    [self.delegate doNextAction:RegisterEnd];
}

@end
