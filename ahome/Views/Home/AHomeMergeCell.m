//
//  AHomeMergeCell.m
//  ahome
//
//  Created by andson-dile on 15/6/17.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHomeMergeCell.h"
#import "AMergeHomeInfo.h"
#import "AHomeLevelController.h"
#import "AUserCookie.h"

@implementation AHomeMergeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    for (int i=1; i<=5; i++) {
        if (i == 1) continue;
        
        CAShapeLayer *circleLayer = [CAShapeLayer layer];
        [circleLayer setBounds:CGRectMake(0, 0, i*2*[AHomeMergeCell radiusSize],i*2*[AHomeMergeCell radiusSize])];
        [circleLayer setPosition:CGPointMake([UIScreen mainScreen].bounds.size.width/2., [AHomeMergeCell heightForCell:0]/2.)];
        [circleLayer setFillColor:[[UIColor clearColor] CGColor]];
        
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0.0f, 0.0f, i*2*[AHomeMergeCell radiusSize], i*2*[AHomeMergeCell radiusSize])];
        [circleLayer setPath:[path CGPath]];
        [circleLayer setStrokeColor:[[UIColor whiteColor]CGColor]];
        [circleLayer setLineWidth:.1f/i];
        [[self layer] addSublayer:circleLayer];
    }

    _mergeHomeMembers = [NSMutableArray array];
    for (int i=0; i<20; i++) {
        AMergeMemberView *mergeMemberView = [[AMergeMemberView alloc]init];
        [_mergeHomeMembers addObject:mergeMemberView];
    }
    
    return self;
}

- (void)resetMergeView:(AMergeMemberView*)mergeView {
    mergeView.tag = 0.;
    [mergeView initCommon];
}

- (void)setDataForCell:(ARecord*)record {
    for (UIView *view in self.subviews)[view removeFromSuperview];
    for (AMergeMemberView *mergeView in _mergeHomeMembers)[self resetMergeView:mergeView];
    
    AMergeHomeInfo *mergeHomeInfo = (AMergeHomeInfo*)record;
    for (int i = (int)mergeHomeInfo.members.count; i>=1; i--) {
        AMergeHomeMember *mergeMember = [mergeHomeInfo.members objectAtIndex:i-1];
        AMergeMemberView *mergeHomeView = [_mergeHomeMembers objectAtIndex:i-1];
        mergeHomeView.tag = i;
        [mergeHomeView setData:mergeMember];
        [self addSubview:mergeHomeView];
    }
    
    [self startAnimation];
}

+ (float)heightForCell:(int)nodes {
    AHomeLevelController *homeLevel = [AHomeLevelController sharedInstance];
    float headerHeight = homeLevel.homePage.tableView.tableHeaderView.frame.size.height;
    return homeLevel.homePage.view.frame.size.height - headerHeight;
}

+ (float)radiusSize {
    return [[AUtilities sharedInstance]homeRadiusSize];
}

- (void)startAnimation {
    for (AMergeMemberView *memberView in _mergeHomeMembers) {
        if (memberView.tag == 0) continue;
        
        int index = (int)[_mergeHomeMembers indexOfObject:memberView];
        AHomeLevelController *homeLevel = [AHomeLevelController sharedInstance];
        AMergeHomeInfo *homeInfo = (AMergeHomeInfo*)homeLevel.homePage.homeInfo;
        AMergeHomeMember *mergeMember = [homeInfo.members objectAtIndex:index];
        
        AUserCookie *userCookie = [AUserCookie userCookie];
        if (userCookie.serverId == mergeMember.uid)continue;
        
        float adius = 2*[AHomeMergeCell radiusSize];
        if (mergeMember.homeType == ParentHomeType) adius = 3*[AHomeMergeCell radiusSize];
        float angle = [[AUtilities sharedInstance]pointPairToBearingDegrees:CGPointMake([UIScreen mainScreen].bounds.size.width/2., [AHomeMergeCell heightForCell:1]/2.) secondPoint:memberView.center];
        [[AUtilities sharedInstance]rotateView:memberView aroundPoint:CGPointMake([UIScreen mainScreen].bounds.size.width/2., [AHomeMergeCell heightForCell:1]/2.) adius:adius angle:angle];
    }
}

- (void)stopAnimation {
    for (AMergeMemberView *memberView in _mergeHomeMembers) {
        int index = (int)[_mergeHomeMembers indexOfObject:memberView];
        if (index == 0) continue;
        
        [memberView.layer removeAllAnimations];
    }
}

@end
