//
//  ANotificationCenter.h
//  demoe
//
//  Created by andson-dile on 15/3/24.
//  Copyright (c) 2015年 andson. All rights reserved.
//


typedef enum {
    notifiDefault,  // 通知消息模式
    notifiRequest,  // 请求提醒模式
    notifiBulletin, // 系统公告模式
    notifiAdvert,   // 广告展现模式
} NotificationType;

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ABaseNotifiView.h"

@interface ANotificationCenter : UIViewController {
    NotificationType _notifiType;
    NSString *_info;
    
    ABaseNotifiView *_baseNotifiView;
}

+ (instancetype)shareInstanceByNotifiType:(NotificationType)notifiType info:(NSString*)info clicked:(void (^)(void))onClicked;
+ (instancetype)shareInstanceByNotifiType:(NotificationType)notifiType info:(NSString*)info;

+ (instancetype)shareInstance;
+ (void)destroyInstance;

- (void)backCallByParam:(NSString*)resp;

@property(nonatomic, copy) void (^onClicked)(void);

@end
