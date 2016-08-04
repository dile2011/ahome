//
//  ARegisterAreaController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-25.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ARegisterAreaController.h"
#import "ARegisterViewController.h"
#import "AAreaPickViewElement.h"
#import "AAreaPickViewElementView.h"
#import "ANextActionButtonElement.h"
#import "ANextActionButtonElementView.h"
#import "ARegisterServer.h"

@implementation ARegisterAreaController

- (id)init {
    self = [super init];
    self.registerAreaForm = [[ARegisterAreaForm alloc]init];
    
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
    
    
    //
    QSection *actionSection = [[QSection alloc]init];
    [actionSection setKey:@"actionSection"];
    [self.root addSection:actionSection];
    
    ANextActionButtonElement *nextButtonElement = [[ANextActionButtonElement alloc]init];
    [nextButtonElement setKey:@"ANextActionButtonElement"];
    [actionSection addElement:nextButtonElement];
}

- (void)doNextAction {
    if (_regionInfo == nil) return;
    
    NSString *region = [_regionInfo objectForKey:@"region"];
    NSString *region_name = [_regionInfo objectForKey:@"region_name"];
    NSString *cityCode = [_regionInfo objectForKey:@"cityCode"];
    NSString *regionCode = [_regionInfo objectForKey:@"regionCode"];
    
    ANextActionButtonElement *nextActionButtonElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
    ANextActionButtonElementView *nextActionButtonElementView = (ANextActionButtonElementView*)[self.quickDialogTableView cellForElement:nextActionButtonElement];
    [nextActionButtonElementView setButtonState:WorkState];
    
    [[AServerFactory getServerInstance:@"ARegisterServer"]doSetRegionForRegister:region
                                                                      regionName:region_name
                                                                        cityCode:cityCode
                                                                      regionCode:regionCode
                                                                        callback:^(NSString *state) {
                                                                            [nextActionButtonElementView setButtonState:EnableState];
                                                                            
                                                                            [_registerAreaForm setRegion:region];
                                                                            [_registerAreaForm setCommunity:region_name];
                                                                            [self.delegate setRegisterData:_registerAreaForm];
                                                                            [self.delegate doNextAction:RegisterFinishForm];
                                                                            
                                                                        } failureCallback:^(NSString *resp) {
                                                                            [self verifyLoginAction:resp andSection:@"actionSection"];
                                                                            [self.delegate doNextAction:RegisterFinishForm];
                                                                        }];
    
    
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

- (void)setRegionValue:(NSString*)regionName {
    QBadgeElement *communityEle = (QBadgeElement*)[self.root elementWithKey:@"CommunityElement"];
    [communityEle setBadge:regionName];
    
    BOOL isInput = [self isFinishInput];
    ANextActionButtonElement *actionButtionElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
    ANextActionButtonElementView *accountButtonViewCell = (ANextActionButtonElementView*)[self.quickDialogTableView cellForElement:actionButtionElement];
    if (isInput)[accountButtonViewCell setButtonState:EnableState];
    else [accountButtonViewCell setButtonEnable:DisableState];
    
    [self.quickDialogTableView reloadCellForElements:communityEle, nil];
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
            if ([element isKindOfClass:[AAreaPickViewElement class]]) {
                AAreaPickViewElementView *apve = (AAreaPickViewElementView*)[self.quickDialogTableView cellForElement:element];
                if(apve.centeredLabel.text.length == 0) {
                    isInput = NO;
                    break;
                }
            }
            
            if ([element isKindOfClass:[QBadgeElement class]]) {
                if(((QBadgeElement*)element).badge.length == 0) {
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
