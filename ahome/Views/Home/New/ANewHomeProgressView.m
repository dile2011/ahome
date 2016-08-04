//
//  ANewHomeProgressView.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-31.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANewHomeProgressView.h"

#define progress_view_height    1
#define progress_margin_top     30
#define label_font_size         12
#define flagImage_size_width    8
#define flagImage_size_height   8

#define progress_step_num       4


@implementation ANewHomeProgressView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height-.3, self.frame.size.width, .3)];
    [lineLabel setBackgroundColor:[UIColor colorWithRed:171./255 green:165./255 blue:159./255 alpha:.7]];
    [self addSubview:lineLabel];
    
    UILabel *progressView = [[UILabel alloc]initWithFrame:CGRectMake(0, progress_margin_top, frame.size.width, progress_view_height)];
    [progressView setBackgroundColor:[UIColor colorWithRed:171./255 green:165./255 blue:159./255 alpha:.4]];
    [self addSubview:progressView];
    
    //
    UILabel *baseLabel = [[UILabel alloc]init];
    baseLabel.tag = 111;
    [baseLabel setText:@"基本信息"];
    [baseLabel setFont:[UIFont boldSystemFontOfSize:label_font_size]];
    baseLabel.textAlignment = NSTextAlignmentCenter;
    [baseLabel setTextColor:[UIColor colorWithRed:238./255 green:85./255 blue:77./255 alpha:1.]];
    baseLabel.lineBreakMode = NSLineBreakByWordWrapping;
    baseLabel.numberOfLines = 1;
    [baseLabel setBackgroundColor:[UIColor clearColor]];
    CGSize titleSize = CGSizeMake(self.frame.size.width, 20000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:baseLabel.font, NSFontAttributeName,nil];
    titleSize =[baseLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    float x = (frame.size.width/progress_step_num-titleSize.width)/2;
    float y = progressView.frame.size.height + progressView.frame.origin.y+8;
    [baseLabel setFrame:CGRectMake(x, y, titleSize.width, titleSize.height)];
    [self addSubview:baseLabel];
    
    
    UIImageView *base_flagImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"NewAtHome_Done_Mark.png"]];
    base_flagImage.tag = 1111;
    float imageX = (frame.size.width/progress_step_num-flagImage_size_width)/2;
    float imageY = 26;
    [base_flagImage setFrame:CGRectMake(imageX, imageY, flagImage_size_width, flagImage_size_height)];
    [self addSubview:base_flagImage];
    
    //
    UILabel *areaLabel = [[UILabel alloc]init];
    areaLabel.tag = 222;
    [areaLabel setText:@"家庭地址"];
    [areaLabel setFont:[UIFont boldSystemFontOfSize:label_font_size]];
    areaLabel.textAlignment = NSTextAlignmentCenter;
    [areaLabel setTextColor:[UIColor lightGrayColor]];
    areaLabel.lineBreakMode = NSLineBreakByWordWrapping;
    areaLabel.numberOfLines = 1;
    [areaLabel setBackgroundColor:[UIColor clearColor]];
    titleSize = CGSizeMake(self.frame.size.width, 20000.0f);
    tdic = [NSDictionary dictionaryWithObjectsAndKeys:areaLabel.font, NSFontAttributeName,nil];
    titleSize =[areaLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    x = frame.size.width/progress_step_num +(frame.size.width/progress_step_num-titleSize.width)/2;
    y = progressView.frame.size.height + progressView.frame.origin.y+8;
    [areaLabel setFrame:CGRectMake(x, y, titleSize.width, titleSize.height)];
    [self addSubview:areaLabel];
    
    UIImageView *area_flagImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"NewAtHome_UnDone_Mark.png"]];
    area_flagImage.tag = 2222;
    imageX = frame.size.width/progress_step_num + (frame.size.width/progress_step_num-flagImage_size_width)/2;
    [area_flagImage setFrame:CGRectMake(imageX, imageY, flagImage_size_width, flagImage_size_height)];
    [self addSubview:area_flagImage];
    
    //
    UILabel *inviteLabel = [[UILabel alloc]init];
    inviteLabel.tag = 333;
    [inviteLabel setText:@"添加成员"];
    [inviteLabel setFont:[UIFont boldSystemFontOfSize:label_font_size]];
    inviteLabel.textAlignment = NSTextAlignmentCenter;
    [inviteLabel setTextColor:[UIColor lightGrayColor]];
    inviteLabel.lineBreakMode = NSLineBreakByWordWrapping;
    inviteLabel.numberOfLines = 1;
    [inviteLabel setBackgroundColor:[UIColor clearColor]];
    titleSize = CGSizeMake(self.frame.size.width, 20000.0f);
    tdic = [NSDictionary dictionaryWithObjectsAndKeys:inviteLabel.font, NSFontAttributeName,nil];
    titleSize =[inviteLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    x = 2*frame.size.width/progress_step_num +(frame.size.width/progress_step_num-titleSize.width)/2;
    y = progressView.frame.size.height + progressView.frame.origin.y+8;
    [inviteLabel setFrame:CGRectMake(x, y, titleSize.width, titleSize.height)];
    [self addSubview:inviteLabel];
    
    
    UIImageView *invite_flagImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"NewAtHome_UnDone_Mark.png"]];
    invite_flagImage.tag = 3333;
    imageX = 2*frame.size.width/progress_step_num + (frame.size.width/progress_step_num-flagImage_size_width)/2;
    [invite_flagImage setFrame:CGRectMake(imageX, imageY, flagImage_size_width, flagImage_size_height)];
    [self addSubview:invite_flagImage];
    
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
    y = progressView.frame.size.height + progressView.frame.origin.y+8;
    [finishLabel setFrame:CGRectMake(x, y, titleSize.width, titleSize.height)];
    [self addSubview:finishLabel];
    
    UIImageView *finish_flagImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"NewAtHome_UnDone_Mark.png"]];
    finish_flagImage.tag = 4444;
    imageX = 3*frame.size.width/progress_step_num + (frame.size.width/progress_step_num-flagImage_size_width)/2;
    [finish_flagImage setFrame:CGRectMake(imageX, imageY, flagImage_size_width, flagImage_size_height)];
    [self addSubview:finish_flagImage];
    
    return self;
}

