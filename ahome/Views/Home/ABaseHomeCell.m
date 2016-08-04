//
//  ABaseHomeCell.m
//  ahome
//
//  Created by andson-dile on 15/6/17.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ABaseHomeCell.h"

@implementation ABaseHomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setBackgroundColor:[UIColor clearColor]];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return self;
}

- (void)setDataForCell:(ARecord*)record {
    
}


+ (float)heightForCell:(int)nodes {
    return 200.;
}

@end
