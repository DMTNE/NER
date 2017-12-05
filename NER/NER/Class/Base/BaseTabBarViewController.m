//
//  BaseTabBarViewController.m
//  NER
//
//  Created by 方静雯 on 2017/12/4.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "HomeViewController.h"
#import "AppointViewController.h"
#import "StateViewController.h"
#import "PersonalViewController.h"

@interface BaseTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.delegate = self;

    [self.tabBar setShadowImage:[UIImage new]];
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setTintColor:THEME_COLOR];
    self.tabBar.unselectedItemTintColor=THEME_COLOR;
    self.tabBar.clipsToBounds = NO;
    
    [self createBaseView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createBaseView{
     HomeViewController *homeVc = [[HomeViewController alloc]init];
     homeVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
     [homeVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-5)];
    
    AppointViewController *appointVc = [[AppointViewController alloc]init];
    appointVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"预约" image:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [appointVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-5)];
    
    UIViewController *vc= [[UIViewController alloc]init];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"扫一扫" image:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-5)];
    
    StateViewController *stateVc = [[StateViewController alloc]init];
    stateVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"状态" image:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [stateVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-5)];
    
    PersonalViewController *personalVc = [[PersonalViewController alloc]init];
    personalVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [personalVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-5)];
    
    self.tabBar.translucent = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    [self setViewControllers:@[homeVc,appointVc,vc,stateVc,personalVc]];
    [self setSelectedIndex:0];
}

@end
