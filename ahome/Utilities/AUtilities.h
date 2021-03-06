//
//  AUtilities.h
//  AtHomeApp
//
//  Created by dilei liu on 14-8-23.
//  Copyright (c) 2014年 ushome. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "HZActivityIndicatorView.h"
#import "ASiWeiArea.h"

#define IsIOS7 [[UIDevice currentDevice].systemVersion floatValue] >= 7
#define isIphone5 fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)568) < DBL_EPSILON;

#define PhoneRegex @"^1[3|4|5|8]\\d{9}$"
#define PwdRegex @"^\\S{6,16}$"
#define EmailRegex @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
@interface AUtilities : NSObject {
    
}

@property (nonatomic,retain) HZActivityIndicatorView *activityIndicator;

@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic, retain) NSDateFormatter *longFormatter;
@property (nonatomic, retain) NSDateFormatter *dateParserFormatter;
@property (nonatomic, retain) NSDateFormatter *hzdateParserFormatter;

+ (AUtilities *)sharedInstance;

/**
 * 日期处理
 */
- (NSString*) formatDateAsOriginal:(NSDate*)date;
- (NSString*) formatDate:(NSDate*)date;
- (NSString*) simpleFormatDate:(NSDate *)date;
- (NSString*) formatDateFromString:(NSString *)dateStr;
- (NSString*) prettyTime:(NSDate *)date;
- (NSString*) prettyTimeFromString:(NSString *)dateStr;
- (NSString*) prettyTimeFromString:(NSString *)dateStr longFormat:(BOOL)longFormat;
- (NSDate*) dateParserFromString:(NSString*)dateStr;
- (NSDate*) dateLongFromString:(NSString*)dateStr;
- (NSDate*) dateSimplyFromString:(NSString*)dateStr;
- (NSString*) stringFromDate:(NSDate*)date;
- (NSString*) stringLongFromDate:(NSDate *)date;
- (NSString*) stringHzFromDate:(NSDate*)date;

/**
 * 获取App版本号
 */
- (NSString*)getAppVersionNo;
- (NSString*)getDeviceToken;
- (void)setDeviceToken:(NSString*)token;

/**
 * 直接动画
 */
- (CAKeyframeAnimation*)objectMoveFrom:(CGPoint)fromPoint toPoint:(CGPoint)toPoint duration:(float)durTime;

/**
 * 图片按宽度比例缩放
 */
- (UIImage *)compressImage:(UIImage *)image fixedWidth:(CGFloat)fixedWidth;
- (UIImage *)compressImage:(UIImage *)image fixedheight:(CGFloat)fixedHeight;
- (CGSize)imageScalImage:(UIImage*)image andWidth:(CGFloat)fixedWidth;
- (CGSize) scaleImage:(CGSize)imageSize reference:(float)theParm isWidth:(BOOL)isWidth;

/**
 * 是否已经登录
 */
- (BOOL)isLogined;

/**
 * 当前用户是否有家庭
 */
- (BOOL)isHadFamily;
- (BOOL)hadMineHome:(NSArray*)homeInfos;
- (BOOL)hadParentHome:(NSArray*)homeInfos;

/**
 * 获取地区数据
 */
- (NSArray *)getProvincesDatas;
- (NSArray*)getCityDatas:(ASiWeiArea*)area;
- (NSArray*)getAreaDatas:(ASiWeiArea*)area;

/**
 * Home界面适配
 */
- (float)homeTableHeaderHeight;
- (float)homeRadiusSize;
- (NSMutableDictionary*)homeMergeMemberSize;

/**
 * 加载动画封装逻辑
 */
- (void)dismiss;
- (void) popTarget:(UIView*)view;
- (void) popTarget:(UIView*)view frame:(CGRect)frame;


- (NSString*)roleImageByString:(NSString*)roleName;

/**
 * 以正北面为0度起点计算指定角度所对应的圆周上的点的坐标
 */
- (CGPoint)pointByCircleAngleNoth:(float)angle adius:(float)adius center:(CGPoint)center;

/**
 * 以正东面为0度起点计算指定角度所对应的圆周上的点的坐标
 */
- (CGPoint)pointByCircleAngleEast:(float)angle adius:(float)adius center:(CGPoint)center;

/**
 * 圆周动画
 */
- (void)rotateView:(UIView *)view aroundPoint:(CGPoint)rotationPoint adius:(float)adius angle:(CGFloat)angle;
- (CGFloat) pointPairToBearingDegrees:(CGPoint)startingPoint secondPoint:(CGPoint)endingPoint;

/**
 * 家庭UICollectionViewCell大小适配
 */
- (CGSize)itemSizeBySpaceSize:(float)space;

- (float)sizeLeftSideDrawer;

@end
