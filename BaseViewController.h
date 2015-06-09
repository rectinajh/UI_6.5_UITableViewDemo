//
//  BaseViewController.h
//  UI_6.5_class
//
//  Created by rimi on 15/6/5.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
// 自定义初始化方法
- (instancetype)initWithTitle:(NSString *)title;
// 初始化界面
- (void)initializeUserInterface;


@end
