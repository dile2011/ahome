//
//  ANewHomeInviteRoleElementView.h
//  AtHomeApp
//
//  Created by dilei liu on 14-9-3.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "QTableViewCell.h"

@interface ANewHomeInviteRoleElementView : QTableViewCell

@property (nonatomic,retain)NSString *roleName;

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string andRole:(NSString*)role andSelRoles:(NSArray*)selRoles;

@end
