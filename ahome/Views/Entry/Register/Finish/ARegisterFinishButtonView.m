//
//  ARegisterFinishButtonView.m
//  Ahome
//
//  Created by dilei liu on 14/11/28.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ARegisterFinishButtonView.h"

@implementation ARegisterFinishButtonView

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string {
    self = [super initWithReuseIdentifier:string];
    self.isShowSeparator = NO;
    float H = [ARegisterFinishButtonView heightForCell];
    
    CGRect rect = CGRectMake(10, 5, SCREEN_WIDTH-2*10, H-10);
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextButton setFrame:rect];
    nextButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [nextButton setTitle:@"完 成" forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageNamed:@"Button_Green_Def.png"] forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageNamed:@"Button_Green_Sel.png"] forState:UIControlStateHighlighted];
    [nextButton addTarget:self.qControllerDelegate action:@selector(doRegisterFinishAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:nextButton];
    
    
    CALayer *separator = [CALayer layer];
    UIColor *bcolor = [UIColor colorWithRed:249./255. green:249./255. blue:249./255. alpha:1.0];
    separator.backgroundColor = bcolor.CGColor;
    separator.frame = CGRectMake(0, H-1, self.frame.size.width, 1);
    [self.layer addSublayer:separator];
    
    separator = [CALayer layer];
    separator.backgroundColor = bcolor.CGColor;
    separator.frame = CGRectMake(0, 0, self.frame.size.width, 1);
    [self.layer addSublayer:separator];
    
    return self;
}

- (void)doRegisterFinishAction {}

+ (float)heightForCell {
    return 55;
}


@end
