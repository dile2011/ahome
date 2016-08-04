//
//  APopupHandler.m
//  ahome
//
//  Created by andson-dile on 15/6/5.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "APopupHandler.h"
#import "AQuickPopupController.h"

@implementation APopupHandler

+ (APopupHandler *)sharedInstance {
    static APopupHandler *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[APopupHandler alloc] init];
        sharedInstance.pageHeight = 260;
        sharedInstance.pageWidth = 250;
    });
    
    return sharedInstance;
}

- (id)genPopupNavigation:(id)controllerObj {
    QuickDialogController *popupController = (QuickDialogController*)controllerObj;
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:popupController];
    [navi.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.9, _pageHeight)];
    
    return navi;
}

- (id)genPopupNavigation:(id)controllerObj width:(float)width height:(float)height {
    QuickDialogController *popupController = (QuickDialogController*)controllerObj;
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:popupController];
    [navi.view setFrame:CGRectMake(0, 0, width, height)];
    
    return navi;
}



@end
