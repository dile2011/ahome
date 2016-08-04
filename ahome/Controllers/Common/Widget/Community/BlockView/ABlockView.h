//
//  ABlockView.h
//  AtHomeApp
//
//  Created by dilei liu on 14-10-1.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABlockViewDelegate.h"

@interface ABlockView : UIView {
    BOOL _isSelected;
}

@property (nonatomic,assign)id<ABlockViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame andText:(NSString*)text andDelegate:(id)delegate;
- (void)showStyleByBool:(BOOL)boolean;

@end
