//
//  AWarningNotifiView.m
//  demoe
//
//  Created by andson-dile on 15/3/24.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "AWarningNotifiView.h"

#define margin_left_size    10
#define margin_bottom_size  10

@implementation AWarningNotifiView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor colorWithRed:253/255. green:32/255. blue:37/255. alpha:1.]];
    
    _flageImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"notification_finish.png"]];
    [_flageImageView setFrame:CGRectMake(margin_left_size, self.frame.size.height-_flageImageView.image.size.height*3/4-margin_bottom_size, _flageImageView.image.size.width*3/4, _flageImageView.image.size.height*3/4)];
    [self addSubview:_flageImageView];
    
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

- (void)setinfo:(NSString *)info {
    [_infoLabel setText:info];
    CGSize titleSize = CGSizeMake(200, 20000.0f);
    NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:_infoLabel.font, NSFontAttributeName,nil];
    titleSize =[_infoLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_infoLabel setFrame:CGRectMake(_flageImageView.frame.origin.x+_flageImageView.frame.size.width+10, self.frame.size.height-margin_bottom_size-titleSize.height-(_flageImageView.frame.size.height-titleSize.height)/2., titleSize.width, titleSize.height)];
}

@end
