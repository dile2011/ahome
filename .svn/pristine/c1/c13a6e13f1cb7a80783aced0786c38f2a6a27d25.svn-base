//
//  AHomeTitle.h
//  ahome
//
//  Created by andson-dile on 15/6/16.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ARecord.h"

@interface AHomeTitle : ARecord

@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *titleimage;
@property(nonatomic,retain) NSString *cellimage;
@property(nonatomic,assign) BOOL isPullMenu;

@property(nonatomic, copy) void (^onSelected)(void);

- (instancetype)initWithTitle:(NSString*)title image:(NSString*)titleImage cellimage:(NSString*)cellimage;
- (instancetype)initWithTitle:(NSString*)title image:(NSString*)titleImage cellimage:(NSString*)cellimage isPull:(BOOL)isPullMenu andSelect:(void (^)(void))onSelected;
@end
