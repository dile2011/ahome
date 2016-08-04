//
//  ANewHomeController.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-30.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ARootViewController.h"
#import "ANewHomeProgressView.h"
#import "AMainScrollView.h"

#import "ANewHomeBaseInfoController.h"
#import "ANewHomeAreaController.h"
#import "ANewHomeInviteController.h"
#import "ANewHomeFinishController.h"
#import "ANewHomeForm.h"

typedef enum {
    NewAtHomeBaseForm,
    NewAtHomeAreaForm,
    NewAtHomeInviteForm,
    NewAtHomeFinishForm,
    NewAtHomeEnd
}NewAthHomeForm;

@interface ANewHomeController : ABaseViewController<UIScrollViewDelegate,ANewAtHomeDelegate> {
    ANewHomeProgressView *_newAthomeProgressView;
    AMainScrollView *_mainScrollView;
    
    NewAthHomeForm _indexForcurrentDisplayForm;
    NewAthHomeForm _indexForhadStepForm;
    
    ANewHomeBaseInfoController *_baseInfoCon;
    ANewHomeAreaController *_areaCon;
    ANewHomeInviteController *_inviteCon;
    ANewHomeFinishController *_finishCon;
}

@property (nonatomic,retain)ANewHomeForm *createHomeForm;

@end
