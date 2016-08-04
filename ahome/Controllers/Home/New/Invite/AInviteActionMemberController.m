//
//  AInviteActionMemberController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-2.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AInviteActionMemberController.h"
#import "ANewHomeInviteRoleElement.h"
#import "ANewHomeInviteRoleElementView.h"
#import "AMainRootController.h"
#import "ANextActionButtonElement.h"
#import "ANextActionButtonElementView.h"
#import "FRDLivelyButton.h"

@implementation AInviteActionMemberController

- (instancetype)initWithRoleName:(NSString*)roleName andSelRoles:(NSArray*)selRoles {
    self = [super init];
    _role = roleName;
    _selRoles = selRoles;
    self.isPush = NO;
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    self.root = root;
    self.root.title = @"添加成员";
    self.resizeWhenKeyboardPresented =YES;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    QSection *memberRoleSection = [[QSection alloc]initWithTitle:@"选择添加的成员角色"];
    [self.root addSection:memberRoleSection];
    ANewHomeInviteRoleElement *homeRoleElement = [[ANewHomeInviteRoleElement alloc]initWithRole:_role andSelRoles:_selRoles];
    [homeRoleElement setKey:@"ANewAtHomeInviteRoleElement"];
    [memberRoleSection addElement:homeRoleElement];
    
    //
    QSection *phoneSection = [[QSection alloc]init];
    [self.root addSection:phoneSection];
    QBadgeElement *phoneElement = [[QBadgeElement alloc]initWithTitle:@"对方手机号" Value:nil];
    [phoneElement setKey:@"RolePhoneNoElement"];
    [phoneElement setControllerAction:@"doSelMemberPhone"];
    [phoneSection addElement:phoneElement];
    
    //
    QSection *actionSection = [[QSection alloc]init];
    [self.root addSection:actionSection];
    ANextActionButtonElement *nextButtonElement = [[ANextActionButtonElement alloc]init];
    nextButtonElement.buttonTitle = @"添加成员";
    [nextButtonElement setKey:@"ANextActionButtonElement"];
    [actionSection addElement:nextButtonElement];
}

/**
 * 选择手机号入口
 */
- (void)doSelMemberPhone {
    ABPeoplePickerNavigationController *peoplePicker = [[ABPeoplePickerNavigationController alloc] init];
    peoplePicker.peoplePickerDelegate = self;
    [self.navigationController presentViewController:peoplePicker animated:YES completion:^{
        
    }];
}

-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person {
    ABMultiValueRef phonesRef = ABRecordCopyValue(person, kABPersonPhoneProperty);
    NSString *phone = [self getMobilePhoneProperty:phonesRef];
    if(phonesRef) {
        CFRelease(phonesRef);
    }
    
    QBadgeElement *phoneEle = (QBadgeElement*)[self.root elementWithKey:@"RolePhoneNoElement"];
    phoneEle.badge = phone;
    [self.quickDialogTableView reloadCellForElements:phoneEle, nil];
    
    [self checkInviteInfo];
}

- (NSString *)getMobilePhoneProperty:(ABMultiValueRef)phonesRef {
    for (int i=0; i < ABMultiValueGetCount(phonesRef); i++) {
        CFStringRef currentPhoneLabel = ABMultiValueCopyLabelAtIndex(phonesRef, i);
        CFStringRef currentPhoneValue = ABMultiValueCopyValueAtIndex(phonesRef, i);
        
        if(currentPhoneLabel) {
            if (CFStringCompare(currentPhoneLabel, kABPersonPhoneMobileLabel, 0) == kCFCompareEqualTo) {
                return (__bridge NSString *)currentPhoneValue;
            }
            
            if (CFStringCompare(currentPhoneLabel, kABHomeLabel, 0) == kCFCompareEqualTo) {
                return (__bridge NSString *)currentPhoneValue;
            }
        }
        if(currentPhoneLabel) {
            CFRelease(currentPhoneLabel);
        }
        if(currentPhoneValue) {
            CFRelease(currentPhoneValue);
        }
    }
    
    return nil;
}

/**
 * 发出邀请
 */
- (void)doNextAction {
    [[AStarViewController sharedInstance]updateStatuBarColorByStyle:UIStatusBarStyleLightContent];
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
        ANewHomeInviteRoleElement *inviteEle =  (ANewHomeInviteRoleElement*)[self.root elementWithKey:@"ANewAtHomeInviteRoleElement"];
        ANewHomeInviteRoleElementView *eleView = (ANewHomeInviteRoleElementView*)[self.quickDialogTableView cellForElement:inviteEle];
        QBadgeElement *phoneEle = (QBadgeElement*)[self.root elementWithKey:@"RolePhoneNoElement"];
        
        NSDictionary *info = @{@"rolename":eleView.roleName,@"phone":phoneEle.badge};
        
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"InviteNotification" object:nil userInfo:info];
    }];
}

- (void)checkInviteInfo {
    ANewHomeInviteRoleElement *inviteEle =  (ANewHomeInviteRoleElement*)[self.root elementWithKey:@"ANewAtHomeInviteRoleElement"];
    ANewHomeInviteRoleElementView *eleView = (ANewHomeInviteRoleElementView*)[self.quickDialogTableView cellForElement:inviteEle];
    QBadgeElement *phoneEle = (QBadgeElement*)[self.root elementWithKey:@"RolePhoneNoElement"];
    
    ANextActionButtonElement *actionButtionElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
    ANextActionButtonElementView *accountButtonViewCell = (ANextActionButtonElementView*)[self.quickDialogTableView cellForElement:actionButtionElement];
    if (eleView.roleName.length > 0 && phoneEle.badge.length > 0) {
        [accountButtonViewCell setButtonState:EnableState];
    }
}


- (void)leftButtonAction {
    [super leftButtonAction];
    [[AStarViewController sharedInstance]updateStatuBarColorByStyle:UIStatusBarStyleLightContent];
}

- (void)addLeftButtonItem {
    FRDLivelyButton *leftButton = [[FRDLivelyButton alloc] initWithFrame:CGRectMake(0,0,28,28) andButtonColor:[UIColor blackColor]];;
    if (self.isPush) [leftButton setStyle:kFRDLivelyButtonStyleArrowLeft animated:NO];
    else [leftButton setStyle:kFRDLivelyButtonStyleClose animated:NO];
    
    [leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                   target:nil action:nil];
    negativeSpacer.width = -10;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer, buttonItem];
}


- (void)setDefaultNavigationStyle {
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor blackColor], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:19.0], NSFontAttributeName, nil]];
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    UIColor *navBgColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    [self.navigationController.navigationBar setBarTintColor:navBgColor];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[AStarViewController sharedInstance]updateStatuBarColorByStyle:UIStatusBarStyleDefault];
}

@end
