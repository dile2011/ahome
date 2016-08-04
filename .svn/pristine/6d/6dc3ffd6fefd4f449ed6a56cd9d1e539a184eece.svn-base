//
//  AGuidePageView3.m
//  demoe
//
//  Created by andson-dile on 15/3/3.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "AGuidePageView3.h"
#import "AGuideNodeView.h"

#define margin_top_size 20
#define margin_node_size    50

@implementation AGuidePageView3

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    AGuideNodeView *guideNode0 = [[AGuideNodeView alloc]initWithImageName:@"guide_face_0.jpg" center:self.center];
    [self.nodeViews addObject:guideNode0];
    
    AGuideNodeView *guideNode1 = [[AGuideNodeView alloc]initWithImageName:@"guide_face_1.jpg" center:self.center];
    [self.nodeViews addObject:guideNode1];
    
    AGuideNodeView *guideNode2 = [[AGuideNodeView alloc]initWithImageName:@"guide_face_2.jpg" center:self.center];
    [self.nodeViews addObject:guideNode2];
    
    
    float H = [self heightDrawPanel];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 60+(self.frame.size.height-60-H)/2., self.frame.size.width, H)];
    [self addSubview:view];
    
    [view addSubview:guideNode0];
    [view addSubview:guideNode1];
    [view addSubview:guideNode2];
    
    [self arrayNodeLocation];

    return self;
}

- (float)heightDrawPanel {
    return 150;
}

- (void)startDrawLine:(int)index {
    AGuideNodeView *nodeView = [self.nodeViews objectAtIndex:index];
    CGPoint point = CGPointMake(0, 0);
    CGPoint toPoint = CGPointMake(0, 0);
    
    if (index == 0) {
        point = CGPointMake(nodeView.center.x, nodeView.center.y+nodeView.frame.size.width/2.);
        NSValue *tpValue = [self.nodeLocations objectAtIndex:index+1];
        toPoint = CGPointMake(tpValue.CGPointValue.x+nodeView.frame.size.width/2.,tpValue.CGPointValue.y);
        
    } else if (index == 1) {
        point = CGPointMake(nodeView.center.x+nodeView.frame.size.width/2.,nodeView.center.y);
        NSValue *tpValue = [self.nodeLocations objectAtIndex:index+1];
        toPoint = CGPointMake(tpValue.CGPointValue.x-nodeView.frame.size.width/2., tpValue.CGPointValue.y);
        
    } else if (index == 2) {
        point = CGPointMake(nodeView.center.x-nodeView.frame.size.width/2., nodeView.center.y);
        AGuideNodeView *preNodeView = [self.nodeViews objectAtIndex:0];
        toPoint = CGPointMake(preNodeView.center.x, preNodeView.center.y+preNodeView.frame.size.width/2.);
    }
    
    [self drawLine:point toPoint:toPoint];
    
    if (index == self.nodeViews.count-1) {
        [self viewByTitle:@"家、邻社、家族互通"];
    }
}

- (void)arrayNodeLocation {
    UIView *view = [self.subviews firstObject];
    for (AGuideNodeView *nodeView in self.nodeViews) {
        int index = (int)[self.nodeViews indexOfObject:nodeView];
        NSValue *nodeLocationValue = nil;
        
        if (index == 0) {
            nodeLocationValue = [NSValue valueWithCGPoint:CGPointMake(view.frame.size.width/2., nodeView.frame.size.height/2.)];
            
        } else if (index == 1) {
            float y = view.frame.size.height-nodeView.frame.size.height/2.;
            nodeLocationValue = [NSValue valueWithCGPoint:CGPointMake(view.frame.size.width/4., y)];
            
        } else {
            float y = view.frame.size.height-nodeView.frame.size.height/2.;
            nodeLocationValue = [NSValue valueWithCGPoint:CGPointMake(3*view.frame.size.width/4., y)];
        }
        
        nodeView.tag = index;
        nodeView.center = [nodeLocationValue CGPointValue];
        [self.nodeLocations addObject:nodeLocationValue];
    }
}

@end
