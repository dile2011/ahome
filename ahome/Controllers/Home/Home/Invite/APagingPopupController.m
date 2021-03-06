//
//  APagingPopupController.m
//  ahome
//
//  Created by andson-dile on 15/6/5.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "APagingPopupController.h"
#import "AHomePaging.h"
#import "AHomeLevelController.h"
#import "UIImageView+WebCache.h"
#import "AHomeServer.h"

#define panel_height    50

@implementation APagingPopupController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"寻 呼";
    _datas = [NSMutableArray array];
    
    //
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"home_paging_action.png"] style:UIBarButtonItemStylePlain target:self action:@selector(sendAddress)];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                   target:nil action:nil];
    negativeSpacer.width = -10;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer, rightButtonItem];

    _showPanel = [self blurView];
    [self.view addSubview:_showPanel];
    
    UITableView *panelTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, panel_height)];
    [panelTableView setBackgroundColor:[UIColor clearColor]];
    panelTableView.separatorStyle = NO;
    panelTableView.dataSource = self;
    panelTableView.delegate = self;
    [_showPanel addSubview:panelTableView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    _mapView.showsScale = NO;
    _mapView.delegate = self;
    
    [self.view addSubview:_mapView];
    [self.view insertSubview:_mapView atIndex:0];
    
    _geocoder=[[CLGeocoder alloc]init];
    _locationManager=[[CLLocationManager alloc]init];
    _locationManager.delegate=self;
    if (![CLLocationManager locationServicesEnabled] || [CLLocationManager authorizationStatus]==kCLAuthorizationStatusNotDetermined){
        [_locationManager requestWhenInUseAuthorization];
        
    }else if([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorizedWhenInUse){
        _locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        _locationManager.distanceFilter=50.0;
        [_locationManager startUpdatingLocation];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setBackgroundColor:[UIColor clearColor]];
        cell.textLabel.textColor =[UIColor whiteColor];
        [cell.textLabel setFont:[UIFont systemFontOfSize:14]];
        cell.detailTextLabel.textColor = [UIColor whiteColor];
    }
    
    AHomePaging *paging = [_datas objectAtIndex:indexPath.row];
    cell.textLabel.text = paging.title;
    cell.detailTextLabel.text = paging.subTitle;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 35;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 15)];
    [headerView setBackgroundColor:[UIColor clearColor]];
    
    UILabel *textLable = [[UILabel alloc]init];
    [headerView addSubview:textLable];
    [textLable setText:@"【寻呼】分享您所在的位置给家人"];
    [textLable setFont:[UIFont fontWithName:@"Heiti SC" size:12]];
    textLable.textAlignment = NSTextAlignmentCenter;
    [textLable setTextColor:[UIColor colorWithRed:255./255.0 green:99.0/255 blue:.0/255. alpha:1.]];
    textLable.lineBreakMode = NSLineBreakByWordWrapping;
    textLable.numberOfLines = 1;
    [textLable setBackgroundColor:[UIColor clearColor]];
    CGSize titleSize = CGSizeMake(headerView.frame.size.width, headerView.frame.size.height);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:textLable.font, NSFontAttributeName,nil];
    titleSize =[textLable.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [textLable setFrame:CGRectMake(20, (headerView.frame.size.height-titleSize.height)/2., titleSize.width, titleSize.height)];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    _location=[locations lastObject];
    CLLocationCoordinate2D coordinate=_location.coordinate;
    _mapView.centerCoordinate = coordinate;
    
    CLLocation *location=[[CLLocation alloc]initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    [_geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark=[placemarks lastObject];
        [self performSelectorOnMainThread:@selector(showAddress:) withObject:placemark waitUntilDone:YES];
    }];
    
    [_locationManager stopUpdatingLocation];
}

- (void)showAddress:(CLPlacemark*)mark {
    NSDictionary *markDic = mark.addressDictionary;
    NSString *city = [markDic objectForKey:@"City"];
    NSString *sublocality = [markDic objectForKey:@"SubLocality"];
    NSString *title = [NSString stringWithFormat:@"%@%@",city,sublocality];
    
    NSString *Street = [markDic objectForKey:@"Street"];
    NSString *subTitle = [NSString stringWithFormat:@"%@",Street];
    
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(_location.coordinate.latitude, _location.coordinate.longitude);
    pointAnnotation.title = title;
    pointAnnotation.subtitle = subTitle;
    [_mapView addAnnotation:pointAnnotation];
    
    AHomePaging *paging = [[AHomePaging alloc]initWithTitle:title subTitle:subTitle cpoint:_location.coordinate];
    [_datas addObject:paging];
    UITableView *panelTableView = [_showPanel.subviews lastObject];
    [panelTableView reloadData];
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation {
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        static NSString *pointReuseIndetifier = @"pointReuseIndetifier";
        MAPinAnnotationView *annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
        
        if (annotationView == nil) {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndetifier];
        }
        
        UIImageView *imageview = [[UIImageView alloc]init];
        AUser *user = [AUser sharedInstance];
        [imageview setImageWithURL:[NSURL URLWithString:user.avatar]];
        annotationView.image = imageview.image;
        return annotationView;
    }
    
    return nil;
}

- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views {
    [UIView animateWithDuration:.8 animations:^{
        CGRect frame = _showPanel.frame;
        frame.origin.y -= panel_height;
        
        _showPanel.frame = frame;
    } completion:^(BOOL finished) {
        
    }];
}

- (UIView*)blurView {
    UIVisualEffectView *visualEffectView = nil;
    CGRect blurBounds = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, panel_height);
    
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.frame = blurBounds;
    
    return visualEffectView;
}

- (void)sendAddress {
    [self.view.window addSubview:[ANotificationCenter shareInstanceByNotifiType:notifiRequest info:@"正在寻呼..."].view];
    self.navigationItem.rightBarButtonItem.enabled = NO;

    [[AServerFactory getServerInstance:@"AHomeServer"]doPagingHomeMemberBylatitude:[NSString stringWithFormat:@"%f",_location.coordinate.latitude] longitude:[NSString stringWithFormat:@"%f",_location.coordinate.longitude] callback:^(BOOL status) {
        
        [[ANotificationCenter shareInstance]backCallByParam:@"寻呼成功!"];
        [[AHomeLevelController sharedInstance]afterMemberOpration];
        self.navigationItem.rightBarButtonItem.enabled = YES;
        
    } failureCallback:^(NSString *resp) {
        [[ANotificationCenter shareInstance]backCallByParam:@"寻呼失败"];
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }];
}


@end
