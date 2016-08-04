//
//  ABlurMeshView.m
//  demoe
//
//  Created by andson-dile on 15/3/6.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "ABlurMeshView.h"

@implementation ABlurMeshView

- (instancetype)initWithFrame:(CGRect)frame {
    self  = [super initWithFrame:frame];
    
    return self;
}

- (void)setMesh:(ABlurMenu*)blurMenu {
    UIButton *btn = [self shareButtonWithIcon:blurMenu.menuImage andMenuTitle:blurMenu.title andColor:blurMenu.color];
    [btn addTarget:self action:@selector(menuClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    self.onSelected = blurMenu.onSelected;
}

- (void)menuClicked {
    _onSelected();
}

-(UIButton *)shareButtonWithIcon:(NSString *)iconName andMenuTitle:(NSString*)title andColor:(UIColor*)color {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    // Circle background
    UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    circle.backgroundColor = [UIColor clearColor];
    circle.layer.masksToBounds = YES;
    circle.opaque = NO;
    
    // Circle icon
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    CGRect f = CGRectMake(0, 0, circle.frame.size.width*.6, circle.frame.size.height*.6);
    f.origin.x = (circle.frame.size.width - f.size.width)*.6;
    f.origin.y = (circle.frame.size.height - f.size.height)*.6;
    icon.frame = f;
    icon.layer.cornerRadius = icon.frame.size.width/2.;
    [icon setBackgroundColor:color];
    [circle addSubview:icon];
    icon.contentMode =  UIViewContentModeCenter;
    
    UILabel *menuTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, circle.frame.size.width, circle.frame.size.height)];
    menuTitleLabel.text = title;
    [menuTitleLabel setFont:[UIFont systemFontOfSize:12]];
    menuTitleLabel.textAlignment = NSTextAlignmentCenter;
    [menuTitleLabel setTextColor:[UIColor whiteColor]];
    menuTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    menuTitleLabel.numberOfLines = 1;
    [menuTitleLabel setBackgroundColor:[UIColor clearColor]];
    //[circle addSubview:menuTitleLabel];
    
    [button setBackgroundImage:[self imageWithView:circle] forState:UIControlStateNormal];
    
    return button;
}

-(UIColor *)colorFromRGB:(int)rgb {
    return [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0];
}

-(UIImage *)imageWithView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
