//
//  JCLog.h
//  JCCommonUseManager
//
//  Created by 顾强 on 15/8/1.
//  Copyright (c) 2015年 jhonny.copper. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG

#define JCLog(aParam) NSLog(@"%@",aParam)

#define JCRectLog(aParam) NSLog(@"%@",NSStringFromCGRect(aParam))

#define JCPointLog(aParam) NSLog(@"%@",NSStringFromCGPoint(aParam))

#else

#define JCLog(aParam) nil

#define JCRectLog(aParam) nil

#define JCPointLog(aParam) nil

#endif

