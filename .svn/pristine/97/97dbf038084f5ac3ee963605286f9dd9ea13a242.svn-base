//
//  AAauthCodeElementView.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-30.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AAauthCodeElementView.h"

@implementation AAauthCodeElementView

- (id) init {
    self = [super init];
    float H = [AAauthCodeElementView heightForCell];
    
    CGRect rect = CGRectMake(170, 5, [UIScreen mainScreen].bounds.size.width-10-170, H-10);
    UIButton *validateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    validateButton.tag = 1000;
    [validateButton setFrame:rect];
    validateButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [validateButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [validateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [validateButton setBackgroundImage:[UIImage imageNamed:@"Register_Identity_SendCode.png"] forState:UIControlStateNormal];
    [validateButton setBackgroundImage:[UIImage imageNamed:@"Register_Identity_SendCode_Sel.png"] forState:UIControlStateHighlighted];
    [validateButton addTarget:self.qControllerDelegate action:@selector(doSendValidateAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:validateButton];
    
    return self;
}

- (void)doSendValidateAction {}

- (CGRect)calculateFrameForEntryElement {
    _entryElement.parentSection.entryPosition = CGRectMake(20,10,150, self.frame.size.height-20);
    return _entryElement.parentSection.entryPosition;
}

+ (float)heightForCell {
    return 50;
}

@end
