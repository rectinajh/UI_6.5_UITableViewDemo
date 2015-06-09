//
//  UserInfo.h
//  UI_6.5_class
//
//  Created by rimi on 15/6/5.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import <Foundation/Foundation.h>

//单例 应用里面的唯一用户

@interface UserInfo : NSObject

//判断登录
@property (nonatomic, assign,getter=isLogin) BOOL login;

+ (instancetype)shareUserInfo;

@end
