//
//  AHomeHeader.m
//  ahome
//
//  Created by andson-dile on 15/6/19.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHomeHeader.h"

@implementation AHomeHeader

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName andSelect:(void (^)(void))onSelected {
    self = [super init];
    self.title = title;
    self.imageName = imageName;
    self.onSelected = onSelected;
    
    return self;
}

@end
