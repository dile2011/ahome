//
//  APersonSecElementView.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-28.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "APersonSecElementView.h"
#import "ABlockView.h"

#define block_top_margin    5
#define block_width         70

@implementation APersonSecElementView

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string {
    self = [super initWithReuseIdentifier:string];
    float H = [APersonSecElementView heightForCell];
    
    float x = (self.frame.size.width/2.-block_width)/2.+40;
    CGRect rect = CGRectMake(x, block_top_margin, block_width, H-2*block_top_margin);
    ABlockView *sexManView = [[ABlockView alloc]initWithFrame:rect andText:@"女" andDelegate:self];
    sexManView.tag = 0;
    [self.contentView addSubview:sexManView];
    
    x = self.frame.size.width/2. + (self.frame.size.width/2.-block_width)/2.;
    rect = CGRectMake(x, block_top_margin, block_width, H-2*block_top_margin);
    ABlockView *sexWoManView = [[ABlockView alloc]initWithFrame:rect andText:@"男" andDelegate:self];;
    sexWoManView.tag = 1;
    [self.contentView addSubview:sexWoManView];
    
    return self;
}

- (void)blockClicked:(int)index {
    for (UIView *view in self.contentView.subviews) {
        if ([view isKindOfClass:[ABlockView class]]) {
            ABlockView *blockView = (ABlockView*)view;
            
            if(view.tag == index) { // 被选中的BlockView
                [blockView showStyleByBool:true];
                _sexValue = view.tag;
                
                continue;
            }
            
            // 未被选中的BlockView
            [blockView showStyleByBool:false];
            
        }
    }
}

@end
