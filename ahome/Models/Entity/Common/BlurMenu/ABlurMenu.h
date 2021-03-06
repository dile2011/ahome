//
//  ABlurMenu.h
//  demoe
//
//  Created by andson-dile on 15/3/6.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABlurMenu : NSObject

@property (nonatomic,retain)NSString *title;
@property (nonatomic,retain)NSString *menuImage;
@property (nonatomic,retain)UIColor *color;

@property(nonatomic, copy) void (^onSelected)(void);

- (instancetype)initWithTitle:(NSString*)title menuImage:(NSString*)menuImage;
- (instancetype)initWithTitle:(NSString*)title menuImage:(NSString*)menuImage andSelect:(void (^)(void))onSelected;

- (instancetype)initWithTitle:(NSString*)title menuImage:(NSString*)menuImage andColor:(UIColor*)clr andSelect:(void (^)(void))onSelected;

@end
