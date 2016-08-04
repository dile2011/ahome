//
//  AProgressView.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-25.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AProgressView.h"

#define progress_view_height    1
#define progress_margin_top     33

#define progress_step_num       4

#define label_font_size         12
#define flagImage_size_width    10
#define flagImage_size_height   15

@implementation AProgressView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    CGRect rect = CGRectMake(0, progress_margin_top, frame.size.width, progress_view_height);
    _progressView = [[ASProgressPopUpView alloc]initWithFrame:rect];
    [_progressView setProgress:1./progress_step_num];
    UIColor *progressColor = [UIColor colorWithRed:238./255 green:85./255 blue:77./255 alpha:1.];
    _progressView.popUpViewAnimatedColors = @[progressColor, progressColor, progressColor];
    [_progressView hidePopUpViewAnimated:YES];
    [self addSubview:_progressView];
    
    //
    UILabel *accountLabel = [[UILabel alloc]init];
    accountLabel.tag = 111;
    [accountLabel setText:@"账户"];
    [accountLabel setFont:[UIFont boldSystemFontOfSize:label_font_size]];
    accountLabel.textAlignment = NSTextAlignmentCenter;
    [accountLabel setTextColor:[UIColor colorWithRed:238./255 green:85./255 blue:77./255 alpha:1.]];
    accountLabel.lineBreakMode = NSLineBreakByWordWrapping;
    accountLabel.numberOfLines = 1;
    [accountLabel setBackgroundColor:[UIColor clearColor]];
    CGSize titleSize = CGSizeMake(self.frame.size.width, 20000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:accountLabel.font, NSFontAttributeName,nil];
    titleSize =[accountLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    float x = (frame.size.width/progress_step_num-titleSize.width)/2;
    float y = _progressView.frame.size.height + _progressView.frame.origin.y+5;
    [accountLabel setFrame:CGRectMake(x, y, titleSize.width, titleSize.height)];
    [self addSubview:accountLabel];
    
    
    UIImageView *account_flagImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Register_unDone_mark.png"]];
    account_flagImage.tag = 1111;
    float imageX = (frame.size.width/progress_step_num-flagImage_size_width)/2;
    float imageY = 15;
    [account_flagImage setFrame:CGRectMake(imageX, imageY, flagImage_size_width, flagImage_size_height)];
    [self addSubview:account_flagImage];
    
    //
    UILabel *identityLabel = [[UILabel alloc]init];
    identityLabel.tag = 222;
    [identityLabel setText:@"身份"];
    [identityLabel setFont:[UIFont boldSystemFontOfSize:label_font_size]];
    identityLabel.textAlignment = NSTextAlignmentCenter;
    [identityLabel setTextColor:[UIColor lightGrayColor]];
    identityLabel.lineBreakMode = NSLineBreakByWordWrapping;
    identityLabel.numberOfLines = 1;
    [identityLabel setBackgroundColor:[UIColor clearColor]];
    titleSize = CGSizeMake(self.frame.size.width, 20000.0f);
    tdic = [NSDictionary dictionaryWithObjectsAndKeys:identityLabel.font, NSFontAttributeName,nil];
    titleSize =[identityLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    x = frame.size.width/progress_step_num +(frame.size.width/progress_step_num-titleSize.width)/2;
    y = _progressView.frame.size.height + _progressView.frame.origin.y+5;
    [identityLabel setFrame:CGRectMake(x, y, titleSize.width, titleSize.height)];
    [self addSubview:identityLabel];
    
    UIImageView *identity_flagImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Register_unDone_mark.png"]];
    identity_flagImage.tag = 2222;
    identity_flagImage.hidden = YES;
    imageX = frame.size.width/progress_step_num + (frame.size.width/progress_step_num-flagImage_size_width)/2;
    [identity_flagImage setFrame:CGRectMake(imageX, imageY, flagImage_size_width, flagImage_size_height)];
    [self addSubview:identity_flagImage];

    //
    UILabel *areaLabel = [[UILabel alloc]init];
    areaLabel.tag = 333;
    [areaLabel setText:@"地址"];
    [areaLabel setFont:[UIFont boldSystemFontOfSize:label_font_size]];
    areaLabel.textAlignment = NSTextAlignmentCenter;
    [areaLabel setTextColor:[UIColor lightGrayColor]];
    areaLabel.lineBreakMode = NSLineBreakByWordWrapping;
    areaLabel.numberOfLines = 1;
    [areaLabel setBackgroundColor:[UIColor clearColor]];
    titleSize = CGSizeMake(self.frame.size.width, 20000.0f);
    tdic = [NSDictionary dictionaryWithObjectsAndKeys:areaLabel.font, NSFontAttributeName,nil];
    titleSize =[areaLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    x = 2*frame.size.width/progress_step_num +(frame.size.width/progress_step_num-titleSize.width)/2;
    y = _progressView.frame.size.height + _progressView.frame.origin.y+5;
    [areaLabel setFrame:CGRectMake(x, y, titleSize.width, titleSize.height)];
    [self addSubview:areaLabel];
    
    
    UIImageView *area_flagImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Register_unDone_mark.png"]];
    area_flagImage.tag = 3333;
    area_flagImage.hidden = YES;
    imageX = 2*frame.size.width/progress_step_num + (frame.size.width/progress_step_num-flagImage_size_width)/2;
    [area_flagImage setFrame:CGRectMake(imageX, imageY, flagImage_size_width, flagImage_size_height)];
    [self addSubview:area_flagImage];
    
    //
    UILabel *finishLabel = [[UILabel alloc]init];
    finishLabel.tag = 444;
    [finishLabel setText:@"完成"];
    [finishLabel setFont:[UIFont boldSystemFontOfSize:label_font_size]];
    finishLabel.textAlignment = NSTextAlignmentCenter;
    [finishLabel setTextColor:[UIColor lightGrayColor]];
    finishLabel.lineBreakMode = NSLineBreakByWordWrapping;
    finishLabel.numberOfLines = 1;
    [finishLabel setBackgroundColor:[UIColor clearColor]];
    titleSize = CGSizeMake(self.frame.size.width, 20000.0f);
    tdic = [NSDictionary dictionaryWithObjectsAndKeys:finishLabel.font, NSFontAttributeName,nil];
    titleSize =[finishLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    x = 3*frame.size.width/progress_step_num +(frame.size.width/progress_step_num-titleSize.width)/2;
    y = _progressView.frame.size.height + _progressView.frame.origin.y+5;
    [finishLabel setFrame:CGRectMake(x, y, titleSize.width, titleSize.height)];
    [self addSubview:finishLabel];
    
    UIImageView *finish_flagImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Register_unDone_mark.png"]];
    finish_flagImage.tag = 4444;
    finish_flagImage.hidden = YES;
    imageX = 3*frame.size.width/progress_step_num + (frame.size.width/progress_step_num-flagImage_size_width)/2;
    [finish_flagImage setFrame:CGRectMake(imageX, imageY, flagImage_size_width, flagImage_size_height)];
    [self addSubview:finish_flagImage];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height-.3, self.frame.size.width, .3)];
    [lineLabel setBackgroundColor:[UIColor lightGrayColor]];
    lineLabel.alpha = .5;
    [self addSubview:lineLabel];
    
    return self;
}

- (void)nextStepByIndex:(int)progress {
    switch (progress) {
        case 0:
            break;
            
        case 1: {
            UILabel *identityLabel = (UILabel*)[self viewWithTag:222];
            [identityLabel setTextColor:[UIColor colorWithRed:238./255 green:85./255 blue:77./255 alpha:1.]];
            
            UIImageView *identity_imageView = (UIImageView*)[self viewWithTag:2222];
            identity_imageView.hidden = NO;
            
            [_progressView setProgress:2./progress_step_num];
            break;
        }
            
        case 2: {
            UILabel *areaLabel = (UILabel*)[self viewWithTag:333];
            [areaLabel setTextColor:[UIColor colorWithRed:238./255 green:85./255 blue:77./255 alpha:1.]];
            
            UIImageView *area_imageView = (UIImageView*)[self viewWithTag:3333];
            area_imageView.hidden = NO;
            
            [_progressView setProgress:3./progress_step_num];
            
            break;
        }
            
        case 3: {
            UILabel *finishLabel = (UILabel*)[self viewWithTag:444];
            [finishLabel setTextColor:[UIColor colorWithRed:238./255 green:85./255 blue:77./255 alpha:1.]];
            
            UIImageView *finish_imageView = (UIImageView*)[self viewWithTag:4444];
            finish_imageView.hidden = NO;
            
            [_progressView setProgress:4./progress_step_num];
            
            break;
        }
    
        default:
            break;
    }
}

@end
