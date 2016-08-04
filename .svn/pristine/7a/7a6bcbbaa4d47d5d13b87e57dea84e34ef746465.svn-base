//
//  APullRefreshView.m
//  demoe
//
//  Created by andson-dile on 15/3/19.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "APullRefreshView.h"

#define margin_label_image  10.
#define size_image_refresh  30

@implementation APullRefreshView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor colorWithRed:20./255.0 green:136.0/255 blue:188.0/255. alpha:1.]];
    
    UIImage *refreshImage = [UIImage imageNamed:@"sun_00000.png"];
    _refreshImageView = [[UIImageView alloc]initWithImage:refreshImage];
    [self addSubview:_refreshImageView];
    
    _descRefreshLabel = [[UILabel alloc]init];
    _descRefreshLabel.text = @"下拉刷新";
    [_descRefreshLabel setFont:[UIFont systemFontOfSize:14]];
    _descRefreshLabel.textAlignment = NSTextAlignmentLeft;
    [_descRefreshLabel setTextColor:[UIColor whiteColor]];
    _descRefreshLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _descRefreshLabel.numberOfLines = 1;
    [_descRefreshLabel setBackgroundColor:[UIColor clearColor]];
    CGSize titleSize = CGSizeMake(200, 20000.0f);
    NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:_descRefreshLabel.font,NSFontAttributeName,nil];
    titleSize =[_descRefreshLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [self addSubview:_descRefreshLabel];
    
    
    float W = size_image_refresh+margin_label_image+titleSize.width;
    
    
    _refreshImageView.frame = CGRectMake((self.frame.size.width-W)/2., (self.frame.size.height-size_image_refresh)/2., size_image_refresh, size_image_refresh);
    [_descRefreshLabel setFrame:CGRectMake(_refreshImageView.frame.origin.x+_refreshImageView.frame.size.width+margin_label_image, (self.frame.size.height-titleSize.height)/2., titleSize.width, titleSize.height)];
    
    return self;
}

- (void)drawLoadImage:(int)index {
    UIImage *image = [_drawImages objectAtIndex:index];
    _refreshImageView.image = image;
    
    if (index == _drawImages.count-1) {
        _descRefreshLabel.text = @"松手即可";
    } else {
        _descRefreshLabel.text = @"下拉刷新";
    }
}

- (void)startAnimationLoad {
    _refreshImageView.animationImages = _loadImages;
    _refreshImageView.animationDuration = (CGFloat)_loadImages.count/20.0;
    [_refreshImageView startAnimating];
    
    _descRefreshLabel.text = @"正在刷新";
}

- (void)endAnimationLoad {
    [_refreshImageView stopAnimating];
    [_descRefreshLabel setText:@"完成刷新"];
}

- (void)resetRefreshLabel {
    [_descRefreshLabel setText:@"下拉刷新"];
}

- (void)workBreakIn {
    _refreshImageView.alpha = .0;
    _refreshImageView.image = nil;
}

@end
