//
//  ARegisterAreaController.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-25.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ABaseRegisterController.h"
#import "ARegisterAreaForm.h"

@interface ARegisterAreaController : ABaseRegisterController<QuickDialogEntryElementDelegate>

@property (nonatomic,strong)NSDictionary *regionInfo;
@property (nonatomic,retain)ARegisterAreaForm *registerAreaForm;

- (void)setRegionValue:(NSString*)regionName;

@end
