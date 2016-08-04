//
//  ARequestNotifiView.m
//  demoe
//
//  Created by andson-dile on 15/3/30.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "ARequestNotifiView.h"

#define margin_left_size    10
#define margin_bottom_size  10

#define activity_size       25

@implementation ARequestNotifiView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor colorWithRed:46./255. green:185./255. blue:104./255. alpha:1.]];
    
    _activityView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(margin_left_size,self.frame.size.height-activity_size-10, activity_size, activity_size)];
    [self addSubview:_activityView];
    
    _infoLabel = [[UILabel alloc]init];
    [_infoLabel setFont:[UIFont fontWithName:@"Heiti SC" size:14]]; // Heiti SC
    _infoLabel.textAlignment = NSTextAlignmentLeft;
    [_infoLabel setTextColor:[UIColor whiteColor]];
    _infoLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _infoLabel.numberOfLines = 1;
    [_infoLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_infoLabel];
    
    return self;
}

- (void)updateInfo:(NSString *)info {
    [_infoLabel setText:info];
    [self hiddenOffset];
    
    CGSize titleSize = CGSizeMake(200, 20000.0f);
    NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:_infoLabel.font, NSFontAttributeName,nil];
    titleSize =[_infoLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_infoLabel setFrame:CGRectMake(margin_left_size, self.frame.size.height-margin_bottom_size-titleSize.height-(_activityView.frame.size.height-titleSize.height)/2., titleSize.width, titleSize.height)];
}

- (void)setinfo:(NSString *)info {
    [_activityView startAnimating];
    [_infoLabel setText:info];
    
    CGSize titleSize = CGSizeMake(200, 20000.0f);
    NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:_infoLabel.font, NSFontAttributeName,nil];
    titleSize =[_infoLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_infoLabel setFrame:CGRectMake(_activityView.frame.origin.x+_activityView.frame.size.width+10, self.frame.size.height-margin_bottom_size-titleSize.height-(_activityView.frame.size.height-titleSize.height)/2., titleSize.width, titleSize.height)];
}

- (void)hiddenOffset {
    [_activityView stopAnimating];
}


@end
