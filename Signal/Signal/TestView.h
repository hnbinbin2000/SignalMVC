//
//  TestView.h
//  Signal
//
//  Created by ZhangB on 16/8/29.
//  Copyright © 2016年 ZhangB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UISignal.h"
@interface TestView : UIView
AS_SIGNAL(BUTTON_TAP);
- (NSString *)testSignalName; 
+ (NSString *)testSignalName;
@end
