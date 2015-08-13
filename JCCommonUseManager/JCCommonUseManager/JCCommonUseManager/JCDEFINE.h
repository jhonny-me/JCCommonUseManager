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
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
// 屏幕高度
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
// 当前view,用于计算坐标
#define CURRENTVIEW [UIApplication sharedApplication].keyWindow
// 键盘高度
#define KEYBOARDHEIGHT 216.f
// 宏定义判断系统
#define DeviceVersion [[[UIDevice currentDevice] systemVersion] integerValue]
// 是否是ipad
#define IsPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

