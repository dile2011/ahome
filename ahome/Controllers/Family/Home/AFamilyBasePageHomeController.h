//
//  AFamilyBasePageHomeController.h
//  ahome
//
//  Created by andson-dile on 15/7/27.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ABaseViewController.h"
#import "AFamily.h"

@interface AFamilyBasePageHomeController : ABaseViewController {
    AFamily *_family;
    UIImageView *_photoView;
    NSUInteger _selectedIndex;
    
    UIImage *_selectImage;
}

- (id)initWithPushStyle:(BOOL)isPush family:(id)familyObj selectedIndex:(NSUInteger)selectedIndex andImage:(UIImage*)image;

- (AFamily*)getFamily;

@end
