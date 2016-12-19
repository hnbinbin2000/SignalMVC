//
//  UISignalBus.m
//  Signal
//
//  Created by ZhangB on 16/8/29.
//  Copyright © 2016年 ZhangB. All rights reserved.
//

#import "UISignalBus.h"
#import "UIView+Signal.h"

@implementation UISignalBus
DEF_SINGLETON(UISignalBus);

+ (BOOL)send:(UISignal *)signal
{
    return [[UISignalBus sharedInstance] send:signal];
}
- (BOOL)send:(UISignal *)signal
{
    UIViewController *vc = (UIViewController *)[signal.target signalTarget];
//    [vc handleUISignal:signal];
    

    NSString *	signalPrefix = nil;
    NSString *	signalClass = nil;
    NSString *	signalMethod = nil;
    
    if ( signal.name && [signal.name hasPrefix:@"signal."] )
    {
        NSArray * array = [signal.name componentsSeparatedByString:@"."];
        if ( array && array.count > 1 )
        {
            signalPrefix = (NSString *)[array objectAtIndex:0];
            signalClass = (NSString *)[array objectAtIndex:1];
            signalMethod = (NSString *)[array objectAtIndex:2];
            
        }
    }
    NSString * cachedSelectorName = [NSString stringWithFormat:@"handleUISignal_%@_%@:",signalClass,signalMethod];
    
    SEL defaultSelector = NSSelectorFromString(@"handleUISignal:");
    
    if ( cachedSelectorName )
    {
        SEL cachedSelector = NSSelectorFromString( cachedSelectorName );
        //试图去找对应的方法.
        if([vc respondsToSelector:cachedSelector])
        {
            IMP imp = [vc methodForSelector:cachedSelector];
            void (*func)(id, SEL,UISignal*) = (void *)imp;
            func(vc,cachedSelector,signal);
        }
        else if([vc respondsToSelector:defaultSelector])
        {
            IMP imp = [vc methodForSelector:defaultSelector];
            void (*func)(id, SEL,UISignal*) = (void *)imp;
            func(vc,cachedSelector,signal);
            
//            [vc handleUISignal:signal];
        }
        
    }
  
    return YES;
}

@end
