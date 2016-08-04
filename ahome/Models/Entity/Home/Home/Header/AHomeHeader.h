//
//  AHomeHeader.h
//  ahome
//
//  Created by andson-dile on 15/6/19.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ARecord.h"

@interface AHomeHeader : ARecord

@property (nonatomic,retain)NSString *imageName;
@property (nonatomic,retain)NSString *title;
@property(nonatomic, copy) void (^onSelected)(void);

- (instancetype)initWithTitle:(NSString*)title imageName:(NSString*)imageName andSelect:(void (^)(void))onSelected;

@end
