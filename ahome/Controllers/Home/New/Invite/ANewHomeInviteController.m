//
//  ANewHomeInviteController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-31.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANewHomeInviteController.h"
#import "ANewHomeController.h"
#import "AInviteButtonMemberElement.h"
#import "AInviteActionMemberController.h"
#import "ANextActionButtonElement.h"
#import "AInviteMemberInfoElement.h"
#import "ANextActionButtonElementView.h"
#import "AInviteMember.h"
#import "AHomeServer.h"

@implementation ANewHomeInviteController

- (id)init {
    self = [super init];
    self.inviteMembers = [NSMutableArray array];
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    self.root = root;
    self.resizeWhenKeyboardPresented =YES;
    
    return self;
}

- (void)doClickBackAction {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QSection *inviteMemberInfoSection = [[QSection alloc]init];
    [self.root addSection:inviteMemberInfoSection];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"InviteNotification" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * __unused notification) {
        NSDictionary *info = [notification userInfo];
        NSString *roleName = [info objectForKey:@"rolename"];
        NSString *phone = [info objectForKey:@"phone"];
        AInviteMember *inviteMember = [[AInviteMember alloc]initWithRolename:roleName andPhone:phone];
        [self.inviteMembers addObject:inviteMember];
        
        AInviteMemberInfoElement *memberInfoEle = [[AInviteMemberInfoElement alloc]initWithInviteMemberInfo:inviteMember];
        [memberInfoEle setKey:@"AInviteMemberInfoElement"];
        [inviteMemberInfoSection addElement:memberInfoEle];
        
        ANextActionButtonElement *actionButtionElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
        ANextActionButtonElementView *accountButtonViewCell = (ANextActionButtonElementView*)[self.quickDialogTableView cellForElement:actionButtionElement];
        [accountButtonViewCell setButtonState:EnableState];
        UIButton *btn = [[accountButtonViewCell.contentView subviews]firstObject];
        [btn setTitle:@"下一步" forState:UIControlStateNormal];
        
        [self.quickDialogTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    }];
    
    QSection *inviteActionSection = [[QSection alloc]init];
    [self.root addSection:inviteActionSection];
    AInviteButtonMemberElement *inviteActionElement = [[AInviteButtonMemberElement alloc]init];
    [inviteActionElement setKey:@"ANewAtHomeInviteMemberElement"];
    [inviteActionSection addElement:inviteActionElement];
    
    
    QSection *actionSection = [[QSection alloc]init];
    actionSection.key = @"NewHomeAction";
    [self.root addSection:actionSection];
    ANextActionButtonElement *nextButtonElement = [[ANextActionButtonElement alloc]init];
    nextButtonElement.buttonTitle = @"下一步";
    [nextButtonElement setKey:@"ANextActionButtonElement"];
    [actionSection addElement:nextButtonElement];
}

- (void)doNextAction {
    ANextActionButtonElement *nextActionButtonElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
    ANextActionButtonElementView *nextActionButtonElementView = (ANextActionButtonElementView*)[self.quickDialogTableView cellForElement:nextActionButtonElement];
    [nextActionButtonElementView setButtonState:WorkState];
    
    ANewHomeController *newHomeCon = (ANewHomeController*)self.delegate;
    ANewHomeForm *newHomeForm = newHomeCon.createHomeForm;
    newHomeForm.members = self.inviteMembers;
    
    [[AServerFactory getServerInstance:@"AHomeServer"]newAhomeByNewHomeForm:newHomeForm callback:^(BOOL status) {
        [self.delegate doNextAction:NewAtHomeFinishForm];
        [nextActionButtonElementView setButtonState:EnableState];
        
    } failureCallback:^(NSString *resp) {
        [nextActionButtonElementView setButtonState:EnableState];
        [self verifyLoginAction:resp andSection:@"NewHomeAction"];
        
    }];
}

/**
 * 添加成员触发方法
 */
- (void)doInviteAction {
    [self.delegate doInviteAction];
}


/**
 * swip
 */
- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell {
    return YES;
}

- (BOOL)swipeableTableViewCell:(SWTableViewCell *)cell canSwipeToState:(SWCellState)state {
    switch (state) {
        case 1:
            return YES;
            break;
        case 2:
            return YES;
            break;
        default:
            break;
    }
    
    return YES;
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    NSIndexPath *indexPath = [self.quickDialogTableView indexPathForCell:cell];
    
    switch (index) {
        case 0: {
            [cell hideUtilityButtonsAnimated:YES];
            QSection *section = [self.root.sections objectAtIndex:0];
            [section.elements removeObjectAtIndex:indexPath.row];
            [self.quickDialogTableView reloadData];
            [self.inviteMembers removeObjectAtIndex:indexPath.row];
            
            if (section.elements.count == 0) {
                ANextActionButtonElement *actionButtionElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
                ANextActionButtonElementView *accountButtonViewCell = (ANextActionButtonElementView*)[self.quickDialogTableView cellForElement:actionButtionElement];
                [accountButtonViewCell setButtonState:DisableState];
            }
            
            break;
        }
            
        default:
            break;
    }
}



- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"InviteNotification" object:nil];
}


@end
