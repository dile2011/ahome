//
//  AFamilyBaseHomeViewController.m
//  ahome
//
//  Created by andson-dile on 15/7/28.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AFamilyBaseHomeViewController.h"
#import "AFamilyPageHomeController.h"
#import "UIImageView+WebCache.h"
#import "UIImage+ImageEffects.h"

@implementation AFamilyBaseHomeViewController

- (instancetype)initWithHome:(AHome*)ahome delObj:(id)delObj andFrame:(CGRect)theFrame{
    self = [super init];
    _home = ahome;
    self.pageHomeDel = delObj;
    _frame = theFrame;
    
    return self;
}

- (instancetype)initWithHome:(AHome*)ahome delObj:(id)delObj selImage:(UIImage*)image andFrame:(CGRect)theFrame{
    self = [super init];
    _home = ahome;
    self.pageHomeDel = delObj;
    _frame = theFrame;
    
    _selectImage = image;
    
    return self;
}

- (void)viewDidLoad {
    [self.view setFrame:_frame];
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView animateWithDuration:1. animations:^{
        _blurrySegueView.alpha = 1.;
        self.tableView.alpha = 1.;
    }];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    _blurrySegueView.alpha = 0.;
    self.tableView.alpha = 0.;
}

- (void)pageViewScrollByDisable:(BOOL)disable {
    AFamilyPageHomeController *pageHomeController = (AFamilyPageHomeController*)self.pageHomeDel;
    for (UIGestureRecognizer *recognizer in pageHomeController.pageViewController.gestureRecognizers) {
        recognizer.enabled = disable;
    }
}

- (UIImageView*)newBlurrySegue:(UIViewController*)source {
    CGSize windowSize = source.view.bounds.size;
    
    UIGraphicsBeginImageContextWithOptions(windowSize, YES, 2.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [source.view.layer renderInContext:context];
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    snapshot = [snapshot applyBlurWithRadius:@(10).doubleValue
                                   tintColor:[UIColor colorWithRed:0. green:0. blue:0. alpha:.2]
                       saturationDeltaFactor:@(1.f).doubleValue
                                   maskImage:nil];
    
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:snapshot];
    backgroundImageView.frame = CGRectMake(0, 0, windowSize.width, windowSize.height);
    backgroundImageView.userInteractionEnabled = YES;
    
    return backgroundImageView;
}


//=============================================================
//=============================================================
//=============================================================
- (UIViewController *)getCurrentShowNavi {
    AFamilyPageHomeController *pageHomeController = (AFamilyPageHomeController*)self.pageHomeDel;
    return pageHomeController.navigationController;
}

- (APullRefreshView *)newPullRefreshView {
    APullRefreshView *pullRefreshView = [super newPullRefreshView];
    [pullRefreshView setBackgroundColor:[UIColor clearColor]];
    return pullRefreshView;
}

- (void)showRefreshControl {
    [super showRefreshControl];
    AFamilyPageHomeController *pageHomeController = (AFamilyPageHomeController*)self.pageHomeDel;
    pageHomeController.title = @"";
}

- (void)hiddenRefreshControlByModel:(BOOL)model {
    float time = 0.;
    if (model) time = 1.;
    
    _isTask = YES;
    
    __block AFamilyBaseHomeViewController *weakSelf = self;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        weakSelf.refreshImgView.alpha = .0;
        _isLoading = NO;
        _isTask = NO;
        
        [weakSelf.refreshImgView resetRefreshLabel];
        
        AFamilyPageHomeController *pageHomeController = (AFamilyPageHomeController*)weakSelf.pageHomeDel;
        AFamily *family = [pageHomeController getFamily];
        pageHomeController.title = family.familyCategory;
        [weakSelf pageViewScrollByDisable:YES];
    });
}

- (void)addKenBurnView {
    UIImageView *homeBgView = [[UIImageView alloc]initWithFrame:_frame];
    [homeBgView setImage:[UIImage imageNamed:@"family_home_bg.jpeg"]];
    [self.view addSubview:homeBgView];
    
    _familyHomePhotoView = [[UIImageView alloc]init];
    _familyHomePhotoView.contentMode = UIViewContentModeScaleAspectFill;
    _familyHomePhotoView.clipsToBounds = YES;
    [self.view addSubview:_familyHomePhotoView];
    
    if (_selectImage != nil) {
        CGRect endAnimationFrame = CGRectMake(([UIScreen mainScreen].bounds.size.width-_selectImage.size.width)/2., (self.view.frame.size.height - _selectImage.size.height)/2.-2, _selectImage.size.width, _selectImage.size.height);
        [_familyHomePhotoView setImage:_selectImage];
        [_familyHomePhotoView setFrame:endAnimationFrame];
    
        _blurrySegueView = [self newBlurrySegue:self];
        [_blurrySegueView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _blurrySegueView.tag = 10000;
        _blurrySegueView.alpha = 0.;
        [self.view addSubview:_blurrySegueView];
        
        return;
    }
    
    SDWebImageManager *imageManager = [SDWebImageManager sharedManager];
    [imageManager downloadWithURL:[NSURL URLWithString:_home.photo] options:SDWebImageRefreshCached progress:^(NSUInteger receivedSize, long long expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished) {
        UIImage *scalImage = [[AUtilities sharedInstance]compressImage:image fixedWidth:[UIScreen mainScreen].bounds.size.width];
        [_familyHomePhotoView setImage:scalImage];
        
        CGRect endAnimationFrame = CGRectMake(([UIScreen mainScreen].bounds.size.width-scalImage.size.width)/2., (self.view.bounds.size.height - scalImage.size.height)/2., scalImage.size.width, scalImage.size.height);
        [_familyHomePhotoView setFrame:endAnimationFrame];
        
        _blurrySegueView = [self newBlurrySegue:self];
        [_blurrySegueView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _blurrySegueView.tag = 10000;
        _blurrySegueView.alpha = 0.;
        [self.view addSubview:_blurrySegueView];
    }];
}


@end
