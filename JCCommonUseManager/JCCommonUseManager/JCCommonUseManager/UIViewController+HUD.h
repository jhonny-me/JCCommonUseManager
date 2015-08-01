//
//  UIViewController+HUD.h
//  JCCommonUseManager
//
//  Created by 顾强 on 15/8/1.
//  Copyright (c) 2015年 jhonny.copper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HUD)

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

- (void)showHint:(NSString *)hint;

- (void)showHint:(NSString *)hint yOffset:(float)yOffset;

- (void)hideHud;

@end
