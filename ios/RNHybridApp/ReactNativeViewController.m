//
//  ReactNativeViewController.m
//  RNHybridApp
//
//  Created by Yasuo Kasajima on 2018/07/06.
//  Copyright © 2018年 kasajei. All rights reserved.
//

#import "ReactNativeViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTLog.h>

@interface ReactNativeViewController ()

@end

@implementation ReactNativeViewController
RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(goBack)
{
    RCTLogInfo(@"navigation go back! %@" , [self class]);
    [self goBackNavigation];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
    });
}

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

- (void) goBackNavigation{
    NSLog(@"go back %@", self.navigationController);
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"go back %@", self.navigationController);
        [self.navigationController popViewControllerAnimated:YES];
    });
}

- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
    
    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                moduleName: @"RNHybridApp"
                         initialProperties:@{@"fromNative" : @"Hello RNHybridApp"}
                             launchOptions: nil];
    self.view = rootView;
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
