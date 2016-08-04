//
//  AGuidePageView2.m
//  demoe
//
//  Created by andson-dile on 15/3/3.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "AGuidePageView2.h"
#import "AGuideNodeView.h"

#define margin_left_size    20
#define margin_top_size     20

#define margin_node_size    60

@implementation AGuidePageView2

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
    float H = 2*margin_top_size;
    
    UIImageView *nodeView = [self.nodeViews firstObject];
    CGSize nodeSize = nodeView.image.size;
    H += (self.nodeViews.count - 1)*nodeSize.height;
    
    H += (self.nodeViews.count - 2)*margin_node_size;
    
    return H;
}



- (void)startDrawLine:(int)index {
    AGuideNodeView *nodeView = [self.nodeViews objectAtIndex:index];
    CGPoint point = CGPointMake(0, 0);
    CGPoint toPoint = CGPointMake(0, 0);
    
    if (index == 1) {
        NSValue *pvalue = [self.nodeLocations objectAtIndex:(nodeView.tag - 1)];
        NSValue *topvalue = [self.nodeLocations objectAtIndex:nodeView.tag];
        point = CGPointMake(pvalue.CGPointValue.x+nodeView.frame.size.width/2., pvalue.CGPointValue.y);
        toPoint = CGPointMake(topvalue.CGPointValue.x-nodeView.frame.size.width/2., topvalue.CGPointValue.y);
    }
    
    if (index == 2) {
        NSValue *pvalue = [self.nodeLocations objectAtIndex:(nodeView.tag - 1)];
        point = CGPointMake(self.frame.size.width/2., pvalue.CGPointValue.y);
        NSValue *topvalue = [self.nodeLocations objectAtIndex:nodeView.tag];
        toPoint = CGPointMake(topvalue.CGPointValue.x, topvalue.CGPointValue.y-nodeView.frame.size.width/2.);
    }
    
    if (index == 3) {
        NSValue *pvalue = [self.nodeLocations objectAtIndex:(nodeView.tag - 1)];
        point = CGPointMake(self.frame.size.width/2., pvalue.CGPointValue.y+nodeView.frame.size.width/2.);
        NSValue *topvalue = [self.nodeLocations objectAtIndex:nodeView.tag];
        toPoint = CGPointMake(self.frame.size.width/2., topvalue.CGPointValue.y-nodeView.frame.size.width/2.);
    }
    
    [self drawLine:point toPoint:toPoint];
    
    if (index == self.nodeViews.count-1) {
        [self viewByTitle:@"家可以留传后世"];
    }
    
}

- (void)arrayNodeLocation {
    for (AGuideNodeView *nodeView in self.nodeViews) {
        
        CGSize nodeSize = [nodeView sizeForShowImage];
        int index = (int)[self.nodeViews indexOfObject:nodeView];
        NSValue *nodeLocationValue = nil;
        
        if (index == 0) {
            nodeLocationValue = [NSValue valueWithCGPoint:CGPointMake(margin_left_size+nodeSize.width/2., margin_top_size+nodeSize.height/2.)];
            
        } else if (index == 1) {
            nodeLocationValue = [NSValue valueWithCGPoint:CGPointMake(self.frame.size.width-margin_left_size-nodeSize.width/2., margin_top_size+nodeSize.height/2.)];
            
        } else {
            float x = self.frame.size.width/2.;
            float y = margin_top_size+(index - 1)*(margin_node_size+nodeSize.height)+nodeSize.height/2.;
            nodeLocationValue = [NSValue valueWithCGPoint:CGPointMake(x, y)];
        }
        
        nodeView.tag = index;
        nodeView.center = [nodeLocationValue CGPointValue];
        [self.nodeLocations addObject:nodeLocationValue];
    }
}

@end
