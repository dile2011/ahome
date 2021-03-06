//
//  AUnAtHomeController.m
//  AtHomeApp
//
//  Created by dilei liu on 14-8-30.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AUnAtHomeController.h"
#import "AHomeLevelController.h"

#define tool_view_height    70
#define label_font_size     16

@implementation AUnAtHomeController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    UILabel *descLabel = [[UILabel alloc]init];
    [descLabel setText:@"您还没有家庭，想要随时随地的联系你的亲人吗？\n\n马上来创建一个吧 ：）"];
    [descLabel setFont:[UIFont systemFontOfSize:label_font_size]];
    descLabel.textAlignment = NSTextAlignmentLeft;
    [descLabel setTextColor:[UIColor colorWithRed:99./255 green:162./255. blue:146./255 alpha:1.0]];
    descLabel.lineBreakMode = NSLineBreakByWordWrapping;
    descLabel.numberOfLines = 5;
    [descLabel setBackgroundColor:[UIColor clearColor]];
    
    CGSize titleSize = CGSizeMake(260, 20000.0f);
    NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:descLabel.font, NSFontAttributeName,nil];
    titleSize =[descLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;

    float x = (self.view.frame.size.width - titleSize.width)/2.;
    [descLabel setFrame:CGRectMake(x, 30, titleSize.width, titleSize.height)];
    [self.view addSubview:descLabel];
    
    
    UIView *toolView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-tool_view_height, self.view.frame.size.width,tool_view_height)];
    [self.view addSubview:toolView];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, toolView.frame.size.width, .3)];
    [lineLabel setBackgroundColor:[UIColor colorWithRed:0./255. green:0/255. blue:0./255. alpha:.2]];
    [toolView addSubview:lineLabel];
    
    CGRect rect = CGRectMake(10, 10, self.view.frame.size.width-2*10, tool_view_height-20);
    UIButton *newHomeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [newHomeButton setFrame:rect];
    newHomeButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [newHomeButton setTitle:@"创建家庭" forState:UIControlStateNormal];
    [newHomeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [newHomeButton setBackgroundImage:[UIImage imageNamed:@"Button_Orange_Def.png"] forState:UIControlStateNormal];
    [newHomeButton setBackgroundImage:[UIImage imageNamed:@"Button_Orange_Sel.png"] forState:UIControlStateHighlighted];
    [newHomeButton addTarget:self action:@selector(newHome) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:newHomeButton];
}


- (void)newHome {
    AHomeLevelController *atHomeCon = (AHomeLevelController*)[self parentViewController];
    [atHomeCon newHome];
}

@end
