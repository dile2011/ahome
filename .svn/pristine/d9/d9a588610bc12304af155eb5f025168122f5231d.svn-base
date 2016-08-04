//
//  ANewAtHomeImageElementView.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-31.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANewHomeImageElementView.h"
#import "ANewHomeBaseInfoController.h"

#define uppoint_size_width  15
#define uppoint_size_height 15
#define label_font_size     14

@implementation ANewHomeImageElementView

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string {
    self = [super initWithReuseIdentifier:string];
    float H = [ANewHomeImageElementView heightForCell];
    
    UIImageView *upImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, [UIScreen mainScreen].bounds.size.width-2*10, H-10)];
    [upImageView setImage:[UIImage imageNamed:@"NewAtHome_Base_upImage.png"]];
    upImageView.userInteractionEnabled = YES;
    [self.contentView addSubview:upImageView];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doUpHomeImage)];
    [upImageView addGestureRecognizer:recognizer];
    
    UILabel *upDescLabel = [[UILabel alloc]init];
    upDescLabel.tag = 444;
    [upDescLabel setText:@"上传家庭全家福"];
    [upDescLabel setFont:[UIFont boldSystemFontOfSize:label_font_size]];
    upDescLabel.textAlignment = NSTextAlignmentCenter;
    [upDescLabel setTextColor:[UIColor lightGrayColor]];
    upDescLabel.lineBreakMode = NSLineBreakByWordWrapping;
    upDescLabel.numberOfLines = 1;
    [upDescLabel setBackgroundColor:[UIColor clearColor]];
    CGSize titleSize = CGSizeMake(self.frame.size.width, 20000.0f);
    NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:upDescLabel.font, NSFontAttributeName,nil];
    titleSize =[upDescLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    float x = (upImageView.frame.size.width - titleSize.width)/2.+uppoint_size_width;
    float y = (upImageView.frame.size.height - titleSize.height)/2.;
    [upDescLabel setFrame:CGRectMake(x, y, titleSize.width, titleSize.height)];
    [upImageView addSubview:upDescLabel];
    
    UIImageView *upPointView = [[UIImageView alloc]initWithFrame:CGRectMake((upImageView.frame.size.width-titleSize.width)/2-5, (upImageView.frame.size.height-uppoint_size_height)/2, uppoint_size_width, uppoint_size_height)];
    [upPointView setImage:[UIImage imageNamed:@"NewAtHome_Base_upButton.png"]];
    [upImageView addSubview:upPointView];

    CALayer *separator = [CALayer layer];
    UIColor *bcolor = [UIColor colorWithRed:249./255. green:249./255. blue:249./255. alpha:1.0];
    separator.backgroundColor = bcolor.CGColor;
    separator.frame = CGRectMake(0, H-1, self.frame.size.width, 1);
    [self.layer addSublayer:separator];
    
    separator = [CALayer layer];
    separator.backgroundColor = bcolor.CGColor;
    separator.frame = CGRectMake(0, 0, self.frame.size.width, 1);
    [self.layer addSublayer:separator];
    
    return self;
}

- (void)setHomeImage:(UIImage*)image {
    UIImageView *imageview = [self.contentView.subviews firstObject];
    imageview.contentMode = UIViewContentModeScaleAspectFill;
    imageview.clipsToBounds = YES;
    imageview.image = image;
    
    for (UIView *view in imageview.subviews) {
        [view removeFromSuperview];
    }
}

- (void)doUpHomeImage {
    ANewHomeBaseInfoController *baseInfoCon = (ANewHomeBaseInfoController*)self.qControllerDelegate;
    [baseInfoCon doUpHomeImage];
}

+ (float)heightForCell {
    return 200;
}


@end
