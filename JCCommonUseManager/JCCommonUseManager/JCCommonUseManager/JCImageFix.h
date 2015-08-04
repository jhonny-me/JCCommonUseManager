//
//  JCImageFix.h
//  JCCommonUseManager
//
//  Created by 顾强 on 15/8/4.
//  Copyright (c) 2015年 jhonny.copper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JCImageFix : NSObject

+ (UIImage *)fixOrientation:(UIImage *)aImage;
+ (UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size;

@end
