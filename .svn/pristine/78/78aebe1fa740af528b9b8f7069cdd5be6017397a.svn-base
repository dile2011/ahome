//
//  APagingPopupController.h
//  ahome
//
//  Created by andson-dile on 15/6/5.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AViewPopupController.h"

@interface APagingPopupController : AViewPopupController<MAMapViewDelegate,CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate> {
    
    MAMapView *_mapView;
    CLLocationManager *_locationManager;
    
    UIView *_showPanel;
    NSMutableArray *_datas;
    
    CLLocation *_location;
    CLGeocoder *_geocoder;
}

@property (nonatomic,assign)float width;
@property (nonatomic,assign)int familyId;

@end
