//
//  AMergeHomeMember.h
//  ahome
//
//  Created by andson-dile on 15/6/18.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "ARecord.h"
#import "AHomeMember.h"

typedef enum {
    MineHomeType,
    ParentHomeType
    
}HomeProType;

@interface AMergeHomeMember : AHomeMember

@property (nonatomic,assign)long familyId;
@property (nonatomic,strong)NSString *photo;
@property (nonatomic,assign)HomeProType homeType;

@property (nonatomic,assign)float angle;

- (instancetype)initWithMember:(AHomeMember*)homeMember photo:(NSString*)photo familyId:(long)familyId;


@end
