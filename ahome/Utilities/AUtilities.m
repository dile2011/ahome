//
//  AUtilities.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-23.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AUtilities.h"
#import "ARegionServer.h"
#import "ALoginServer.h"

#import "AUser.h"
#import "AHome.h"
#import "AHomeMember.h"
#import "AUserCookie.h"

#define AngleToRadian(angle) (M_PI/180.0f)*angle

@implementation AUtilities

+ (AUtilities *)sharedInstance {
    static AUtilities *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AUtilities alloc] init];
    });
    
    return sharedInstance;
}

- (id)init {
    self = [super init];
    
    _dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setLocale: [NSLocale currentLocale]];
    [_dateFormatter setDateFormat:@"yy-MM-dd"];
    
    _longFormatter = [[NSDateFormatter alloc] init];
    [_longFormatter setLocale: [NSLocale currentLocale]];
    [_longFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    _dateParserFormatter = [[NSDateFormatter alloc] init];
    [_dateParserFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    
    _hzdateParserFormatter = [[NSDateFormatter alloc] init];
    [_hzdateParserFormatter setLocale: [NSLocale currentLocale]];
    [_hzdateParserFormatter setDateFormat:@"MM月dd日 HH:mm"];
    
    _activityIndicator = [[HZActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [_activityIndicator setFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-40)/2.,([UIScreen mainScreen].bounds.size.height-40)/2., 40, 40)];
    _activityIndicator.opaque = YES;
    _activityIndicator.steps = 12;
    _activityIndicator.finSize = CGSizeMake(2.3, 12);
    _activityIndicator.indicatorRadius = 8;
    _activityIndicator.stepDuration = 0.100;
    _activityIndicator.color = [UIColor colorWithRed:82./255.0 green:160.0/255 blue:73.0/255. alpha:.1];
    _activityIndicator.roundedCoreners = UIRectCornerTopRight;
    
    return self;
}

- (NSString*) formatDateAsOriginal:(NSDate*)date {
    return [_dateParserFormatter stringFromDate:date];
}

- (NSString*)formatDate:(NSDate *)date {
    return [_dateFormatter stringFromDate: date];
}

- (NSString*)simpleFormatDate:(NSDate *)date {
    if (date) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setLocale: [NSLocale currentLocale]];
        [formatter setDateFormat:@"YYYY-MM"];
        
        return [formatter stringFromDate: date];
    } else {
        return @"最近";
    }
}

- (NSString*)formatDateFromString:(NSString *)dateStr {
    NSDate *date = [_dateParserFormatter dateFromString:dateStr];
    return [self formatDate:date];
}

- (NSString*) prettyTime:(NSDate *)date {
    return [self prettyTime:date longFormat:NO];
}

- (NSString*) prettyTime:(NSDate *)date longFormat:(BOOL)longFormat {
    NSTimeInterval elapsed = [[NSDate date] timeIntervalSince1970] - [date timeIntervalSince1970];
    if (elapsed < 60) {
        return @"片刻之前";
    }
    if (elapsed < 60*60) {
        double min = floor(elapsed/60);
        return [NSString stringWithFormat:@"%d分钟前", (int)min];
    }
    if (elapsed < 24*60*60) {
        double hour = floor(elapsed/3600);
        return [NSString stringWithFormat:@"%d小时前", (int)hour];
    }
    if (elapsed < 7*24*60*60) {
        double hour = floor(elapsed/86400);
        return [NSString stringWithFormat:@"%d天前", (int)hour];
    }
    
    return longFormat ? [_longFormatter stringFromDate:date]: [_dateFormatter stringFromDate:date];
}

- (NSString*) prettyTimeFromString:(NSString *)dateStr {
    return [self prettyTimeFromString:dateStr longFormat:NO];
}

- (NSString*) prettyTimeFromString:(NSString *)dateStr longFormat:(BOOL)longFormat {
    NSDate *date = [_dateParserFormatter dateFromString:dateStr];
    return [self prettyTime:date longFormat:longFormat];
}

- (NSDate*) dateParserFromString:(NSString*)dateStr {
    return [_dateParserFormatter dateFromString:dateStr];
}

- (NSDate*) dateLongFromString:(NSString*)dateStr {
    return [_longFormatter dateFromString:dateStr];
}

- (NSDate*) dateSimplyFromString:(NSString*)dateStr {
    return [_dateFormatter dateFromString:dateStr];
}


- (NSString*) stringFromDate:(NSDate*)date {
    return [_dateParserFormatter stringFromDate:date];
}

- (NSString*) stringLongFromDate:(NSDate *)date {
    return [_longFormatter stringFromDate:date];
}

-(NSString*) stringHzFromDate:(NSDate*)date {
    return [_hzdateParserFormatter stringFromDate:date];
}

