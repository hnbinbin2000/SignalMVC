//
//  UISignal.h
//  Signal
//
//  Created by ZhangB on 16/8/29.
//  Copyright © 2016年 ZhangB. All rights reserved.
//

#import <Foundation/Foundation.h>

#define AS_SIGNAL( __name )	\
        - (NSString *)__name; \
        + (NSString *)__name;

#define DEF_SIGNAL( __name ) \
        - (NSString *)__name \
        { \
            return (NSString *)[[self class] __name]; \
        } \
        + (NSString *)__name \
        { \
            return [NSString stringWithFormat:@"%@.%@.%s",@"signal", [self description], #__name]; \
        }

@class UISignal;

@interface NSObject(BeeUISignalResponder)

- (NSObject *)signalTarget;
- (UISignal *)sendUISignal:(NSString *)name;
- (void)handleUISignal:(UISignal *)signal;

@end



@interface UISignal : NSObject
@property (nonatomic, weak) id					source;
@property (nonatomic, weak) id					target;
@property (nonatomic, strong) NSString *			name;
@property (nonatomic, strong) id					object;


- (BOOL)send;

@end
