//
//  UIViewController+HttpRequest.m
//  AFNetworking Example
//
//  Created by ZhangB on 16/10/13.
//
//

#import "UIViewController+HttpRequest.h"

@implementation UIViewController (HttpRequest)
- (BeeHttpRequest *)sendRequestWithModel:(NSObject *)model KeyURL:(NSString *)keyUrl {
    NSDictionary *dic = @{@"key":@"b"};

    BeeHttpRequest *request = [[BeeHttpRequest alloc]init];
    request.URL = keyUrl;
    request.task = [[BeeHttpRequestClient sharedClient]GET:keyUrl parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
        request.requestState = Receiving;
        request.progress = downloadProgress;
        
        [self routeHttpRequest:request];
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        request.task = task;
        request.responseObject = responseObject;
        request.requestState = Succeed;
        
        [self routeHttpRequest:request];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        request.requestState = Failed;
        request.error = error;
        
        [self routeHttpRequest:request];
    }];
    
    return request;
}

- (void) routeHttpRequest:(BeeHttpRequest*)request{
    

    NSString * cachedSelectorName = [NSString stringWithFormat:@"handleHttpRequest_%@:",request.URL];
    
    SEL defaultSelector = NSSelectorFromString(@"handleHttpRequest:");
    
    if ( cachedSelectorName )
    {
        SEL cachedSelector = NSSelectorFromString( cachedSelectorName );
        //试图去找对应的方法.
        if([self respondsToSelector:cachedSelector])
        {
            IMP imp = [self methodForSelector:cachedSelector];
            void (*func)(id, SEL,BeeHttpRequest*) = (void *)imp;
            func(self,cachedSelector,request);
        }
        else if([self respondsToSelector:defaultSelector])
        {
            IMP imp = [self methodForSelector:defaultSelector];
            void (*func)(id, SEL,BeeHttpRequest*) = (void *)imp;
            func(self,cachedSelector,request);
            
            //            [vc handleUISignal:signal];
        }
        
    }
    

}

- (void)handleHttpRequest:(BeeHttpRequest*)request{

}
@end
