//
//  NavigationManager.m
//  RNHybridApp
//
//  Created by Yasuo Kasajima on 2018/07/13.
//  Copyright © 2018年 kasajei. All rights reserved.
//

#import "NavigationManager.h"
#import <React/RCTLog.h>

NSString *const NAVIGATION_MANAGER_GO_BACK = @"NAVIGATION_MANAGER_GO_BACK";

@implementation NavigationManager
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(goBack)
{
    RCTLogInfo(@"navigation go back");
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:NAVIGATION_MANAGER_GO_BACK object:self userInfo:nil];
    });
}
@end
