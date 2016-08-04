//
//  AGuidScrollView.h
//  demoe
//
//  Created by andson-dile on 15/3/3.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGuidScrollView : UIScrollView {
    NSMutableArray *_pageViews;
}

- (UIView*)pageByIndex:(int)pageIndex;
- (void)intoPageByIndex:(int)pageIndex;

- (int)getAllPageNo;

@end
