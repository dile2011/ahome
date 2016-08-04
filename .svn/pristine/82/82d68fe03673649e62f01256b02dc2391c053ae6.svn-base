//
//  AQTableViewCellLine.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-28.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AQTableViewCellLine.h"

@implementation AQTableViewCellLine

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string {
    self = [super initWithReuseIdentifier:string];
    self.isShowSeparator = YES;
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!self.isShowSeparator) {
        UIColor *bcolor = [UIColor colorWithRed:249./255. green:249./255. blue:249./255. alpha:1.0];
        for (UIView *view in [self subviews]) {
            if ([view isKindOfClass:NSClassFromString(@"_UITableViewCellSeparatorView")])
                view.backgroundColor = bcolor;
        }
    }
}


@end
