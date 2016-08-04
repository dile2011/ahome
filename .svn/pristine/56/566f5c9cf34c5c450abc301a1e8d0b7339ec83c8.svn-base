//
// ANewHomeAreaController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-31.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANewHomeAreaController.h"
#import "ANewHomeController.h"
#import "AAreaPickViewElement.h"
#import "AAreaPickViewElementView.h"
#import "ANextActionButtonElement.h"
#import "ANextActionButtonElementView.h"

@implementation ANewHomeAreaController

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
    
    QSection *areaSection = [[QSection alloc]init];
    [areaSection setKey:@"AreaSection"];
    [self.root addSection:areaSection];
    
    AAreaPickViewElement *areaPickElement = [[AAreaPickViewElement alloc]initWithTitle:@"地区" Value:nil];
    [areaPickElement setKey:@"AAreaPickViewElement"];
    [areaSection addElement:areaPickElement];
    
    QBadgeElement *communityElement = [[QBadgeElement alloc]initWithTitle:@"社区" Value:@""];
    [communityElement setKey:@"CommunityElement"];
    [communityElement setControllerAction:@"doSelCommunity"];
    [areaSection addElement:communityElement];
    
    QSection *actionSection = [[QSection alloc]init];
    [self.root addSection:actionSection];
    ANextActionButtonElement *nextButtonElement = [[ANextActionButtonElement alloc]init];
    [nextButtonElement setKey:@"ANextActionButtonElement"];
    [actionSection addElement:nextButtonElement];
}

- (void)doSelCommunity {
    AAreaPickViewElement *apele = (AAreaPickViewElement*)[self.root elementWithKey:@"AAreaPickViewElement"];
    AAreaPickViewElementView *apelev = (AAreaPickViewElementView*)[self.quickDialogTableView cellForElement:apele];
    
    NSString *cityCode = apelev.cityCode;
    NSString *districtCode = apelev.districtCode;
    NSString *region = apelev.centeredLabel.text;
    
    if (cityCode.length == 0 && districtCode.length == 0) {
        [self verifyLoginAction:@"请先选择所在地区" andSection:@"AreaSection"];
        return;
    }
    
    [self.delegate doSelCommunity:cityCode districtCode:districtCode andRegion:region];
}

- (void)doNextAction {
    [self.delegate doNextAction:NewAtHomeInviteForm];
}


- (void)setRegionValue:(NSString*)regionName {
    QBadgeElement *communityEle = (QBadgeElement*)[self.root elementWithKey:@"CommunityElement"];
    [communityEle setBadge:regionName];
    
    ANextActionButtonElement *actionButtionElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
    ANextActionButtonElementView *accountButtonViewCell = (ANextActionButtonElementView*)[self.quickDialogTableView cellForElement:actionButtionElement];
    [accountButtonViewCell setButtonState:EnableState];
    
    [self.quickDialogTableView reloadCellForElements:communityEle, nil];
}

@end
