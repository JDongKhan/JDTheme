//
//  AppDelegate.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "AppDelegate.h"
#import "JDThemeManager.h"
#import "JDStyleable.h"
#import "JDTheme.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    BOOL debug = NO;
    NSBundle *bundle;
    if (debug) {
        bundle = [NSBundle mainBundle];
    } else {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"JDTheme_White" withExtension:@"bundle"];
        bundle = [NSBundle bundleWithURL:url];
    }
    //下面代码属于全局
    [[JDThemeManager sharedInstance] setBundle:bundle];
    
    [JDThemeManager sharedInstance].debug = YES;
    
    [[JDStyleable sharedInstance] setGlobalStyleableName:@"Global"];
    
    UITabBarController *tabBarVC =  (UITabBarController *)self.window.rootViewController;
    
    tabBarVC.tabBar.jd_themeID = @"Style.tabBar";
    
    [tabBarVC.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.jd_themeID = [NSString stringWithFormat:@"Style.index_%ld",idx];
    }];
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
