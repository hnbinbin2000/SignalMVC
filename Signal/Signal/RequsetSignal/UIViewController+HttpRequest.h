//
//  UIViewController+HttpRequest.h
//  AFNetworking Example
//
//  Created by ZhangB on 16/10/13.
//
//

#import <UIKit/UIKit.h>
#import "BeeHttpRequest.h"
#import "BeeHttpRequestClient.h"
@interface UIViewController (HttpRequest)
- (BeeHttpRequest *)sendRequestWithModel:(NSObject *)model KeyURL:(NSString *)keyUrl;

- (void)handleHttpRequest:(BeeHttpRequest*)request;

@end
