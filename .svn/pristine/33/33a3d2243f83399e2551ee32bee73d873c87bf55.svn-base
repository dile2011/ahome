//
//  AHumanLevelController.m
//  ahome
//
//  Created by andson-dile on 15/8/6.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHumanLevelController.h"

@implementation AHumanLevelController

static AHumanLevelController *sharedInstance = nil;
+ (id)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[AHumanLevelController alloc] initWithIsKenBlur:NO];
    }
    
    return sharedInstance;
}

+ (void)destroyDealloc {
    sharedInstance = nil;
}

- (ASideDrawer *)setSideDrawer {
    return [[ASideDrawer alloc]initWithTitle:@"人文化" menuImage:@"Bracket_Human.png"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
