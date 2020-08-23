//
//  AppDelegate.m
//  BPMediator
//
//  Created by iDog on 2020/8/23.
//  Copyright © 2020 iDog. All rights reserved.
//

#import "AppDelegate.h"
#import "OneViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[OneViewController new]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
