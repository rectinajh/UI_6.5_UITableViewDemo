//
//  UserInfo.m
//  UI_6.5_class
//
//  Created by rimi on 15/6/5.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

+ (instancetype)shareUserInfo
{
    
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;

}


@end
