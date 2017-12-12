//
//  BaseTabBarViewController.m
//  NER
//
//  Created by 方静雯 on 2017/12/4.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "NERHomeViewController.h"
#import "NERQrcodeViewController.h"
#import "AppointViewController.h"
#import "PersonalViewController.h"
#import "NERParkingStateViewController.h"
#import "UIImage+ImageWithColor.h"

@interface BaseTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.delegate = self;

    [self.tabBar setShadowImage:[UIImage new]];
    [self.tabBar setBackgroundImage:[UIImage imageWithColor:TABBAR_COLOR]];
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setTintColor:THEME_COLOR];
//    self.tabBar.unselectedItemTintColor=THEME_COLOR;
    self.tabBar.clipsToBounds = NO;
    
    [self createBaseView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createBaseView{
     NERHomeViewController *homeVc = [[NERHomeViewController alloc]init];
     homeVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"home2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
     [homeVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-5)];
    
    AppointViewController *appointVc = [[AppointViewController alloc]init];
    appointVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"预约" image:[[UIImage imageNamed:@"phone2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"phone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [appointVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-5)];
    
    NERQrcodeViewController *vc= [[NERQrcodeViewController alloc]init];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[[UIImage imageNamed:@"hometabbar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"hometabbar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-5)];
    
    NERParkingStateViewController *stateVc = [[NERParkingStateViewController alloc]init];
    stateVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"状态" image:[[UIImage imageNamed:@"state2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"state"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [stateVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-5)];
    
    PersonalViewController *personalVc = [[PersonalViewController alloc]init];
    personalVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"my2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"my"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [personalVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-5)];
    
    self.tabBar.translucent = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    [self setViewControllers:@[homeVc,appointVc,vc,stateVc,personalVc]];
    [self setSelectedIndex:0];
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[NERQrcodeViewController class]]) {
        [self presentQRcode];
        return NO;
    }
     return YES;
}

-(void)presentQRcode{
    NERQrcodeViewController *qrcodeVc= [[NERQrcodeViewController alloc]init];
    [self presentViewController:qrcodeVc animated:YES completion:nil];
}

@end
