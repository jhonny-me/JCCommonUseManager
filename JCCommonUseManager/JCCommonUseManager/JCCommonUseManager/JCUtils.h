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
// 键盘高度
#define KEYBOARDHEIGHT 216.f
// 宏定义判断系统
#define DeviceVersion [[[UIDevice currentDevice] systemVersion] integerValue]


// 简单打印
#define LOG(string) NSLog(@"%@",string)
