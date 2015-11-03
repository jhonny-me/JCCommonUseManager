//
//  YCSexChooseView.h
//  Huake
//
//  Created by jhonny.copper on 15/7/9.
//  Copyright (c) 2015年 BingJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopView : UIView
@property (copy, nonatomic) UIColor *borderColor;

- (id)initWithPoint:(CGPoint)point titles:(NSArray *)titles images:(NSArray *)images;
- (void)show;


@property (nonatomic, copy) void (^selectRowAtIndex)(NSInteger index);
@property (nonatomic) BOOL isSeparator;
@end
