//
//  ABaseMenuView.m
//  demoe
//
//  Created by andson-dile on 15/3/19.
//  Copyright (c) 2015年 andson. All rights reserved.
//

#import "ABaseMenuView.h"
#import "AOperate.h"

#define size_titleView_height   20
#define size_operateView_height 50
#define margin_v_size           10

#define margin_op_size          5

@implementation ABaseMenuView

- (instancetype)initWithHomeMember:(AHomeMember*)member {
    self = [super init];
    _member = member;
    [self menuOperateNew];
    
    self.bounds = CGRectMake(0, 0, [self getViewSize].width, [self getViewSize].height);
    [self setBackgroundColor:[UIColor colorWithRed:5/255. green:5/255. blue:5/255. alpha:1.]];
    self.layer.cornerRadius = 6;
    self.opaque = NO;
    
    self.layer.shadowOffset = CGSizeMake(2, 2);
    self.layer.shadowOpacity = 0.80;
    
    [self drawView];
    return self;
}

- (void)menuOperateNew {
    _operates = [NSMutableArray array];
    AOperate *op = nil;
    
    switch (_member.memberState) {
            
        case StateAuth: {
            op = [[AOperate alloc]initWithTitle:@"手机认证" imageName:@"menu_operate_auth.png" circlebgColor:[UIColor colorWithRed:70./255 green:60./255 blue:206./255. alpha:1.] optype:AuthOperate];
            [_operates addObject:op];

            op = [[AOperate alloc]initWithTitle:@"成员删除" imageName:@"menu_operate_delete.png" circlebgColor:[UIColor whiteColor] optype:DeleteOperate];
            [_operates addObject:op];
        }
            break;

        case StateInvite: {
            op = [[AOperate alloc]initWithTitle:@"成员邀请" imageName:@"menu_operate_invite.png" circlebgColor:[UIColor colorWithRed:254./255 green:130./255 blue:10./255. alpha:1.] optype:InviteOperate];
            [_operates addObject:op];
            
            op = [[AOperate alloc]initWithTitle:@"成员删除" imageName:@"menu_operate_delete.png" circlebgColor:[UIColor whiteColor] optype:DeleteOperate];
            [_operates addObject:op];
        }
            break;
            
        case StateWaitInvite: {
            op = [[AOperate alloc]initWithTitle:@"再次邀请" imageName:@"menu_operate_invite.png" circlebgColor:[UIColor colorWithRed:254./255 green:130./255 blue:10./255. alpha:1.] optype:InviteOperate];
            [_operates addObject:op];
        }
            break;
            
        case StateSelf:
            break;
            
        case StateOther:
            break;
            
        default:
            break;
    }
}

- (CGSize)getViewSize {
    float H = _operates.count*size_operateView_height+(_operates.count+1)*margin_v_size+size_titleView_height;
    if (_member.memberState <= 3)return CGSizeMake(150, H);
    
    return CGSizeZero;
}

- (void)drawView {
    _titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, size_titleView_height)];
    [self addSubview:_titleView];
    [self drawTitleView];
    
    _panelView = [[UIView alloc]initWithFrame:CGRectMake(0, size_titleView_height, self.bounds.size.width, self.bounds.size.height-size_titleView_height)];
    [self addSubview:_panelView];
    [self drawPanelView];
}

- (void)drawTitleView {
    
}

- (void)drawPanelView {
    for (AOperate *op in _operates) {
        int index = (int)[_operates indexOfObject:op];
        UIView *opView = [[UIView alloc]initWithFrame:CGRectMake(0, (index+1)*margin_v_size+index*size_operateView_height, self.bounds.size.width, size_operateView_height)];
        [_panelView addSubview:opView];
        
        UIButton *opButton = [self actionButtonWithIcon:op.imageName andMenuTitle:op.title andView:opView andColor:op.circlebgColor];
        opButton.tag = op.optype;
        [opButton addTarget:self action:@selector(opbuttonColicked:) forControlEvents:UIControlEventTouchUpInside];
        [opView addSubview:opButton];
    }
}

- (void)titleViewWithTitle:(NSString*)title titleView:(UIView*)titleView {
    UILabel *menuTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(3, 0, 3*titleView.frame.size.width/4-3, titleView.frame.size.height)];
    menuTitleLabel.text = title;
    [menuTitleLabel setFont:[UIFont systemFontOfSize:14]];
    menuTitleLabel.textAlignment = NSTextAlignmentLeft;
    [menuTitleLabel setTextColor:[UIColor colorWithRed:92./255 green:214./255 blue:101./255. alpha:1.]];
    menuTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    menuTitleLabel.numberOfLines = 1;
    [menuTitleLabel setBackgroundColor:[UIColor clearColor]];
    [titleView addSubview:menuTitleLabel];
    
    UILabel *roleLabel = [[UILabel alloc]initWithFrame:CGRectMake(3*titleView.frame.size.width/4., 0, titleView.frame.size.width/4.-5, titleView.frame.size.height)];
    roleLabel.text = _member.part;
    [roleLabel setFont:[UIFont systemFontOfSize:12]];
    roleLabel.textAlignment = NSTextAlignmentRight;
    [roleLabel setTextColor:[UIColor whiteColor]];
    roleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    roleLabel.numberOfLines = 1;
    [roleLabel setBackgroundColor:[UIColor clearColor]];
    [titleView addSubview:roleLabel];
}


-(UIButton *)actionButtonWithIcon:(NSString *)iconName andMenuTitle:(NSString*)title andView:(UIView*)actionView andColor:circleColor{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, actionView.frame.size.width, actionView.frame.size.height);
    
    UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, actionView.frame.size.width, actionView.frame.size.height)];
    buttonView.backgroundColor = [UIColor colorWithRed:24./255 green:24./255 blue:24./255 alpha:1.];
    buttonView.layer.cornerRadius = 6;
    buttonView.layer.masksToBounds = YES;
    buttonView.opaque = NO;
    
    
    UIImageView *cirleView = [[UIImageView alloc]initWithFrame:CGRectMake(2*margin_op_size, 2*margin_op_size, buttonView.frame.size.height-4*margin_op_size, buttonView.frame.size.height-4*margin_op_size)];
    cirleView.layer.cornerRadius = cirleView.frame.size.width/2.;
    [cirleView setBackgroundColor:circleColor];
    [buttonView addSubview:cirleView];
    
    
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    [icon setFrame:CGRectMake(5, 5, cirleView.frame.size.height-10, cirleView.frame.size.height-10)];
    [cirleView addSubview:icon];
    
    UILabel *menuTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(icon.frame.origin.x+icon.frame.size.width, 0, buttonView.frame.size.width-(icon.frame.origin.x+icon.frame.size.width), buttonView.frame.size.height)];
    menuTitleLabel.text = title;
    [menuTitleLabel setFont:[UIFont systemFontOfSize:18]];
    menuTitleLabel.textAlignment = NSTextAlignmentCenter;
    [menuTitleLabel setTextColor:[UIColor whiteColor]];
    menuTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    menuTitleLabel.numberOfLines = 1;
    [menuTitleLabel setBackgroundColor:[UIColor clearColor]];
    [buttonView addSubview:menuTitleLabel];
    
    [button setBackgroundImage:[self imageWithView:buttonView] forState:UIControlStateNormal];
    
    return button;
}

-(UIImage *)imageWithView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)opbuttonColicked:(UIButton*)opButton {
    _member.menuOperate((OperateType)opButton.tag);
}


@end
