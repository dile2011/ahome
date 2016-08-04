//
//  AOperate.h
//  demoe
//
//  Created by andson-dile on 15/3/19.
//  Copyright (c) 2015年 andson. All rights reserved.
//


typedef enum {
    DefaultOperate,
    AuthOperate,
    InviteOperate,
    DeleteOperate
    
}OperateType;

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AOperate : NSObject

@property (nonatomic,retain)NSString *title;
@property (nonatomic,retain)NSString *imageName;
@property (nonatomic, strong)UIColor *circlebgColor;
@property (nonatomic,assign)OperateType optype;

- (instancetype)initWithTitle:(NSString*)title imageName:(NSString*)imageName circlebgColor:(UIColor*)color optype:(OperateType)optype;

@end
