//
//  AHomePaging.m
//  ahome
//
//  Created by andson-dile on 15/6/10.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHomePaging.h"

@implementation AHomePaging

- (instancetype)initWithTitle:(NSString*)title subTitle:(NSString*)subtitle cpoint:(CLLocationCoordinate2D)point {
    self = [super init];
    _cpoint = point;
    _title = title;
    _subTitle = subtitle;
    
    return self;
}
@end
