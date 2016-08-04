//
//  AMenuPanelAttriController.m
//  ahome
//
//  Created by andson-dile on 15/8/4.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHMAttributeViewController.h"
#import "AHomeLevelController.h"
#import "AHomeMergeCell.h"
#import "AAttriTableView.h"
#import "ABaseAtrriViewCell.h"
#import "AMemberInfoViewCell.h"
#import "ATodayDynamicViewCell.h"
#import "ACurrentLyActivityViewCell.h"
#import "AFamilyInfoViewCell.h"
#import "ASocialPhoneViewCell.h"

@implementation AHMAttributeViewController

- (instancetype)initWithMember:(id)member {
    self = [super init];
    _member = member;
    _sections = 0;
    
    return self;
}

- (void) loadView {
    AAttriTableView *tv = [[AAttriTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tv.dataSource = self;
    tv.delegate = self;
    self.view = tv;
    self.tableView = tv;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.tableView registerClass:NSClassFromString(@"AMemberInfoViewCell") forCellReuseIdentifier:@"Attribute_0"];
    [self.tableView registerClass:NSClassFromString(@"ACurrentLyActivityViewCell") forCellReuseIdentifier:@"Attribute_1"];
    [self.tableView registerClass:NSClassFromString(@"ATodayDynamicViewCell") forCellReuseIdentifier:@"Attribute_2"];
    [self.tableView registerClass:NSClassFromString(@"AFamilyInfoViewCell") forCellReuseIdentifier:@"Attribute_3"];
    [self.tableView registerClass:NSClassFromString(@"ASocialPhoneViewCell") forCellReuseIdentifier:@"Attribute_4"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    _sections = 5;
    [((AAttriTableView*)self.tableView) reloadData:YES];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 || section == 1 || section ==3) return 0.;
    return 40.;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0)return [AMemberInfoViewCell heightForCell];
    if (indexPath.section == 1)return [ACurrentLyActivityViewCell heightForCell];
    if (indexPath.section == 2)return [ATodayDynamicViewCell heightForCell];
    if (indexPath.section == 3)return [AFamilyInfoViewCell heightForCell];
    if (indexPath.section == 4)return [ASocialPhoneViewCell heightForCell];
    
    return 50.;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *headerTitle = @"今日动态";
    if (section == 4)headerTitle = @"社交照片";
    float height = 50.;

    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, height)];
    [headerView setBackgroundColor:[UIColor clearColor]];
    
    UILabel *headerTitleLabel = [[UILabel alloc]init];
    [headerTitleLabel setText:headerTitle];
    [headerTitleLabel setFont:[UIFont boldSystemFontOfSize:17]];
    [headerTitleLabel setTextColor:[UIColor whiteColor]];
    headerTitleLabel.textAlignment = NSTextAlignmentLeft;
    headerTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [headerView addSubview:headerTitleLabel];
    
    CGSize titleSize = CGSizeMake(200, 20000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:headerTitleLabel.font, NSFontAttributeName,nil];
    titleSize =[headerTitleLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [headerTitleLabel setFrame:CGRectMake(15, (height-titleSize.height)/2., titleSize.width, titleSize.height)];
    
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = [NSString stringWithFormat:@"Attribute_%ld",indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [((ABaseAtrriViewCell*)cell) setDataForCell:_member];
    ((ABaseAtrriViewCell*)cell).attributeDelegate = self;
    
    return cell;
}


- (void)lookDynamicAction:(id)sender {
    UIButton *dynamicBtn = (UIButton*)sender;
    NSUInteger dynamicType = dynamicBtn.tag;
    switch (dynamicType) {
        case 1:
            [self.view.window addSubview:[ANotificationCenter shareInstanceByNotifiType:notifiDefault info:@"您没有权限查看此条动态"].view];
            break;
            
        default:
            break;
    }
    
}

@end
