//
//  AppDelegate.m
//  NER
//
//  Created by 方静雯 on 2017/12/4.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /* -------- 初始化百度地图 -------- */
    BMKMapManager *mapManager=[[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret=[mapManager start:@"GfPgxXXouIvZiybO50QRSZ2QhwNtQmi3" generalDelegate:nil];
    if (!ret) {
        NSLog(@"mamager start failed!");
    }
    
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor=[UIColor whiteColor];
    
    BaseTabBarViewController *bsVC = [[BaseTabBarViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:bsVC];
    self.window.rootViewController=nav;
    
     [self.window makeKeyAndVisible];
    
    /* -------- 全局UI设置 -------- */
    //文本框通用设置
//    [[UITextField appearance] setTintColor:THEME_COLOR];
//    [[UITextField appearance] setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"" attributes:@{NSForegroundColorAttributeName: TEXT_COLOR_MAIN}]];
    
    //导航栏通用设置
    [[UINavigationBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc]init] ];
    [[UINavigationBar appearance] setTintColor:THEME_COLOR];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          THEME_COLOR,NSForegroundColorAttributeName,
                                                          [UIFont boldSystemFontOfSize:18],
                                                          NSFontAttributeName
                                                          ,nil]];
    
    //ios11--UIScrollView and UITableView的新特性
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0) {
//        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
    
    [self setNaviBack];
    
    return YES;
    
}

- (void)setNaviBack{
    
    UINavigationBar * navigationBar = [UINavigationBar appearance];
    
    //返回按钮的箭头颜色
    
    //    [navigationBar setTintColor:[UIColor whiteColor]];
    
    //设置返回样式图片
    
    UIImage *image = [UIImage imageNamed:@"btn_navigation_arrow_s"];
    
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    navigationBar.backIndicatorImage = image;
    navigationBar.backIndicatorTransitionMaskImage = image;
    
    UIBarButtonItem *buttonItem = [UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil];
    
    UIOffset offset;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0) {
        offset.horizontal = -500;
    }else{
        
        offset.horizontal = -500;
        offset.vertical = -500;
        
    }
    [buttonItem setBackButtonTitlePositionAdjustment:offset forBarMetrics:UIBarMetricsDefault];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
