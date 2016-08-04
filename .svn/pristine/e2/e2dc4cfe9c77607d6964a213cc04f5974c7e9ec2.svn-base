//
//  AHomeHeaderView.m
//  ahome
//
//  Created by andson-dile on 15/6/19.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHomeHeaderView.h"
#import "AHomeHeader.h"

@implementation AHomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame andModels:(NSArray *)models {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    self.selecteds = [NSMutableArray array];
    
    float w = frame.size.width/models.count;
    float h = frame.size.height;
    
    for (int i=0;i<models.count;i++) {
        UIView *modelView = [[UIView alloc]initWithFrame:CGRectMake(i*w, 0, w, h)];
        modelView.tag = i+1;
        [self addSubview:modelView];
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(i*w-.1, 10, .1, frame.size.height-20)];
        [line setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:line];
    }
    
    for (AHomeHeader *header in models) {
        [self.selecteds addObject:header.onSelected];
        
        int index = (int)[models indexOfObject:header];
        UIView *view = [self viewWithTag:index+1];
        
        CGRect rect = CGRectMake(10, 5, view.frame.size.width-20, view.frame.size.height-10);
        UIView *headerView = [self modelViewByHeader:header rect:rect andIndex:index];
        [view addSubview:headerView];
    }
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height-.1, frame.size.width, .1)];
    [line setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:line];
    
    return self;
}

- (UIView*)modelViewByHeader:(AHomeHeader*)header rect:(CGRect)rect andIndex:(int)index{

    UIButton *btn = [self shareButtonWithIcon:header.imageName andMenuTitle:header.title andRect:rect];
    [btn addTarget:self action:@selector(headerClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = index;

    return btn;
}

- (void)headerClicked:(id)sender {
    UIButton *btn = (UIButton*)sender;
    id onSelect = [self.selecteds objectAtIndex:btn.tag];;
    ((void(^)(void))onSelect)();
}


-(UIButton *)shareButtonWithIcon:(NSString *)iconName andMenuTitle:(NSString*)title andRect:(CGRect)rect {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = rect;
    
    // back View
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, button.frame.size.width, button.frame.size.height)];
    backView.backgroundColor = [UIColor clearColor];
    backView.layer.masksToBounds = YES;
    backView.opaque = NO;
    
    
    if (iconName.length > 0) {
        // image View
        UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
        icon.contentMode =  UIViewContentModeCenter;
        [backView addSubview:icon];
        
        // title View
        UILabel *menuTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, backView.frame.size.width, backView.frame.size.height)];
        menuTitleLabel.text = title;
        [menuTitleLabel setFont:[UIFont systemFontOfSize:12]];
        menuTitleLabel.textAlignment = NSTextAlignmentLeft;
        [menuTitleLabel setTextColor:[UIColor whiteColor]];
        menuTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        menuTitleLabel.numberOfLines = 1;
        [menuTitleLabel setBackgroundColor:[UIColor clearColor]];
        [backView addSubview:menuTitleLabel];
        
        CGSize titleSize = CGSizeMake(backView.frame.size.width, backView.frame.size.height);
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:menuTitleLabel.font, NSFontAttributeName,nil];
        titleSize =[menuTitleLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
        
        float W = icon.image.size.width + 10 + titleSize.width;
        float H = icon.image.size.height;
        
        float x = (backView.frame.size.width - W)/2.;
        float y = (backView.frame.size.height - H)/2.;
        
        icon.frame = CGRectMake(x, y, icon.frame.size.width, icon.frame.size.height);
        
        x += 10+icon.frame.size.width;
        y = (backView.frame.size.height - titleSize.height)/2.;
        menuTitleLabel.frame = CGRectMake(x, y, titleSize.width, titleSize.height);
    } else {
        // title View
        UILabel *menuTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, backView.frame.size.width, backView.frame.size.height)];
        menuTitleLabel.text = title;
        [menuTitleLabel setFont:[UIFont boldSystemFontOfSize:14]];
        menuTitleLabel.textAlignment = NSTextAlignmentLeft;
        [menuTitleLabel setTextColor:[UIColor whiteColor]];
        menuTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        menuTitleLabel.numberOfLines = 1;
        [menuTitleLabel setBackgroundColor:[UIColor clearColor]];
        [backView addSubview:menuTitleLabel];
        
        CGSize titleSize = CGSizeMake(backView.frame.size.width, backView.frame.size.height);
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:menuTitleLabel.font, NSFontAttributeName,nil];
        titleSize =[menuTitleLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
        
        float x = (backView.frame.size.width - titleSize.width)/2.;
        float y = (backView.frame.size.height - titleSize.height)/2.;
        menuTitleLabel.frame = CGRectMake(x, y, titleSize.width, titleSize.height);
    }

    [button setBackgroundImage:[self imageWithView:backView] forState:UIControlStateNormal];
    
    return button;
}

-(UIImage *)imageWithView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}



@end
