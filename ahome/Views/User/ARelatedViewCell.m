//
//  ARelatedViewCell.m
//  ahome
//
//  Created by andson-dile on 15/6/24.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ARelatedViewCell.h"

@implementation ARelatedViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setBackgroundColor:[UIColor clearColor]];

    return self;
}

- (void)setDataForCell:(id)data {
    AUser *user = (AUser*)data;
    self.textLabel.text = [NSString stringWithFormat:@"%@ 快来与家人一起互动吧:-）",user.uname];
    [self.textLabel setTextColor:[UIColor whiteColor]];
    self.textLabel.font = [UIFont systemFontOfSize:14];
}

+ (float)heightForCell {
    return 15.;
}

@end
