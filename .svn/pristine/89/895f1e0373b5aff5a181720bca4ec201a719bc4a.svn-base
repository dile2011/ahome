//
//  ABaseMenuView.h
//  demoe
//
//  Created by andson-dile on 15/3/19.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AHomeMember.h"

@interface ABaseMenuView : UIView {
    AHomeMember *_member;
    NSMutableArray *_operates;
}

@property (nonatomic,retain)UIView *titleView;
@property (nonatomic,retain)UIView *panelView;


- (instancetype)initWithHomeMember:(AHomeMember*)member;
- (CGSize)getViewSize;

- (void)drawTitleView;
- (void)drawPanelView;

- (void)titleViewWithTitle:(NSString*)title titleView:(UIView*)titleView;

@end
