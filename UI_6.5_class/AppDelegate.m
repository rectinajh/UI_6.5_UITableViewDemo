//
//  AppDelegate.m
//  UI_6.5_class
//
//  Created by rimi on 15/6/5.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseViewController.h"
#import "MainViewController.h"
#import "PhotoViewController.h"
#import "LoginViewController.h"
#import "SettingViewController.h"
#import "UserInfo.h"

@interface AppDelegate () <UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
#pragma mark - 设置根控制器
    UITabBarController *tabController = [[UITabBarController alloc]init];
    self.window.rootViewController = tabController;
    
    //创建控制器
    MainViewController *mainVC = [[MainViewController alloc] initWithTitle:@"通话记录"];
    
    PhotoViewController *photoVC = [[PhotoViewController alloc] initWithTitle:@"联系人"];
    
    LoginViewController *loginVC = [[LoginViewController alloc] initWithTitle:@"拨号"];
    
    SettingViewController *settingVC = [[SettingViewController alloc] initWithTitle: @"设置"];
    
    //设置子控制器集合
    tabController.viewControllers = @[mainVC, photoVC, loginVC, settingVC];
    
    self.window.rootViewController = tabController;
    
    // 设置默认选中下标，默认为0
    tabController.selectedIndex = 0;
    
#pragma mark - 设置标签栏按钮
    //图片
    UIImage *calllogImage = [UIImage imageNamed:@"calllog"];
    UIImage *contactImage = [UIImage imageNamed:@"contact@3x"];
    UIImage *dialImage    = [UIImage imageNamed:@"dial@3x"];
    UIImage *settingImage = [UIImage imageNamed:@"setting@3x"];
    
    //配置文本颜色
    tabController.tabBar.tintColor = [UIColor greenColor];
    
    //标签栏颜色
    tabController.tabBar.barTintColor = [UIColor colorWithRed:0.968 green:1.000 blue:0.964 alpha:1.000];
    //创建标签栏按钮
    UITabBarItem *contactItem  = [[UITabBarItem alloc] initWithTitle:@"通话记录" image:calllogImage tag:10];
    
    UITabBarItem *calllogItem  = [[UITabBarItem alloc] initWithTitle:@"联系人" image:contactImage tag:20];
    
    UITabBarItem *dialItem  = [[UITabBarItem alloc] initWithTitle:@"拨号" image:dialImage tag:30];
    
    UITabBarItem *settingItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:settingImage tag:40];
  
    
    //对应各个控制器
    mainVC.tabBarItem = contactItem;
    mainVC.tabBarItem = calllogItem;
    mainVC.tabBarItem = dialItem;
    mainVC.tabBarItem = settingItem;
    
#pragma mark - delegate
    //设置协议遵守协议
    tabController.delegate = self;
    
    return YES;
}

#pragma mark - UITabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"%s",__func__);
    
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSLog(@"%s",__func__);
    //获取单例
    UserInfo *userinfo = [UserInfo shareUserInfo];
    //当控制器界面为登录的时候才进行判断
    if (viewController == tabBarController.viewControllers[2]) {
        if (userinfo.isLogin) {
            return YES;
        } else {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"警告" message:@"是否进行登录" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView show];
            return NO;
            }
    
        }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
