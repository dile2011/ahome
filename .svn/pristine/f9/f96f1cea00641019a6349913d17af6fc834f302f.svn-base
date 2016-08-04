//
//  ARegisterViewController.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-24.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ABaseViewController.h"
#import "AMainScrollView.h"
#import "ARegisterForm.h"

#import "ARegisterAccountController.h"
#import "ARegisterIdentityController.h"
#import "ARegisterAreaController.h"
#import "ARegisterFinishController.h"

typedef enum {
    RegisterAccountForm,
    RegisterIdentityForm,
    RegisterAreaForm,
    RegisterFinishForm,
    RegisterEnd
}RegisterForm;

@interface ARegisterViewController : ABaseViewController<UIScrollViewDelegate,ARegisterDelegate> {
    AMainScrollView *_mainScrollView;
    RegisterForm _indexForcurrentDisplayForm;
    
    ARegisterAccountController *_accountCon;
    ARegisterIdentityController *_identityCon;
    ARegisterAreaController *_areaCon;
    ARegisterFinishController *_finishCon;
}

@property (nonatomic,retain)ARegisterForm *registerForm;

- (void)changeBackBarButtonItem:(int)index;

@end
