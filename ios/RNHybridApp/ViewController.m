//
//  ViewController.m
//  RNHybridApp
//
//  Created by Yasuo Kasajima on 2018/07/06.
//  Copyright © 2018年 kasajei. All rights reserved.
//

#import "ViewController.h"
#import <React/RCTRootView.h>
#import "NavigationManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(disMissEvent) name:NAVIGATION_MANAGER_GO_BACK object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionOfShowApp2:(id)sender {
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
    
    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                moduleName: @"RNHybridApp2"
                         initialProperties:@{@"fromNative" : @"Action Of Show App2 Button"}
                             launchOptions: nil];
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view = rootView;
        [self presentViewController:vc animated:YES completion:nil];
   
}

- (void)disMissEvent{
     [self dismissViewControllerAnimated:YES completion:nil];
}

@end
