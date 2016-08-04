//
//  AMainBracketController.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-23.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AMainBracketController.h"

@implementation AMainBracketController

- (id)initWithLevelControllers:(NSArray*)levelControllers leftDrawerController:(UIViewController*)leftDrawerController {
    self = [super initWithCenterViewController:[levelControllers objectAtIndex:0]
                      leftDrawerViewController:leftDrawerController];
    
    self.levelControllers = levelControllers;
    
    return self;
}

@end
