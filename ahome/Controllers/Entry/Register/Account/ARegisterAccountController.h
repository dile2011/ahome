//
//  ARegisterAccountController.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-25.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ABaseRegisterController.h"
#import "ARegisterAccountForm.h"

@interface ARegisterAccountController : ABaseRegisterController<QuickDialogEntryElementDelegate> {
    ARegisterAccountForm *_accountForm;
}

- (void)doNextAction;
@end