- (void)nextStepByIndex:(int)progress {
    switch (progress) {
        case 0:
            break;
            
        case 1: {
            UILabel *areaLabel = (UILabel*)[self viewWithTag:222];
            [areaLabel setTextColor:[UIColor colorWithRed:238./255 green:85./255 blue:77./255 alpha:1.]];
            
            UIImageView *area_imageView = (UIImageView*)[self viewWithTag:2222];
            [area_imageView setImage:[UIImage imageNamed:@"NewAtHome_Done_Mark.png"]];
        
            break;
        }
            
        case 2: {
            UILabel *inviteLabel = (UILabel*)[self viewWithTag:333];
            [inviteLabel setTextColor:[UIColor colorWithRed:238./255 green:85./255 blue:77./255 alpha:1.]];
            
            UIImageView *invite_imageView = (UIImageView*)[self viewWithTag:3333];
            [invite_imageView setImage:[UIImage imageNamed:@"NewAtHome_Done_Mark.png"]];
            
            break;
        }
            
        case 3: {
            UILabel *finishLabel = (UILabel*)[self viewWithTag:444];
            [finishLabel setTextColor:[UIColor colorWithRed:238./255 green:85./255 blue:77./255 alpha:1.]];
            
            UIImageView *finish_imageView = (UIImageView*)[self viewWithTag:4444];
            [finish_imageView setImage:[UIImage imageNamed:@"NewAtHome_Done_Mark.png"]];
            
            break;
        }
            
        default:
            break;
    }
}

@end
