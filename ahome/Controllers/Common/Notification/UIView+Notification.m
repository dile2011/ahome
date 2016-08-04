//
//  UIView+Notification.m
//  demoe
//
//  Created by andson-dile on 15/4/2.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "UIView+Notification.h"

@implementation UIView (Notification)

- (void)showNotificationByType:(NotificationType)ntype showString:(NSString*)string {
    ANotificationCenter *notifi = [ANotificationCenter shareInstanceByNotifiType:ntype info:string];
    [self.window addSubview:notifi.view];
}

- (void)responNotification:(NSString*)responString {
    ANotificationCenter *notifi = [ANotificationCenter shareInstance];
    [notifi backCallByParam:@"请求成功"];
}

@end
