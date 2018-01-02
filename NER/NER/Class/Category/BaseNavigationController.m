//
//  BaseNavigationController.m
//  NER
//
//  Created by Fangjw on 2018/1/2.
//  Copyright © 2018年 Fangjw. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationViewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
}

-(void)navigationViewDidLoad{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//添加返回按钮
-(UIBarButtonItem*) createBackButton
{
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithImage:_backButtonItemImage style:UIBarButtonItemStyleBordered target:self action:@selector(popself)];
    return backBtn;
}

-(void)popself
{
    [self popViewControllerAnimated:YES];
}

//设置背景图片
- (void)setNavigationBarBackgroundImage:(UIImage *)bgImage
{
    [self.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
}

//自定义导航栏
- (void)showImageColorNavigationBarBackground:(UIColor *)color textTintColor:(UIColor *)tintColor textFont:(UIFont *)textFont isTranslucent:(BOOL)translucent
{
    self.navigationBar.translucent = translucent;
    self.navigationBar.tintColor = tintColor;
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:tintColor,NSFontAttributeName:textFont};
    [self setNavigationBarBackgroundImage:[self createImageWithColor:color]];
    [self removeShadowImage];
}

//默认导航栏
- (void)showNormalNavigationBarTintColor:(UIColor *)tintColor
{
    self.navigationBar.tintColor = tintColor;
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:tintColor};
    [self setNavigationBarBackgroundImage:[self createImageWithColor:[UIColor whiteColor]]];
    NSDictionary *dict=[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor lightGrayColor],[UIFont systemFontOfSize:18],[[NSShadow alloc] init],nil]forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName,NSFontAttributeName,NSShadowAttributeName,nil]];
    self.navigationBar.titleTextAttributes = dict;

}

/**
 *  去除底部线条
 */
- (void)removeShadowImage
{
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
}

/**
 *  添加线条
 */
- (void)addNormalShadowImage:(UIColor *)imageColor
{
    [self.navigationBar setShadowImage:[self createImageWithColor:imageColor]];
}

- (UIImage*)createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return  YES;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    if (viewController.navigationItem.leftBarButtonItem== nil && [self.viewControllers count] > 1) {
        viewController.navigationItem.leftBarButtonItem =[self createBackButton];
    }
}

- (void)pushViewController:(UIViewController *)viewController title:(NSString*)title animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    viewController.title = title;
    if (viewController.navigationItem.leftBarButtonItem== nil && [self.viewControllers count] > 1) {
        viewController.navigationItem.leftBarButtonItem =[self createBackButton];
    }
}

@end
