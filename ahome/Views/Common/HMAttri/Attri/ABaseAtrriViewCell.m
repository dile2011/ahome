//
//  ABaseAtrriViewCell.m
//  ahome
//
//  Created by andson-dile on 15/8/4.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ABaseAtrriViewCell.h"

@implementation ABaseAtrriViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setBackgroundColor:[UIColor clearColor]];
    
    return self;
}

- (void)setDataForCell:(id)member {
    
}

+ (float)heightForCell {
    return 100.;
}

@end
