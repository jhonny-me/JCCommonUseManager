//
//  RequestManager.m
//  CheHuiPai-Auction
//
//  Created by 夏文强 on 15/8/6.
//  Copyright (c) 2015年 夏文强. All rights reserved.
//

#import "RequestManager.h"
#import "Reachability.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import "MPAPIHelper.h"

NSString *const baseUrl = @"http://api.chehuipai.cn/API/";
@implementation RequestManager

+(RequestManager*)sharedRequestManager{
    static RequestManager *sharedRequestManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedRequestManagerInstance = [[self alloc] init];
    });
    return sharedRequestManagerInstance;
}

- (void)postToUrl:(NSString *)url
       withParams:(NSDictionary *)params
 forCompleteBlock:(YCRequestCompleteBlock)completeBlock
{
    NSString *newUrl = [NSString stringWithFormat:@"%@%@?",baseUrl,url];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:params];
    [dic setValue:@"0" forKey:@"OperatorID"];
    [dic setValue:@"2" forKey:@"ClientID"];
    [[MPAPIHelper Helper] postWithUrl:newUrl
                               params:dic
                           completion:^(id response,AFHTTPRequestOperation *operation,NSString *error)
    {
        if (response != nil)
        {
            NSNumber * resultCode = [response objectForKey:@"ResultCode"];
            
            if (resultCode.integerValue == 1)
            {
                completeBlock(operation,response,error);
            }else
            {
                [self alert:[response objectForKey:@"ErrorMessage"]];
            }
            
        }else
        {
            if (error != nil)
            {
                [self alert:error];
            }
        }
        
}];
}

- (YCNetworkType) networkType
{
    Reachability *reach = [[Reachability alloc]init];
    
    if (reach.currentReachabilityStatus == NotReachable) {
        PSLogDebug(@"No internet connection found");
        return YCNetworkTypeNoConnection;
    } else if (reach.currentReachabilityStatus == ReachableViaWiFi) {
        PSLogDebug(@"Wifi connection");
        return YCNetworkTypeWifi;
    } else if (reach.currentReachabilityStatus == ReachableViaWWAN) {
        CTTelephonyNetworkInfo *info = [CTTelephonyNetworkInfo new];
        NSString *radioAccessTechnology = info.currentRadioAccessTechnology;
        
        if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyGPRS]) {
            return YCNetworkTypeGPRS;
        } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyEdge]) {
            return YCNetworkTypeEdge;
        } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyWCDMA]) {
            return YCNetworkTypeWCDMA;
        } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyHSDPA]) {
            return YCNetworkTypeHSDPA;
        } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyHSUPA]) {
            return YCNetworkTypeHSUPA;
        } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMA1x]) {
            return YCNetworkTypeCDMA1x;
        } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMAEVDORev0]) {
            return YCNetworkTypeCDMAEVDORev0;
        } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMAEVDORevA]) {
            return YCNetworkTypeCDMAEVDORevA;
        } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMAEVDORevB]) {
            return YCNetworkTypeCDMAEVDORevB;
        } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyeHRPD]) {
            return YCNetworkTypeHSUPA;
        } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyLTE]) {
            return YCNetworkTypeLTD;
        }
    }
    return YCNetworkTypeNoConnection;
}

#pragma  alertView show
- (void)alert:(NSString *)content
{
    UIAlertView *alert=[[UIAlertView alloc]
                        initWithTitle:NSLocalizedString(@"错误提醒", nil)
                        message:content
                        delegate:nil
                        cancelButtonTitle:@"确定"
                        otherButtonTitles:nil, nil];
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:alert repeats:NO];
    [alert show];
}
-(void)performDismiss:(NSTimer *)timer
{
    UIAlertView *alert = [timer userInfo];
    [alert dismissWithClickedButtonIndex:0 animated:YES];
}

@end
