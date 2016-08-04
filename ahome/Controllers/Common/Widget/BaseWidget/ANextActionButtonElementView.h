//
//  ANextActionButtonView.h
//  Ahome
//
//  Created by dilei liu on 14-11-18.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

typedef enum {
    DefaultState,
    WorkState,
    DisableState,
    EnableState
}ButtonState;


#import "AQTableViewCellLine.h"

@interface ANextActionButtonElementView : AQTableViewCellLine

- (void)setButtonEnable:(BOOL)enable;
- (void)setButtonState:(ButtonState)state;

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string andButtonTitle:(NSString*)btnTitle;

@end
