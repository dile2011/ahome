//
//  ANewCommunityController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-10-6.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANewCommunityController.h"
#import "ANextActionButtonElement.h"
#import "ANextActionButtonElementView.h"
#import "ARegionServer.h"

@implementation ANewCommunityController

- (instancetype)initWithRgionCode:(NSString*)regionCode andCityCode:(NSString*)cityCode andRegion:(NSString*)region andDelegate:(id)obj {
    self = [super init];
    _communitVC = obj;
    self.isPush = NO;
    
    _regionCode = regionCode;
    _region = region;
    _cityCode = cityCode;
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    self.root = root;
    self.resizeWhenKeyboardPresented =YES;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.root.title = @"新建社区";
    
    NSArray *regions = [_region componentsSeparatedByString:@" "];
    NSString *city = [regions firstObject];
    NSString *community = [regions lastObject];

    QSection *areaSection = [[QSection alloc]init];
    [self.root addSection:areaSection];
    QLabelElement *cityElement = [[QLabelElement alloc]initWithTitle:@"城市" Value:city];
    [cityElement setKey:@"CityElement"];
    [areaSection addElement:cityElement];
    
    QLabelElement *areaElement = [[QLabelElement alloc]initWithTitle:@"区县" Value:community];
    [areaElement setKey:@"AreaElement"];
    [areaSection addElement:areaElement];
    
    QSection *communitySection = [[QSection alloc]init];
    [self.root addSection:communitySection];
    QEntryElement *communityElement = [[QEntryElement alloc]initWithTitle:@"社区" Value:@"" Placeholder:@"输入社区完整名称"];
    communityElement.delegate = self;
    [communityElement setKey:@"CommunityElement"];
    [communitySection addElement:communityElement];
    
    QSection *actionSection = [[QSection alloc]init];
    [self.root addSection:actionSection];
    ANextActionButtonElement *nextButtonElement = [[ANextActionButtonElement alloc]init];
    nextButtonElement.buttonTitle = @"确定";
    [nextButtonElement setKey:@"ANextActionButtonElement"];
    [actionSection addElement:nextButtonElement];
}

- (void)QEntryEditingChangedForElement:(QEntryElement *)element  andCell:(QEntryTableViewCell *)cell {
    ANextActionButtonElement *actionButtionElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
    ANextActionButtonElementView *accountButtonViewCell = (ANextActionButtonElementView*)[self.quickDialogTableView cellForElement:actionButtionElement];
    
    QEntryElement *community = (QEntryElement*)[self.root elementWithKey:@"CommunityElement"];
    if (community.textValue.length > 0) {
        [accountButtonViewCell setButtonState:EnableState];
    } else {
        [accountButtonViewCell setButtonEnable:DisableState];
    }
}

/**
 * 新建社区
 */
- (void)doNextAction {
    QEntryElement *community = (QEntryElement*)[self.root elementWithKey:@"CommunityElement"];
    [[AServerFactory getServerInstance:@"ARegionServer"]newRegionByCityCode:_cityCode andRegionName:community.textValue andRegionCode:_regionCode
                                                                   callback:^(NSString *region) {
                                                                       [self.navigationController dismissViewControllerAnimated:YES completion:^{
                                                                           NSString *region_name = community.textValue;
                                                                           NSDictionary *regionInfo = @{@"region":_region,@"region_name":region_name,@"cityCode":_cityCode,@"regionCode":_regionCode,@"flag":@"1"};
                                                                           _communitVC.onSelected(regionInfo);
                                                                           
                                                                       }];
                                                                       
                                                                    } failureCallback:^(NSString *resp) {
                                                                        
                                                                        
                                                                    }];
}

@end
