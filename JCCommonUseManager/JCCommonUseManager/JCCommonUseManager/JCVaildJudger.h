//
//  JCVaildJudger.h
//  JCCommonUseManager
//
//  Created by 顾强 on 15/8/1.
//  Copyright (c) 2015年 jhonny.copper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCVaildJudger : NSObject

//邮箱
+ (BOOL) validateEmail:(NSString *)email;
//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile;
//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo;
//车型
+ (BOOL) validateCarType:(NSString *)CarType;
//用户名
+ (BOOL) validateUserName:(NSString *)name;
//密码
+ (BOOL) validatePassword:(NSString *)passWord;
//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

@end