- (NSString *)getAppVersionNo {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

- (NSString*)getDeviceToken {
    return [[ASetting sharedInstance]getDeviceToken];
}

- (void)setDeviceToken:(NSString*)token {
    [[ASetting sharedInstance]setDeviceToken:token];
}

- (CAKeyframeAnimation*) objectMoveFrom:(CGPoint)fromPoint toPoint:(CGPoint)toPoint duration:(float)durTime{
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:fromPoint];
    [path addLineToPoint:toPoint];
    
    moveAnimation.path = path.CGPath;
    moveAnimation.duration = durTime;
    
    return moveAnimation;
}


- (CGSize)imageScalImage:(UIImage*)image andWidth:(CGFloat)fixedWidth {
    CGFloat scale = image.size.width / fixedWidth;
    CGFloat compressHeight = image.size.height / scale;
    CGSize newSize = CGSizeMake(fixedWidth, compressHeight);
    
    return newSize;
}

- (CGSize) scaleImage:(CGSize)imageSize reference:(float)theParm isWidth:(BOOL)isWidth {
    CGSize size;
    int parm = 0;
    
    if (isWidth) {
        parm = theParm*imageSize.height/imageSize.width;
        size = CGSizeMake(theParm, parm);
    } else {
        parm = theParm*imageSize.width/imageSize.height;
        size = CGSizeMake(parm, theParm);
    }
    
    return size;
}

- (BOOL)isLogined {
    AUserCookie *userCookie = [AUserCookie userCookie];
    if (userCookie != nil) return YES;
    
    return NO;
}

- (BOOL)isHadFamily {
    AUserCookie *userCookie = [AUserCookie userCookie];
    if (userCookie !=nil && userCookie.familyNo> 0) return YES;
    
    return NO;
}

- (BOOL)hadMineHome:(NSArray*)homeInfos {
    AUserCookie *userCookie = [AUserCookie userCookie];
    BOOL hadMineHome = NO;
    for (AHome *homeInfo in homeInfos) {
        for (AHomeMember *member in homeInfo.members) {
            int index = (int)[homeInfo.members indexOfObject:member];
            if (index > 1)break;
            if (member.uid == userCookie.serverId){
                hadMineHome = YES;
                break;
            }
        }
    }
    
    return hadMineHome;
}

- (BOOL)hadParentHome:(NSArray*)homeInfos {
    AUserCookie *userCookie = [AUserCookie userCookie];
    BOOL hadParentHome = NO;
    for (AHome *homeInfo in homeInfos) {
        for (AHomeMember *member in homeInfo.members) {
            int index = (int)[homeInfo.members indexOfObject:member];
            if (index <= 1)continue;
            if (member.uid == userCookie.serverId){
                hadParentHome = YES;
                break;
            }
        }
    }
    
    return hadParentHome;
}

