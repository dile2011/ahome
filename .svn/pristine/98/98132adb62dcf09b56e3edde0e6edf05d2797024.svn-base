//
//  AAttriTableView.m
//  ahome
//
//  Created by andson-dile on 15/8/4.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AAttriTableView.h"

@implementation AAttriTableView

- (void)reloadData:(BOOL)animated {
    [super reloadData];
    
    if (animated) {
        CATransition *animation = [CATransition animation];
        [animation setType:kCATransitionPush];
        [animation setSubtype:kCATransitionFromLeft];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [animation setFillMode:kCAFillModeBoth];
        [animation setDuration:.2];
        [[self layer] addAnimation:animation forKey:@"UITableViewReloadDataAnimationKey"];   
    }
}


@end
