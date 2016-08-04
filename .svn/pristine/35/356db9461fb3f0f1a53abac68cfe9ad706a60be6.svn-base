//
//  ABlurMenu.m
//  ahome
//
//  Created by andson-dile on 15/3/6.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "ABlurMenu.h"

@implementation ABlurMenu

- (instancetype)initWithTitle:(NSString*)title menuImage:(NSString*)menuImage {
    self = [super init];
    _title = title;
    _menuImage = menuImage;
    _color = [UIColor clearColor];
    
    return self;
}

- (instancetype)initWithTitle:(NSString*)title menuImage:(NSString*)menuImage andColor:(UIColor*)clr andSelect:(void (^)(void))onSelected {
    self = [super init];
    _title = title;
    _menuImage = menuImage;
    _color = clr;
    self.onSelected = onSelected;
    
    return self;
}

- (instancetype)initWithTitle:(NSString*)title menuImage:(NSString*)menuImage andSelect:(void (^)(void))onSelected {
    self = [super init];
    _title = title;
    _menuImage = menuImage;
    _color = [UIColor clearColor];
    self.onSelected = onSelected;
    
    return self;
}

@end
