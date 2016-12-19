//
//  BeeHttpRequest.h
//  AFNetworking Example
//
//  Created by ZhangB on 16/10/13.
//
//

#import "AFNetworking.h"

typedef NS_ENUM(NSUInteger, RequestState) {
    Sending,
    Receiving,
    Succeed,
    Failed,
    Cancelled
};

@interface BeeHttpRequest : NSObject
@property(nonatomic, copy)NSString *URL;
@property(nonatomic, strong)NSURLSessionDataTask *task;
@property(nonatomic, strong)NSObject *responseObject;

@property(nonatomic, assign)RequestState requestState;
@property(nonatomic, strong)NSError *error;

@property(nonatomic, strong)NSProgress *progress;
@end
