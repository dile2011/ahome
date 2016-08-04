//
//  ATodayDynamicViewCell.m
//  ahome
//
//  Created by andson-dile on 15/8/4.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ATodayDynamicViewCell.h"

#define dynamic_size            40
#define dynamic_num             5
#define margin_space_size       5

@implementation ATodayDynamicViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    UIView *dynamicView = [[UIView alloc]initWithFrame:CGRectMake(15, 0., SCREEN_WIDTH-2*15, dynamic_size)];
    dynamicView.tag = 1;
    [self addSubview:dynamicView];
    
    for (int i=0; i<dynamic_num;i++) {
        UIView *blockView = [[UIView alloc]init];
        float x = (i)*margin_space_size+i*(dynamic_size);
        [blockView setFrame:CGRectMake(x, 0, dynamic_size, dynamic_size)];
        [dynamicView addSubview:blockView];
        
        UIButton *dynamicBtn = [self dynamicButtonWithIcon:[NSString stringWithFormat:@"dynamic_op_%i",i+1] andColor:[UIColor colorWithRed:0. green:0. blue:0. alpha:.3] andBlockSize:CGSizeMake(blockView.frame.size.width, blockView.frame.size.height)];
        dynamicBtn.tag = i;
        [blockView addSubview:dynamicBtn];
        dynamicBtn.enabled = NO;
    }
    
    return self;
}

+ (float)heightForCell {
    return 65.;
}


- (void)setDataForCell:(id)member {
    UIView *view = [self viewWithTag:1];
    
    UIView *blockView = [view.subviews objectAtIndex:0];
    UIButton *dynamicBtn = (UIButton*)[blockView.subviews firstObject];
    dynamicBtn.enabled = YES;
    
    NSString *imageName = [NSString stringWithFormat:@"dynamic_op_%i.png",1];
    UIImage *btnImage = [self getBtnBackgroundImage:imageName andColor:[UIColor colorWithRed:29./255. green:130./255. blue:202./255. alpha:1.] andBlockSize:blockView.frame.size];
    [dynamicBtn setBackgroundImage:btnImage forState:UIControlStateNormal];
    [dynamicBtn addTarget:self.attributeDelegate action:@selector(lookDynamicAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *blockView1 = [view.subviews objectAtIndex:1];
    UIButton *dynamicBtn1 = (UIButton*)[blockView1.subviews firstObject];
    dynamicBtn1.enabled = YES;
    
    imageName = [NSString stringWithFormat:@"dynamic_op_%i.png",2];
    btnImage = [self getBtnBackgroundImage:imageName andColor:[UIColor colorWithRed:29./255. green:130./255. blue:202./255. alpha:1.] andBlockSize:blockView.frame.size];
    [dynamicBtn1 setBackgroundImage:btnImage forState:UIControlStateNormal];
    [dynamicBtn1 addTarget:self.attributeDelegate action:@selector(lookDynamicAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(UIButton *)dynamicButtonWithIcon:(NSString *)iconName andColor:(UIColor*)color andBlockSize:(CGSize)blockSize {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, dynamic_size, dynamic_size);
    UIImage *btnImage = [self getBtnBackgroundImage:iconName andColor:color andBlockSize:blockSize];
    [button setBackgroundImage:btnImage forState:UIControlStateNormal];
    return button;
}

- (UIImage*)getBtnBackgroundImage:(NSString *)iconName andColor:(UIColor*)color andBlockSize:(CGSize)blockSize {
    UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, blockSize.width, blockSize.height)];
    circle.backgroundColor = [UIColor clearColor];
    circle.layer.masksToBounds = YES;
    circle.opaque = NO;
    
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    CGRect f = CGRectMake(0, 0, circle.frame.size.width, circle.frame.size.height);
    f.origin.x = (circle.frame.size.width - f.size.width);
    f.origin.y = (circle.frame.size.height - f.size.height);
    icon.frame = f;
    icon.layer.cornerRadius = icon.frame.size.width/2.;
    [icon setBackgroundColor:color];
    [circle addSubview:icon];
    icon.contentMode =  UIViewContentModeCenter;
    
    UIImage *image = [self imageWithView:circle];
    return image;
}


-(UIImage *)imageWithView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)lookDynamicAction {}


@end
