//
//  MPAPIHelper.m
// Tiprite
//
//  Created by Michael Hon on 12/18/14.
//  Copyright (c) 2014 Michael Hon. All rights reserved.
//

#import "MPAPIHelper.h"

static MPAPIHelper *_helper;

@implementation MPAPIHelper

#pragma mark - Static Methods

+ (MPAPIHelper*)Helper {
    
    if (_helper == nil) {
        
        _helper = [[MPAPIHelper alloc] init];
    }
    
    return _helper;
}

#pragma mark - Public Methods

// For Tiprite APIs

- (void)postWithUrl: (NSString*)url params: (NSDictionary*)params completion: (void(^)(id response,AFHTTPRequestOperation *operation, NSString *error)) completion {
    if (_isProcessing) {
        completion (nil, nil,@"Another API call is in processing.");
        return;
    }
    if (params == nil) {
        params = [NSDictionary dictionary];
    }
    
    NSDictionary *parameters = [params mutableCopy];// [self addCredentialsToParameters: [params mutableCopy]];
    
    [_manager.requestSerializer setValue:@"uKohUYb61miytTSo5bv3lQ__" forHTTPHeaderField:@"Custom-Auth-Key"];
    //PSLog(@"%@",url);
    [_manager POST: url
        parameters: parameters
           success:^(AFHTTPRequestOperation *operation, id responseObject) {
               
               NSDictionary *response = (NSDictionary*)responseObject;
               //请求成功
               if ([response[@"ResultCode"] integerValue] == 1) {
                   completion (response, operation,nil);
               } else {
                   completion (nil, operation,response[@"ErrorMessage"]);
               }
           }
           failure:^(AFHTTPRequestOperation *operation, NSError *error) {
               if (error != nil) {
                   completion (nil, operation,[error localizedDescription]);
               }else {
                   completion (nil, operation,@"请检查网络");
                   //completion (nil, ERROR_NETWORK);
               }
           }
     ];
}

// For Google Place APIs

- (void)getWithUrl: (NSString*)url params: (NSDictionary*)params completion: (void(^)(id response, NSString *error)) completion {
    
    if (_isProcessing) {
        
        completion (nil, @"Another API call is in processing.");
        return;
    }
    
    if (params == nil) {
        
        params = [NSDictionary dictionary];
    }
    
    [_manager GET: url
       parameters: params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
           
              NSDictionary *response = (NSDictionary*)responseObject;
            
              if (![response[@"status"] isEqualToString: @"OK"] &&
                  ![response[@"status"] isEqualToString: @"ZERO_RESULTS"]) {
                  
                  NSLog(@"Error = %@", response[@"error_message"]);
                  
                  completion (nil, @"Something went wrong.");
              }
              else {
                  
                  completion (response, nil);
              }
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              
              if (error != nil) {
                  completion (nil, [error localizedDescription]);
              }else {
                  //completion (nil, ERROR_NETWORK);
              }
          }
     ];
}

#pragma mark - Private Methods

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        _manager = [AFHTTPRequestOperationManager manager];
        _manager.responseSerializer.acceptableContentTypes = [_manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        
        _isProcessing = NO;
    }
    
    return self;
}

//- (NSDictionary*)addCredentialsToParameters: (NSMutableDictionary*)params
//{
//    MPUser *me = [MPUser Me];
//    
//    if (me.security == nil || [me.security isEqualToString: @""]) {
//        
//        return params;
//    }
//    
//    params[@"user_id"] = me._id;
//    params[@"security"] = me.security;
//    
//    return params;
//}

@end
