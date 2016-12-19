//
//  UISignal.m
//  Signal
//
//  Created by ZhangB on 16/8/29.
//  Copyright © 2016年 ZhangB. All rights reserved.
//

#import "UISignal.h"
#import "UISignalBus.h"
@implementation NSObject(BeeUISignalResponder)
- (NSObject *)signalTarget
{
    return nil;
}
- (UISignal *)sendUISignal:(NSString *)name
{
    return nil;
}

- (void)handleUISignal:(UISignal *)signal
{

}

@end

@implementation UISignal

- (BOOL)send
{
    return [UISignalBus send:self];
}
@end
