//
//  JCHeightCalculator.h
//  JCCommonUseManager
//
//  Created by 顾强 on 15/8/13.
//  Copyright (c) 2015年 jhonny.copper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface JCHeightCalculator : NSObject

/**
 *  计算一段文本的高度
 *
 *  @param string 计算的文本
 *  @param space  行间距，默认为5
 *
 *  @return 计算的高度
 */
+ (CGFloat) getHeight:(NSString *)string WithSpace:(CGFloat)space;

/**
 *  设置一段带行距的文本
 *
 *  @param string 需要处理的文本
 *  @param space  行间距
 *
 *  @return 带行间距的文本
 */
+ (NSMutableAttributedString *)string:(NSString *)string WithSpace:(CGFloat)space;

@end
