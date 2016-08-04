//
//  UIView+Notification.h
//  demoe
//
//  Created by andson-dile on 15/4/2.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ANotificationCenter.h"


@interface UIView (Notification)

- (void)showNotificationByType:(NotificationType)ntype showString:(NSString*)string;
- (void)responNotification:(NSString*)responString;

@end
