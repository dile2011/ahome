//
//  AGuidePageView.m
//  demoe
//
//  Created by andson-dile on 15/3/3.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "AGuidePageView.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+ImageEffects.h"
#import "MZAppearance.h"
#import "RRSGlowLabel.h"

@implementation AGuidePageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.nodeViews = [NSMutableArray array];
    self.nodeLocations = [NSMutableArray array];
    
    return self;
}

- (void)showGuideContent {
    int inetratorI = 0;
    for (NSValue *coordinate in self.nodeLocations) {
        UIButton *nodeView = [self.nodeViews objectAtIndex:inetratorI];
        
        float delayTime = inetratorI * 0.15;
        [self performSelector:@selector(showBubbleWithAnimation:) withObject:[NSDictionary dictionaryWithObjectsAndKeys:nodeView, @"node", coordinate, @"coordinate", nil] afterDelay:delayTime];
        ++inetratorI;
    }
}

- (void)showBubbleWithAnimation:(NSDictionary *)info {
    UIButton *nodeView = (UIButton *)[info objectForKey:@"node"];
    NSValue *coordinate = (NSValue *)[info objectForKey:@"coordinate"];
    
    [UIView animateWithDuration:0.35 animations:^{
        nodeView.center = [coordinate CGPointValue];
        nodeView.alpha = 1;
        nodeView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.31 animations:^{
            nodeView.transform = CGAffineTransformMakeScale(0.8, 0.8);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.31 animations:^{
                nodeView.transform = CGAffineTransformMakeScale(1, 1);
            } completion:^(BOOL finished) {
                nodeView.layer.shadowColor = [UIColor blackColor].CGColor;
                nodeView.layer.shadowOpacity = 0.2;
                nodeView.layer.shadowOffset = CGSizeMake(0, 1);
                nodeView.layer.shadowRadius = 2;
                
                if (nodeView.tag == self.nodeViews.count-1) {
                    self.completeShow();
                }
                
                [self startDrawLine:(int)nodeView.tag];
            }];
        }];
    }];
}

- (void)arrayNodeLocation {

}

- (void)startDrawLine:(int)index {
    
}

- (void)drawLine:(CGPoint)point toPoint:(CGPoint)toPoint {
    UIView *view = [self.subviews firstObject];
    CAShapeLayer *_chartLine = [CAShapeLayer layer];
    [view.layer addSublayer:_chartLine];
    _chartLine.lineCap = kCALineCapRound;
    _chartLine.lineJoin = kCALineJoinBevel;
    _chartLine.fillColor   = [[UIColor whiteColor] CGColor];
    _chartLine.strokeColor = [UIColor whiteColor].CGColor;
    _chartLine.lineWidth   = 0.5;
    _chartLine.strokeEnd   = 0.0;
    
    UIBezierPath *progressline = [UIBezierPath bezierPath];
    [progressline setLineWidth:2.0];
    [progressline setLineCapStyle:kCGLineCapRound];
    [progressline setLineJoinStyle:kCGLineJoinRound];
    [progressline moveToPoint:point];
    [progressline addLineToPoint:toPoint];
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses = NO;
    
    _chartLine.path = progressline.CGPath;
    [_chartLine addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    _chartLine.strokeEnd = 1.0;
}

- (UIImageView*)newBlurrySegue {
    CGSize windowSize = self.window.bounds.size;
    
    UIGraphicsBeginImageContextWithOptions(windowSize, YES, 2.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.window.layer renderInContext:context];
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIColor* backingImageTintColor UI_APPEARANCE_SELECTOR;
    snapshot = [snapshot applyBlurWithRadius:@(25).doubleValue
                                   tintColor:backingImageTintColor
                       saturationDeltaFactor:@(.15f).doubleValue
                                   maskImage:nil];
    
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:snapshot];
    backgroundImageView.frame = CGRectMake(0, 0, windowSize.width, windowSize.height);
    backgroundImageView.userInteractionEnabled = YES;
    backgroundImageView.tag = 100;
    
    return backgroundImageView;
}

- (void)viewByTitle:(NSString*)title {
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, self.frame.size.width, 50)];
    [titleView setBackgroundColor:[UIColor clearColor]];
    titleView.alpha = .0;
    [self addSubview:titleView];
    
    RRSGlowLabel *descLabel = [[RRSGlowLabel alloc]initWithFrame:CGRectMake(0, 0, titleView.frame.size.width, titleView.frame.size.height)];
    descLabel.backgroundColor = [UIColor clearColor];
    descLabel.font = [UIFont boldSystemFontOfSize:25];
    descLabel.textColor = [UIColor whiteColor];
    descLabel.textAlignment = NSTextAlignmentCenter;
    descLabel.text = title;
    [titleView addSubview:descLabel];
    
    descLabel.textColor = [UIColor colorWithRed:0.20 green:0.70 blue:1.0 alpha:1.0];
    descLabel.glowColor = descLabel.textColor;
    descLabel.glowOffset = CGSizeMake(0.0, 0.0);
    descLabel.glowAmount = 20.0;
    
    [UIView animateWithDuration:1. animations:^{
        titleView.alpha = 1.;
        
    } completion:^(BOOL finished) {
        
    }];
}


@end
