//
//  AHomeInfo.m
//  ahome
//
//  Created by dilei liu on 15/1/15.
//  Copyright (c) 2015年 ushome. All rights reserved.
//

#import "AHomeInfo.h"

@implementation AHomeInfo

- (void)updateWithJSonDictionary:(NSDictionary *)dic {
    int memberNo = [[dic objectForKey:@"member"]intValue];
    int shareNo = [[dic objectForKey:@"share"]intValue];
    int albumNo = [[dic objectForKey:@"album"]intValue];
    NSString *photo = [dic objectForKey:@"photo"];
    
    [self setMemberNo:memberNo];
    [self setShareNo:shareNo];
    [self setAlbum:albumNo];
    [self setPhoto:photo];
}


@end
