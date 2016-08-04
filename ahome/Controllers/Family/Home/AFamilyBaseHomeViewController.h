//
//  AFamilyBaseHomeViewController.h
//  ahome
//
//  Created by andson-dile on 15/7/28.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ATableRefreshController.h"
#import "AFamilyPageHomeDeleate.h"
#import "AHome.h"

@interface AFamilyBaseHomeViewController : ATableRefreshController {
    UIImageView *_familyHomePhotoView;
    UIImageView *_blurrySegueView;
    
    AHome *_home;
    CGRect _frame;
    UIImage *_selectImage;
    NSUInteger _indexBlurryView;
}

@property (nonatomic,assign)id<AFamilyPageHomeDeleate> pageHomeDel;
@property (nonatomic,assign)NSUInteger index;

- (instancetype)initWithHome:(AHome*)ahome delObj:(id)delObj andFrame:(CGRect)theFrame;
- (instancetype)initWithHome:(AHome*)ahome delObj:(id)delObj selImage:(UIImage*)image andFrame:(CGRect)theFrame;

- (void)pageViewScrollByDisable:(BOOL)disable;

@end
