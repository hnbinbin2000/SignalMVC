//
//  TestView.m
//  Signal
//
//  Created by ZhangB on 16/8/29.
//  Copyright © 2016年 ZhangB. All rights reserved.
//

#import "TestView.h"

@implementation TestView

DEF_SIGNAL(BUTTON_TAP);
- (NSString *)testSignalName{ return  @"" ;}
+ (NSString *)testSignalName{ return  @"" ;}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];

        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"发送信号" forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 200, 100);
        button.backgroundColor = [UIColor brownColor];
        [self addSubview:button];
        
        [button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)buttonTapped {
    [self sendUISignal:TestView.BUTTON_TAP];
}

@end
