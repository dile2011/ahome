//
//  AFamilyCollectionView.m
//  ahome
//
//  Created by andson-dile on 15/7/17.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AFamilyCollectionView.h"
#import "UIImageView+WebCache.h"
#import "AHome.h"

#define homePhoto_border_size   1.5

@implementation AFamilyCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];

    _homeBgPhoto = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [_homeBgPhoto setImage:[UIImage imageNamed:@"family_homePhotoBg.jpeg"]];
    _homeBgPhoto.contentMode =  UIViewContentModeScaleAspectFill;
    //[self addSubview:_homeBgPhoto];
    
    _homePhoto = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    _homePhoto.contentMode = UIViewContentModeScaleAspectFill;
    _homePhoto.clipsToBounds = YES;
    [self addSubview:_homePhoto];
    
    return self;
}

- (void)setDataForCollectionCell:(id)cellData {
    AHome *home = (AHome*)cellData;
    SDWebImageManager *imageManager = [SDWebImageManager sharedManager];
    [imageManager downloadWithURL:[NSURL URLWithString:home.photo] options:SDWebImageRefreshCached progress:^(NSUInteger receivedSize, long long expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished) {
        UIImage *scalImage = [[AUtilities sharedInstance]compressImage:image fixedWidth:[UIScreen mainScreen].bounds.size.width];
        [_homePhoto setImage:scalImage];
    }];
}

- (UIImageView*)getPhotoView {
    return _homePhoto;
}

@end
