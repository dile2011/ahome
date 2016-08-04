//
//  AHomePaging.h
//  ahome
//
//  Created by andson-dile on 15/6/10.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ARecord.h"

@interface AHomePaging : ARecord

@property (nonatomic,assign)CLLocationCoordinate2D cpoint;
@property (nonatomic,retain)NSString *title;
@property (nonatomic,retain)NSString *subTitle;

- (instancetype)initWithTitle:(NSString*)title subTitle:(NSString*)subtitle cpoint:(CLLocationCoordinate2D)point;

@end
