//
//  BaseNavigationController.h
//  NER
//
//  Created by Fangjw on 2018/1/2.
//  Copyright © 2018年 Fangjw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationController : UINavigationController

@property (nonatomic, strong) UIImage *backButtonItemImage;
//重写
- (void)navigationViewDidLoad;
/**
 *  自定义导航栏
 *
 *  @param color       背景颜色
 *  @param tintColor   字体颜色
 *  @param textFont    字体大小
 *  @param translucent 是否半透明
 */
- (void)showImageColorNavigationBarBackground:(UIColor *)color textTintColor:(UIColor *)tintColor textFont:(UIFont *)textFont isTranslucent:(BOOL)translucent;

/**
 *  默认导航栏
 *
 *  @param tintColor   字体颜色
 */
- (void)showNormalNavigationBarTintColor:(UIColor *)tintColor;

/**
 *  添加线条
 *
 *  @param imageColor  线条颜色
 */
- (void)addNormalShadowImage:(UIColor *)imageColor;
/**
 *  去除底部线条
 */
- (void)removeShadowImage;

@end
