//
//  AGuideNodeView.m
//  demoe
//
//  Created by andson-dile on 15/3/3.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "AGuideNodeView.h"

@implementation AGuideNodeView

- (instancetype)initWithImageName:(NSString *)imageName center:(CGPoint)center {
    self = [super initWithImage:[UIImage imageNamed:imageName]];
    _center = center;
    [self initCommont];
    
    return self;
}

- (void)initCommont {
    self.center = _center;
    self.bounds = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
    self.layer.cornerRadius = self.bounds.size.width/2.;
    self.layer.masksToBounds = YES;
    self.opaque = NO;
    self.transform = CGAffineTransformMakeScale(0.001, 0.001);
}

- (CGSize)sizeForShowImage {
    return self.bounds.size;
}

@end
