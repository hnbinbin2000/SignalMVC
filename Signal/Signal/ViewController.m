//
//  ViewController.m
//  Signal
//
//  Created by ZhangB on 16/8/29.
//  Copyright © 2016年 ZhangB. All rights reserved.
//

#import "ViewController.h"
#import "UISignal.h"
#import "UIViewController+HttpRequest.h"

#define RequestOnestr @"stream/0/posts/stream/global"

#define HandleUISignal(view,oneSignal) \
- (void)handleUISignal_##view##_##oneSignal:(UISignal *)signal

#define HandleHttpRequest(url) \
- (void)handleHttpRequest_##url:(BeeHttpRequest *)request

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TestView *view = [[TestView alloc]initWithFrame:CGRectMake(10, 10, 200, 200)];
    [self.view addSubview:view];
    
    
    TestView *view2 = [[TestView alloc]initWithFrame:CGRectMake(10, 300, 200, 200)];
    [self.view addSubview:view2];
    
    [TestView testSignalName];
    [TestView BUTTON_TAP];
    
    
    [self sendRequestWithModel:nil KeyURL:RequestOnestr];

    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark UISignal

//model one -- handle one specifed signal
HandleUISignal(TestView,BUTTON_TAP) {
    NSLog(@"handle one specifed signal -->signal route --\n name %@ \n source-%@",signal.name,signal.source);
    
}

//same to model one
//- (void)handleUISignal_TestView_BUTTON_TAP:(UISignal *)signal
//{
//    NSLog(@"signal direct --\n name %@ \n source-%@",signal.name,signal.target);
//}

//model two---handle all uisignal
- (void)handleUISignal:(UISignal *)signal {
    NSLog(@"signal route --\n name %@ \n source-%@",signal.name,signal.target);
}


#pragma mark RequsetSingnal

/*
 *model one cannot be useful.because of the micro define.
 *model two only.
 */


//model one -- handle one specifed url request
//HandleHttpRequest(RequestOnestr) {
//    
//}

//same as model one
//- (void)handleHttpRequest_RequestOnestr:(BeeHttpRequest *)request {
//
//}


//model two -- handel all request
- (void)handleHttpRequest:(BeeHttpRequest *)request {
    if (request.requestState == Succeed) {
        if ([request.URL isEqualToString:RequestOnestr]) {
            
        }
        NSLog(@"request succeed.");
//        NSArray *postsFromResponse = [request.responseObject valueForKeyPath:@"data"];
//        NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
//        for (NSDictionary *attributes in postsFromResponse) {
//            Post *post = [[Post alloc] initWithAttributes:attributes];
//            [mutablePosts addObject:post];
//        }
//        self.posts = mutablePosts;
//        [self.tableView reloadData];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
