//
//  ANewHomeFinishController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-31.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANewHomeFinishController.h"
#import "ANextActionButtonElement.h"
#import "ANextActionButtonElementView.h"
#import "ANewHomeController.h"
#import "ANewHomeImageElementView.h"
#import "ANewHomeImageElement.h"

@implementation ANewHomeFinishController

- (id)init {
    self = [super init];
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    self.root = root;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QSection *baseSection = [[QSection alloc]init];
    [self.root addSection:baseSection];
    
    ANewHomeImageElement *homeImageElement = [[ANewHomeImageElement alloc]init];
    [homeImageElement setKey:@"homeImageElement"];
    [baseSection addElement:homeImageElement];
    
    QLabelElement *homeElement = [[QLabelElement alloc]initWithTitle:@"家庭所属角色" Value:nil];
    [homeElement setKey:@"homeElement"];
    [baseSection addElement:homeElement];
    

    QSection *regionSection = [[QSection alloc]initWithTitle:@"地区"];
    [self.root addSection:regionSection];
    
    QLabelElement *regionElement = [[QLabelElement alloc]initWithTitle:@"地区" Value:nil];
    [regionElement setKey:@"RegionElement"];
    [regionSection addElement:regionElement];
    
    QLabelElement *communityElement = [[QLabelElement alloc]initWithTitle:@"社区" Value:nil];
    [communityElement setKey:@"CommunityElement"];
    [regionSection addElement:communityElement];
    

    QSection *actionSection = [[QSection alloc]init];
    [self.root addSection:actionSection];
    ANextActionButtonElement *nextButtonElement = [[ANextActionButtonElement alloc]init];
    nextButtonElement.buttonTitle = @"完  成";
    [nextButtonElement setKey:@"ANextActionButtonElement"];
    [actionSection addElement:nextButtonElement];
    
}

- (void)setDataForElement {
    ANewHomeController *newHomeController = (ANewHomeController*)self.delegate;
    ANewHomeForm *newHomeForm = newHomeController.createHomeForm;
    
    ANewHomeImageElement *homeImageElement = (ANewHomeImageElement*)[self.root elementWithKey:@"homeImageElement"];
    ANewHomeImageElementView *imagecell = (ANewHomeImageElementView*)[self.quickDialogTableView cellForElement:homeImageElement];
    
    UIImage *image = [UIImage imageWithData:newHomeForm.imageData];
    [imagecell setHomeImage:image];
    
    QLabelElement *homeElement = (QLabelElement*)[self.root elementWithKey:@"homeElement"];
    [homeElement setValue:newHomeForm.part];
    
    QLabelElement *regionElement = (QLabelElement*)[self.root elementWithKey:@"RegionElement"];
    [regionElement setValue:newHomeForm.region];
    
    QLabelElement *communityElement = (QLabelElement*)[self.root elementWithKey:@"CommunityElement"];
    [communityElement setValue:newHomeForm.region_name];
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    ANextActionButtonElement *nextActionButtonElement = (ANextActionButtonElement*)[self.root elementWithKey:@"ANextActionButtonElement"];
    ANextActionButtonElementView *nextActionButtonElementView = (ANextActionButtonElementView*)[self.quickDialogTableView cellForElement:nextActionButtonElement];
    [nextActionButtonElementView setButtonState:EnableState];
}

- (void)doNextAction {
    [self.delegate doNextAction:NewAtHomeEnd];
}


@end
