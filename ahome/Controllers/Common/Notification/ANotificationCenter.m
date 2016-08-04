//
//  ANotificationCenter.m
//  demoe
//
//  Created by andson-dile on 15/3/24.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "ANotificationCenter.h"
#import "ANewsNotifiView.h"
#import "AWarningNotifiView.h"
#import "ABulletinNotifiView.h"
#import "AAdvertNotifiView.h"
#import "ARequestNotifiView.h"

#define notifi_view_height  64

static ANotificationCenter *notifi;

@implementation ANotificationCenter

+ (instancetype)shareInstanceByNotifiType:(NotificationType)notifiType info:(NSString *)info {
    if (notifi) {
        [ANotificationCenter destroyInstance];
    }
    
    if (notifi == nil) {
        notifi = [[ANotificationCenter alloc]initWithNotifiType:notifiType info:info];
    }
    
    return notifi;
}

+ (instancetype)shareInstanceByNotifiType:(NotificationType)notifiType info:(NSString *)info clicked:(void (^)(void))onClicked {
    if (notifi) {
        [ANotificationCenter destroyInstance];
    }
    
    if (notifi == nil) {
        notifi = [[ANotificationCenter alloc]initWithNotifiType:notifiType info:info Clicked:onClicked];
    }
    
    return notifi;
}


+ (instancetype)shareInstance {
    return notifi;
}

+ (void)destroyInstance {
    if (notifi) {
        [notifi hiddenNotifiView];
    }
    
    notifi = nil;
}

- (instancetype)initWithNotifiType:(NotificationType)notifiType info:(NSString*)info {
    self = [super init];
    _notifiType = notifiType;
    _info = info;
    
    return self;
}

- (instancetype)initWithNotifiType:(NotificationType)notifiType info:(NSString*)info Clicked:(void (^)(void))onClicked {
    self = [super init];
    _notifiType = notifiType;
    _info = info;
    self.onClicked = onClicked;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setFrame:CGRectMake(0, -64, self.view.frame.size.width, notifi_view_height)];
    
    _baseNotifiView = [self baseNotifiView];
    [_baseNotifiView setinfo:_info];
    
    [self.view addSubview:_baseNotifiView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self showNotifiView];
    
    if (!_notifiType == notifiRequest) {
        __weak ANotificationCenter *weakSelf = self;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [weakSelf hiddenNotifiView];
        });
    }
}

- (void)backCallByParam:(NSString*)resp {
    [_baseNotifiView updateInfo:resp];
    
    __weak ANotificationCenter *weakSelf = self;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [weakSelf hiddenNotifiView];
    });
}

- (void)hiddenNotifiView {
    [UIView animateWithDuration:.5 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = -64;
        self.view.frame = frame;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [_baseNotifiView hiddenOffset];
    }];
}

- (void)showNotifiView {
    [UIView animateWithDuration:.5 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = 0;
        self.view.frame = frame;
    } completion:^(BOOL finished) {
        
    }];
}


- (ABaseNotifiView*)baseNotifiView {
    ABaseNotifiView *baseNotifiView;
    
    switch (_notifiType) {
        case notifiBulletin: // 公告
            baseNotifiView = [[ABulletinNotifiView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            break;
        
        case notifiAdvert: // 广告
            baseNotifiView = [[AAdvertNotifiView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            break;
            
        case notifiRequest: // 请求响应模式
            baseNotifiView = [[ARequestNotifiView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            break;
            
        default: // 通知用户消息
            baseNotifiView = [[ANewsNotifiView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            break;
    }
    
    return baseNotifiView;
}

@end
