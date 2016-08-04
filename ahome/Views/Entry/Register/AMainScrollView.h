//
//  AMainScrollView.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-25.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMainScrollView : UIScrollView

- (id)initWithFrame:(CGRect)frame andPageNo:(int)pageNo;

- (UIView*)getPageByIndex:(int)index;
- (void)displayPageByindex:(int)index;

@end
