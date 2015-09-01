//
//  JCHeightCalculator.m
//  JCCommonUseManager
//
//  Created by 顾强 on 15/8/13.
//  Copyright (c) 2015年 jhonny.copper. All rights reserved.
//

#import "JCHeightCalculator.h"
#import "JCDEFINE.h"

@implementation JCHeightCalculator

/**
 *  计算一段文本的高度
 *
 *  @param string 计算的文本
 *  @param space  行间距，默认为5
 *
 *  @return 计算的高度
 */
+ (CGFloat) getHeight:(NSString *)string WithSpace:(CGFloat)space{
    
    if(string == nil)
        return 0.f;
    CGFloat height = 0.f;
    
    if (space <=0.0) {
        space = 5.f;
    }
    
    CGSize textBlockMinSize = CGSizeMake(SCREEN_WIDTH -20, MAXFLOAT);
    CGSize size;
    static float systemVersion;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    });
    UIFont *font = IS_IPAD ? [UIFont boldSystemFontOfSize:20.0f] : [UIFont boldSystemFontOfSize:15.f];
    
    if (systemVersion >= 7.0) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:space];//调整行间距
        size = [string boundingRectWithSize:textBlockMinSize
                                    options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                 attributes:@{
                                              NSFontAttributeName:font,
                                              NSParagraphStyleAttributeName:paragraphStyle
                                              }
                                    context:nil].size;
        
        return size.height +20.f + space + height;
    }else{
        size = [string sizeWithFont:font
                  constrainedToSize:textBlockMinSize
                      lineBreakMode:UILineBreakModeWordWrap];
        NSInteger lines = (size.height/19.f) + height;
        
        return size.height + 20.f +lines * space;
    }
}

/**
 *  设置一段带行距的文本
 *
 *  @param string 需要处理的文本
 *  @param space  行间距
 *
 *  @return 带行间距的文本
 */
+ (NSMutableAttributedString *)string:(NSString *)string WithSpace:(CGFloat)space{
    NSMutableString *newString = [NSMutableString stringWithString:string];
   
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:newString];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, newString.length)];
    
    return attributedString;
}

@end
