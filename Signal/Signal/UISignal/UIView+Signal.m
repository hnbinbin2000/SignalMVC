//
//  UIResponder+Signal.m
//  Signal
//
//  Created by ZhangB on 16/8/29.
//  Copyright © 2016年 ZhangB. All rights reserved.
//

#import "UIView+Signal.h"

@implementation UIView (Signal)

- (NSObject *)signalTarget //NSObject 重写实现
{
    UIViewController * nextController = [self viewController];
    if ( nextController )
    {
        return nextController;
    }
    
    return self;
}

- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


- (UISignal *)sendUISignal:(NSString *)name
{
    return [self sendUISignal:name withObject:nil from:self];
}


- (UISignal *)sendUISignal:(NSString *)name withObject:(NSObject *)object from:(id)source
{
    UISignal * signal = [[UISignal alloc]init];
    if ( signal )
    {
        signal.source = source ? source : self;
        signal.target = self; //暂时只是view;
        signal.name = name;
        signal.object = object;
        
        [signal send];
    }
    return signal;
}



- (void)handleUISignal:(UISignal *)signal
{

}



@end
