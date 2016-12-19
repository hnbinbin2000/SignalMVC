//
//  UIResponder+Signal.h
//  Signal
//
//  Created by ZhangB on 16/8/29.
//  Copyright © 2016年 ZhangB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UISignal.h"

@interface UIView (Signal)
- (UISignal *)sendUISignal:(NSString *)name;

@end
