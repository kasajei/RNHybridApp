//
//  NavigationManager.m
//  RNHybridApp
//
//  Created by Yasuo Kasajima on 2018/07/13.
//  Copyright © 2018年 kasajei. All rights reserved.
//

#import "NavigationManager.h"
#import <React/RCTLog.h>

@implementation NavigationManager
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(goBack)
{
    RCTLogInfo(@"navigation go back");
}
@end
