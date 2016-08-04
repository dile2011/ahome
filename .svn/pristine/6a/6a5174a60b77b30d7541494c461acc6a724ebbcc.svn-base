//
//  ANameEntryElementView.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-28.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ANameEntryElementView.h"

@implementation ANameEntryElementView

- (id)init {
    self = [super init];
    
    float H = [ANameEntryElementView heightForCell];
    
    UIImageView *lineView = [[UIImageView alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width/2., 0, .5, H)];
    [lineView setBackgroundColor:[UIColor lightGrayColor]];
    [self.contentView addSubview:lineView];

    
    return self;
}

- (CGRect)calculateFrameForEntryElement {
    _entryElement.parentSection.entryPosition = CGRectMake(20,10,self.contentView.frame.size.width/2-20-10, self.frame.size.height-20);
    return _entryElement.parentSection.entryPosition;
}

@end
