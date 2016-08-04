//
//  ABlockView.m
//  AtHomeApp
//
//  Created by dilei liu on 14-10-1.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ABlockView.h"

@implementation ABlockView

- (id)initWithFrame:(CGRect)frame andText:(NSString*)text andDelegate:(id)delegate {
    self = [super initWithFrame:frame];
    self.delegate = delegate;
    _isSelected = NO;
    [self setBackgroundColor:[UIColor colorWithRed:249./255 green:249./255 blue:249./255 alpha:1.0]];
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = .5;
    
    UILabel *textLable = [[UILabel alloc]init];
    [self addSubview:textLable];
    
    [textLable setText:text];
    [textLable setFont:[UIFont systemFontOfSize:17]];
    textLable.textAlignment = NSTextAlignmentCenter;
    [textLable setTextColor:[UIColor lightGrayColor]];
    textLable.lineBreakMode = NSLineBreakByWordWrapping;
    textLable.numberOfLines = 1;
    [textLable setBackgroundColor:[UIColor clearColor]];
    CGSize titleSize = CGSizeMake(self.frame.size.width, 20000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:textLable.font, NSFontAttributeName,nil];
    titleSize =[textLable.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    [textLable setFrame:CGRectMake((self.frame.size.width-titleSize.width)/2., (self.frame.size.height-titleSize.height)/2., titleSize.width, titleSize.height)];
    
    
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
    tapGesture.numberOfTapsRequired=1;
    [self addGestureRecognizer:tapGesture];
    
    return self;
}

- (void)showStyleByBool:(BOOL)boolean {
    if (boolean) {
        [self setBackgroundColor:[UIColor colorWithRed:253./255 green:121./255. blue:36./255. alpha:1.0]];
        UILabel *textLabel = [self.subviews firstObject];
        [textLabel setTextColor:[UIColor whiteColor]];
        
        return;
    }
    
    UILabel *textLabel = [self.subviews firstObject];
    [self setBackgroundColor:[UIColor colorWithRed:249./255 green:249./255 blue:249./255 alpha:1.0]];
    [textLabel setTextColor:[UIColor lightGrayColor]];
}

-(void)handleTapGesture:(UIGestureRecognizer*)sender{
    if (_isSelected) return;
    [self.delegate blockClicked:(int)self.tag];
}

@end
