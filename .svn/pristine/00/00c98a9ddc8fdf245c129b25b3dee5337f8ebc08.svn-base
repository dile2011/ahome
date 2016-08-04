//
//  AGuidePageView.h
//  demoe
//
//  Created by andson-dile on 15/3/3.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGuidePageView : UIView {
    
}

@property (nonatomic,retain)NSMutableArray *nodeViews;
@property (nonatomic,retain)NSMutableArray *nodeLocations;

@property(nonatomic, copy) void (^completeShow)(void);

- (void)showGuideContent;
- (void)arrayNodeLocation;

- (void)drawLine:(CGPoint)point toPoint:(CGPoint)toPoint;
- (void)startDrawLine:(int)index;

- (void)viewByTitle:(NSString*)title;
- (UIImageView*)newBlurrySegue;

@end
