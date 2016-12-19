//
//  UISignalBus.h
//  Signal
//
//  Created by ZhangB on 16/8/29.
//  Copyright © 2016年 ZhangB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import "UISignal.h"

@interface UISignalBus : NSObject
AS_SINGLETON(UISignalBus);

+ (BOOL)send:(UISignal *)signal;
- (BOOL)send:(UISignal *)signal;

@end
