//
//  AProgressView.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-25.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASProgressPopUpView.h"

@interface AProgressView : UIView {
    ASProgressPopUpView *_progressView;
}

/**
 * 下一步进度设置函数
 */
- (void)nextStepByIndex:(int)progress;

@end
