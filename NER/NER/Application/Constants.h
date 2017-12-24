//
//  Constants.h
//  NER
//
//  Created by 方静雯 on 2017/12/4.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#define kTimeSpan 1.5
//color
#define Rgb2UIColor(r, g, b, a)        [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:((a)/1.0)]
#define THEME_COLOR Rgb2UIColor(15, 83, 62, 1) //主色
#define SECOND_COLOR Rgb2UIColor(61, 182, 144, 1) // 辅色
#define TEXT_COLOR_TITLE Rgb2UIColor(15, 83, 62, 1) //文字标题色
#define TEXT_COLOR_MAIN Rgb2UIColor(15, 83, 62, 0.8) //主要文字颜色
#define TEXT_COLOR_PLACEHOLER Rgb2UIColor(, , , 1) //文字placeholer颜色
#define STATUSBAR_COLOR_COMPLETE Rgb2UIColor(, , , 1) //已完成状态栏
#define BUTTON_COLOR_CANNOTCLICK Rgb2UIColor(, , , 1) // 按钮不可点击
#define LINE_COLOR Rgb2UIColor(242, 242, 242, 1) // 线条颜色
#define TABBAR_COLOR Rgb2UIColor(250, 250, 250, 1) // tabbar颜色


//size
#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define SCREEN_WIDTH  ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

//APP INFO
#define APP_DISPLAYNAME     [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]
#define ALERT_TITLE APP_DISPLAYNAME
#define VERSION             [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define SystemVersion [[UIDevice currentDevice] systemVersion]
#define SystemBuild [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]


#ifdef DEBUG
#define DBG(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define DBG(format, ...)
#endif

//------------------手机型号判断----------------------//
#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMke(828, 1472), [[UIScreen mainScreen] currentMode].size) : NO)


#define IS_NULL_STRING(__POINTER) \
(__POINTER == nil || \
__POINTER == (NSString *)[NSNull null] || \
![__POINTER isKindOfClass:[NSString class]] || \
![__POINTER length])

#define g_myself [MySelfInfo sharedMySelfInfo]

#endif /* Constants_h */
