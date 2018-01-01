//
//  LoginVIewController.m
//  BCP
//
//  Created by Harry on 2017/11/24.
//  Copyright © 2017年 Harry. All rights reserved.
//

#import "LoginVIewController.h"
#import "RegisterViewController.h"
#import "NERHomeViewController.h"
#import "AppointmentViewController.h"
#import "NERParkingStateViewController.h"
#import "PersonalViewController.h"
#import "ForgetPW.h"

@interface LoginVIewController ()
@property (weak, nonatomic) IBOutlet UIButton *LoginBt;
@property (weak, nonatomic) IBOutlet UIButton *RegisterBt;
@property (weak, nonatomic) IBOutlet UITextField *UserAccont;
@property (weak, nonatomic) IBOutlet UITextField *UserPw;
@property (weak, nonatomic) IBOutlet UIButton *ForgetPW;

@end

@implementation LoginVIewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"新能源";
    [self setBarTextColor];
    _LoginBt.layer.masksToBounds = YES;
    _LoginBt.layer.cornerRadius = 25;
    _RegisterBt.layer.borderWidth = 1;
    _RegisterBt.layer.borderColor=[UIColor colorWithRed:0.318 green:0.722 blue:0.549 alpha:1].CGColor;
    _RegisterBt.layer.masksToBounds = YES;
    _RegisterBt.layer.cornerRadius = 25;
    
    UIImageView *navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    navBarHairlineImageView.hidden = YES;
    
    [_LoginBt addTarget:self action:@selector(LoginToHome) forControlEvents:UIControlEventTouchUpInside];
    [_RegisterBt addTarget:self action:@selector(ToRegister) forControlEvents:UIControlEventTouchUpInside];
    [_ForgetPW addTarget:self action:@selector(ToForgetPW) forControlEvents:UIControlEventTouchUpInside];
}
- (void)setBarTextColor
{
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:15/255 green:83/255 blue:62/255 alpha:1]}];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

#pragma 隐藏导航栏黑线
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)ToRegister
{
    RegisterViewController *r1 = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:r1 animated:YES];
}

- (void)ToForgetPW
{
    ForgetPW *Fvc = [[ForgetPW alloc] init];
    [self.navigationController pushViewController:Fvc animated:YES];
}

- (void)LoginToHome
{
    UIImage *PCImage = [UIImage imageNamed:@"PC"];
    UIImage *PCImageSelected = [UIImage imageNamed:@"PC_active"];
    PCImage = [PCImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    PCImageSelected = [PCImageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *YYImage = [UIImage imageNamed:@"YY"];
    UIImage *YYImageSelected = [UIImage imageNamed:@"YY_active"];
    YYImage = [YYImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    YYImageSelected = [YYImageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *HomeImage = [UIImage imageNamed:@"Home"];
    UIImage *HomeImageSelected = [UIImage imageNamed:@"Home_active"];
    HomeImage = [HomeImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    HomeImageSelected = [HomeImageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *StatusImage = [UIImage imageNamed:@"Status"];
    UIImage *StatusImageSelected = [UIImage imageNamed:@"Status_active"];
    StatusImage = [StatusImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    StatusImageSelected = [StatusImageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //未选中的字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    NERHomeViewController *hvc = [[NERHomeViewController alloc] init];
    UINavigationController *n1 = [[UINavigationController alloc] initWithRootViewController:hvc];
    //    LoginVIewController *lvc = [[LoginVIewController alloc] init];
    //    UINavigationController *n1 = [[UINavigationController alloc] initWithRootViewController:lvc];
    n1.tabBarItem.title = @"首页";
    n1.tabBarItem.image = HomeImage;
    n1.tabBarItem.selectedImage = HomeImageSelected;
    
    
//    CLViewController *rvc = [[CLViewController alloc] init];
//    UINavigationController *n5 = [[UINavigationController alloc]  initWithRootViewController:rvc];
//    n5.tabBarItem.title = @"预约";
//    n5.tabBarItem.image = YYImage;
//    n5.tabBarItem.selectedImage = YYImageSelected;
    
    AppointmentViewController *avc = [[AppointmentViewController alloc] init];
    UINavigationController *n2 = [[UINavigationController alloc] initWithRootViewController:avc];
    n2.tabBarItem.title = @"预约";
    n2.tabBarItem.image = YYImage;
    n2.tabBarItem.selectedImage = YYImageSelected;
    
    NERParkingStateViewController *svc = [[NERParkingStateViewController alloc] init];
    UINavigationController *n3 = [[UINavigationController alloc] initWithRootViewController:svc];
    n3.tabBarItem.title = @"状态";
    n3.tabBarItem.image = StatusImage;
    n3.tabBarItem.selectedImage = StatusImageSelected;
    
    PersonalViewController *pvc =[[PersonalViewController alloc] init];
    UINavigationController *n4 = [[UINavigationController alloc] initWithRootViewController:pvc];
    n4.tabBarItem.title = @"我的";
    n4.tabBarItem.image = PCImage;
    n4.tabBarItem.selectedImage = PCImageSelected;
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    tab.viewControllers = [NSArray arrayWithObjects:n1,n2,n3,n4, nil];
    
    UIWindow *Home = self.view.window;
    Home.rootViewController = tab;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_UserAccont resignFirstResponder];
    [_UserPw resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
