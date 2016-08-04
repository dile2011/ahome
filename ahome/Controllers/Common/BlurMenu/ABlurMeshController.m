//
//  ABlurMeshController.m
//  demoe
//
//  Created by andson-dile on 15/3/6.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "ABlurMeshController.h"
#import "ABlurMeshView.h"

@implementation ABlurMeshController

- (instancetype)initWithMenus:(NSArray*)menus meshSize:(float)meshSize {
    self = [super init];
    _blurMenus = menus;
    _meshSize = meshSize;
    _meshNum = [NSMutableArray array];
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    [self initMeshNum];
    [self newMeshMenu];
}

- (void)initMeshNum {
    int rowNo = self.frame.size.height/_meshSize;
    int rowNum = self.frame.size.width/_meshSize;
    _meshNum = [NSMutableArray array];
    
    for (int i = 0; i<rowNo; i++) {
        float y = i*_meshSize;
        
        for (int j=0; j<rowNum; j++) {
            float x = j*_meshSize;
            
            ABlurMeshView *meshView = [[ABlurMeshView alloc]initWithFrame:CGRectMake(x, y, _meshSize, _meshSize)];
            [_meshNum addObject:meshView];
        }
    }
}

- (void)newMeshMenu {
    for (ABlurMenu *blurMenu in _blurMenus) {
        
        int index = (int)[_blurMenus indexOfObject:blurMenu];
        ABlurMeshView *meshView = [_meshNum objectAtIndex:index];
        [self.view addSubview:meshView];
        
        [meshView setMesh:blurMenu];
    }
}


@end
