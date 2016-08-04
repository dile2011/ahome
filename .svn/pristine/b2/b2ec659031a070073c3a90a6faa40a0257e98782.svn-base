//
//  AGuidePageView1.m
//  demoe
//
//  Created by andson-dile on 15/3/3.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "AGuidePageView1.h"
#import "AGuideNodeView.h"

#define margin_top_size     20
#define margin_node_size    50

@implementation AGuidePageView1

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    AGuideNodeView *guideNode0 = [[AGuideNodeView alloc]initWithImageName:@"guide_face_0.jpg" center:self.center];
    [self.nodeViews addObject:guideNode0];
    
    AGuideNodeView *guideNode1 = [[AGuideNodeView alloc]initWithImageName:@"guide_face_1.jpg" center:self.center];
    [self.nodeViews addObject:guideNode1];
    
    AGuideNodeView *guideNode2 = [[AGuideNodeView alloc]initWithImageName:@"guide_face_2.jpg" center:self.center];
    [self.nodeViews addObject:guideNode2];
    
    AGuideNodeView *guideNode3 = [[AGuideNodeView alloc]initWithImageName:@"guide_face_3.jpg" center:self.center];
    [self.nodeViews addObject:guideNode3];
    
    float H = [self heightDrawPanel];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 60+(self.frame.size.height-60-H)/2., self.frame.size.width, H)];
    [self addSubview:view];
    
    [view addSubview:guideNode0];
    [view addSubview:guideNode1];
    [view addSubview:guideNode2];
    [view addSubview:guideNode3];
    
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
    if (index == 0) return;
    
    AGuideNodeView *nodeView = [self.nodeViews objectAtIndex:index];
    NSValue *pvalue = [self.nodeLocations objectAtIndex:0];
    CGPoint point = CGPointMake(pvalue.CGPointValue.x+nodeView.frame.size.width/2., pvalue.CGPointValue.y);
    CGPoint toPoint = CGPointMake(0, 0);
    
    if (nodeView.tag == 1) {
        toPoint = CGPointMake(nodeView.center.x, nodeView.center.y+nodeView.frame.size.width/2.);
        
    } else if (nodeView.tag == 2) {
        toPoint = CGPointMake(nodeView.center.x-nodeView.frame.size.width/2., nodeView.center.y);
        
    } else if (nodeView.tag == 3) {
        toPoint = CGPointMake(nodeView.center.x, nodeView.center.y-nodeView.frame.size.width/2.);
    }

    [self drawLine:point toPoint:toPoint];
    
    if (index == self.nodeViews.count-1) {
        [self viewByTitle:@"聚社区圈"];
    }
    
}

- (void)arrayNodeLocation {
    UIView *view = [self.subviews firstObject];
    
    for (AGuideNodeView *nodeView in self.nodeViews) {
        int index = (int)[self.nodeViews indexOfObject:nodeView];
        NSValue *nodeLocationValue = nil;
        
        if (index == 0) {
            nodeLocationValue = [NSValue valueWithCGPoint:CGPointMake(view.frame.size.width/4., view.frame.size.height/2.)];
            
        } else if (index == 1) {
            nodeLocationValue = [NSValue valueWithCGPoint:CGPointMake(view.frame.size.width/2., nodeView.frame.size.height/2.)];
            
        } else if(index == 2){
            nodeLocationValue = [NSValue valueWithCGPoint:CGPointMake(view.frame.size.width/2.+view.frame.size.width/4., view.frame.size.height/2.)];
        } else if(index == 3){
            nodeLocationValue = [NSValue valueWithCGPoint:CGPointMake(view.frame.size.width/2., view.frame.size.height-nodeView.frame.size.height/2.)];
        }
        
        nodeView.tag = index;
        nodeView.center = [nodeLocationValue CGPointValue];
        [self.nodeLocations addObject:nodeLocationValue];
    }
}


@end
