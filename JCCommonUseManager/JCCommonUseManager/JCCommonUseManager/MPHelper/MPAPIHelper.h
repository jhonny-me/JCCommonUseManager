//
//  MPAPIHelper.h
// Tiprite
//
//  Created by Michael Hon on 12/18/14.
//  Copyright (c) 2014 Michael Hon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPRequestOperationManager.h>
@interface MPAPIHelper : NSObject
{
    AFHTTPRequestOperationManager *_manager;
    BOOL _isProcessing;
}

+ (MPAPIHelper*)Helper;

- (void)postWithUrl: (NSString*)url params: (NSDictionary*)params completion: (void(^)(id response, AFHTTPRequestOperation *operation,NSString *error)) completion;
- (void)getWithUrl: (NSString*)url params: (NSDictionary*)params completion: (void(^)(id response, NSString *error)) completion;

@end
