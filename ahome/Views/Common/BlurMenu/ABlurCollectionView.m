//
//  ABlurCollectionView.m
//  ahome
//
//  Created by andson-dile on 15/6/12.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ABlurCollectionView.h"

@implementation ABlurCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    
    _meshView = [[ABlurMeshView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:_meshView];
    
    return self;
}

- (void)setDataForCell:(ABlurMenu*)blurMenu {
    [_meshView setMesh:blurMenu];
}

@end
