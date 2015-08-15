//
//  YCUtils.h
//  JCCommonUseManager
//
//  Created by 顾强 on 15/7/31.
//  Copyright (c) 2015年 jhonny.copper. All rights reserved.
//

#import <UIKit/UIKit.h>
// 各种尺寸
// 屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
// 屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
// 当前view,用于计算坐标
#define CURRENT_VIEW [UIApplication sharedApplication].keyWindow
// 键盘高度
#define KEYBOARD_HEIGHT 216.f
// 宏定义判断系统
#define DEVICE_VERSION [[[UIDevice currentDevice] systemVersion] integerValue]
// 是否是ipad
#define IsPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

