//
//  RequestManager.h
//  CheHuiPai-Auction
//
//  Created by 夏文强 on 15/8/6.
//  Copyright (c) 2015年 夏文强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "PSLog.h"
typedef NS_ENUM(NSInteger, YCNetworkType) {
    YCNetworkTypeNoConnection = 0,
    YCNetworkTypeWifi,
    YCNetworkTypeGPRS,
    YCNetworkTypeEdge,
    YCNetworkTypeWCDMA,
    YCNetworkTypeHSDPA,
    YCNetworkTypeHSUPA,
    YCNetworkTypeCDMA1x,
    YCNetworkTypeCDMAEVDORev0,
    YCNetworkTypeCDMAEVDORevA,
    YCNetworkTypeCDMAEVDORevB,
    YCNetworkTypeHRPD,
    YCNetworkTypeLTD
};

typedef void (^YCRequestCompleteBlock)(AFHTTPRequestOperation *operation, id data, NSString *error);


@interface RequestManager : NSObject

+ (RequestManager*)sharedRequestManager;
- (YCNetworkType) networkType;

-(void)postToUrl:(NSString *)url
      withParams:(NSDictionary *)params
forCompleteBlock:(YCRequestCompleteBlock)completeBlock;

@end
