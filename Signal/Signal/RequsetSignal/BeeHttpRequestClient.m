//
//  BeeHttpRequestClient.m
//  AFNetworking Example
//
//  Created by ZhangB on 16/10/13.
//
//

#import "BeeHttpRequestClient.h"
static NSString * const AFAppDotNetAPIBaseURLString = @"https://api.app.net/";

@implementation BeeHttpRequestClient
+ (instancetype)sharedClient {
    static BeeHttpRequestClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[BeeHttpRequestClient alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

@end
