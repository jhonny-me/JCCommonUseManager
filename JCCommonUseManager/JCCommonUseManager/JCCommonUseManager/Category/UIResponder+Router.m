//
//  UIResponder+Router.m
//  JCCommonUseManager
//
//  Created by 顾强 on 15/8/13.
//  Copyright (c) 2015年 jhonny.copper. All rights reserved.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
}

@end
