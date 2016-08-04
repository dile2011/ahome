//
//  AHomeTitle.m
//  ahome
//
//  Created by andson-dile on 15/6/16.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHomeTitle.h"

@implementation AHomeTitle

- (instancetype)initWithTitle:(NSString*)title image:(NSString*)titleImage cellimage:(NSString*)cellimage {
    self = [super init];
    _isPullMenu = NO;
    
    _title = title;
    _titleimage = titleImage;
    _cellimage = cellimage;
    
    return self;
}

- (instancetype)initWithTitle:(NSString*)title image:(NSString*)titleImage cellimage:(NSString*)cellimage isPull:(BOOL)isPullMenu andSelect:(void (^)(void))onSelected {
    self = [super init];
    _isPullMenu = isPullMenu;
    self.onSelected = onSelected;
    
    _title = title;
    _titleimage = titleImage;
    _cellimage = cellimage;
    
    return self;
}

@end