- (UIImage *)compressImage:(UIImage *)image fixedWidth:(CGFloat)fixedWidth {
    @autoreleasepool {
        CGFloat scale = image.size.width / fixedWidth;
        CGFloat compressHeight = image.size.height / scale;
        CGSize newSize = CGSizeMake(fixedWidth, compressHeight);
        UIGraphicsBeginImageContext(newSize);
        [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    }
}

- (UIImage *)compressImage:(UIImage *)image fixedheight:(CGFloat)fixedHeight {
    @autoreleasepool {
        CGFloat scale = image.size.height / fixedHeight;
        CGFloat compressWidth = image.size.width / scale;
        CGSize newSize = CGSizeMake(compressWidth, fixedHeight);
        UIGraphicsBeginImageContext(newSize);
        [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    }
}

/*****************/
- (NSArray *)getProvincesDatas {
    return [[AServerFactory getServerInstance:@"ARegionServer"]selectAreaDataByLevel:1];
}

- (NSArray*)getCityDatas:(ASiWeiArea*)area {
    return [[AServerFactory getServerInstance:@"ARegionServer"]getAreaDataByRegionCode:area.regionCode];
}

- (NSArray*)getAreaDatas:(ASiWeiArea*)area {
    return [[AServerFactory getServerInstance:@"ARegionServer"]getAreaDataByRegionCode:area.regionCode];
}


- (float)homeTableHeaderHeight {
    float height = 200.f;
    
    if ([UIScreen mainScreen].bounds.size.height <= 480) { // iphone 4
        height = 120.f;
        
    } else if ([UIScreen mainScreen].bounds.size.height <= 568) { //iphone 5
        height = 150.f;
        
    } else if ([UIScreen mainScreen].bounds.size.height <= 667) { //iphone 6
        height = 180.f;
        
    } else if ([UIScreen mainScreen].bounds.size.height <= 736) { //iphone 6plus
        height = 200.f;
    }
    
    return height;
}

- (float)homeRadiusSize {
    float size = 50.f;
    
    if ([UIScreen mainScreen].bounds.size.height <= 480) { // iphone 4
        size = 40.;
        
    } else if ([UIScreen mainScreen].bounds.size.height <= 568) { //iphone 5
        size = 43.;
        
    } else if ([UIScreen mainScreen].bounds.size.height <= 667) { //iphone 6
        
    } else if ([UIScreen mainScreen].bounds.size.height <= 736) { //iphone 6plus
        
    }
    
    return size;
}

- (NSMutableDictionary*)homeMergeMemberSize {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:[NSNumber numberWithInt:80] forKey:@"min"];
    [dict setObject:[NSNumber numberWithInt:120] forKey:@"max"];
    
    if ([UIScreen mainScreen].bounds.size.height <= 480) { // iphone 4
        [dict setObject:[NSNumber numberWithInt:90] forKey:@"max"];
        
    } else if ([UIScreen mainScreen].bounds.size.height <= 568) { //iphone 5
        [dict setObject:[NSNumber numberWithInt:100] forKey:@"max"];
        
    } else if ([UIScreen mainScreen].bounds.size.height <= 667) { //iphone 6
        [dict setObject:[NSNumber numberWithInt:110] forKey:@"max"];
        
    } else if ([UIScreen mainScreen].bounds.size.height <= 736) { //iphone 6plus
        [dict setObject:[NSNumber numberWithInt:120] forKey:@"max"];
    }
    
    return dict;
}


/*****************/
- (void)dismiss {
    [_activityIndicator stopAnimating];
    [_activityIndicator removeFromSuperview];
}

- (void) popTarget:(UIView*)view {
    [view addSubview:_activityIndicator];
    [_activityIndicator setFrame:CGRectMake((view.frame.size.width)/2, (view.frame.size.height)/2, 40, 40)];
    [_activityIndicator startAnimating];
}

- (void) popTarget:(UIView*)view frame:(CGRect)frame {
    [view addSubview:_activityIndicator];
    [_activityIndicator setFrame:frame];
    [_activityIndicator startAnimating];
}


- (NSString*)roleImageByString:(NSString*)roleName {
    NSString *roleImage = @"";
    
    if ([roleName isEqualToString:@"家父"]) {
        roleImage = @"home_member_father.png";
        
    } else if ([roleName isEqualToString:@"家母"]) {
        roleImage = @"home_member_mother.png";
        
    } else if ([roleName isEqualToString:@"家子"]) {
        roleImage = @"home_member_sun.png";
        
    } else if ([roleName isEqualToString:@"家女"]) {
        roleImage = @"home_member_girl.png";
    }

    return roleImage;
}

- (CGPoint)pointByCircleAngleNoth:(float)angle adius:(float)adius center:(CGPoint)center {
    float radian = AngleToRadian(angle);
    float x = center.x + sinf(radian)*adius;
    float y = center.y - cosf(radian)*adius;
    CGPoint point = CGPointMake(x, y);
    
    return point;
}

- (CGPoint)pointByCircleAngleEast:(float)angle adius:(float)adius center:(CGPoint)center {
    float radian = AngleToRadian(angle);
    float x = center.x + cos(radian)*adius;
    float y = center.y + sin(radian)*adius;
    CGPoint point = CGPointMake(x, y);
    
    return point;
}

- (void)rotateView:(UIView *)view aroundPoint:(CGPoint)rotationPoint adius:(float)adius angle:(CGFloat)angle {
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.repeatCount = INFINITY;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation.duration = 500.;
    pathAnimation.delegate = view;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, view.center.x, view.center.y);
    CGPathAddArc(path, NULL, rotationPoint.x, rotationPoint.y,adius,(angle+0.00003f)*M_PI/180.0f,(angle)*M_PI/180.0f, NO);
    
    pathAnimation.path = path;
    CGPathRelease(path);
    
    [view.layer addAnimation:pathAnimation forKey:@"curve"];
}

- (CGFloat) pointPairToBearingDegrees:(CGPoint)startingPoint secondPoint:(CGPoint)endingPoint {
    CGPoint originPoint = CGPointMake(endingPoint.x - startingPoint.x, endingPoint.y - startingPoint.y);
    float bearingRadians = atan2f(originPoint.y, originPoint.x);
    float bearingDegrees = bearingRadians * (180.0 / M_PI);
    bearingDegrees = (bearingDegrees > 0.0 ? bearingDegrees : (360.0 + bearingDegrees));
    return bearingDegrees;
}

- (CGSize)itemSizeBySpaceSize:(float)space {
    float deviceWidth = [UIScreen mainScreen].bounds.size.width;
    int rowNum = 3.;
    float width = 0.;
    
    if (deviceWidth == 320) {
        rowNum = 2.;
        width = (deviceWidth - 2*space-(rowNum%2+1)*space)/rowNum;
        
    } else if (deviceWidth == 375) {
        width = (deviceWidth - 2*space-(rowNum%2+1)*space/2)/rowNum;
        
    } else if (deviceWidth == 414) {
        width = (deviceWidth - 2*space-(rowNum%2+1)*space/2.)/rowNum;
    }

    float height = width -.3*width;
    
    return CGSizeMake(width, height);
}

- (float)sizeLeftSideDrawer {
    float size = 110.;
    
    if ([UIScreen mainScreen].bounds.size.height <= 667) { //iphone 6
        size = 120.;
        
    } else if ([UIScreen mainScreen].bounds.size.height <= 736) { //iphone 6plus
        size = 130.;
    }
    
    return size;
}



@end
