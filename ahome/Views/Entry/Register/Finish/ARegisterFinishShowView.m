//
//  ARegisterFinishShowView.m
//  Ahome
//
//  Created by dilei liu on 14/11/28.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ARegisterFinishShowView.h"

@implementation ARegisterFinishShowView

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string {
    self = [super initWithReuseIdentifier:string];
    self.isShowSeparator = NO;
    float H = [ARegisterFinishShowView heightForCell];
    
    UILabel *textLable = [[UILabel alloc]init];
    [self addSubview:textLable];
    [textLable setText:@"恭喜您注册成功,赶紧去体验吧 :)"];
    [textLable setFont:[UIFont systemFontOfSize:17]];
    textLable.textAlignment = NSTextAlignmentCenter;
    [textLable setTextColor:[UIColor colorWithRed:99./255 green:162./255. blue:146./255 alpha:1.0]];
    textLable.lineBreakMode = NSLineBreakByWordWrapping;
    textLable.numberOfLines = 1;
    [textLable setBackgroundColor:[UIColor clearColor]];
    CGSize titleSize = CGSizeMake(self.frame.size.width, 20000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:textLable.font, NSFontAttributeName,nil];
    titleSize =[textLable.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    [textLable setFrame:CGRectMake((self.frame.size.width-titleSize.width)/2., (H-titleSize.height)/2., titleSize.width, titleSize.height)];
    
    
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

+ (float)heightForCell {
    return 30;
}


@end
