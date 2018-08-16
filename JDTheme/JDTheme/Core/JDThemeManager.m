//
//  JDThemeManager.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "JDThemeManager.h"

NSString * const JDThemeChangedNotification = @"JDThemeChangedNotification";

@interface JDThemeManager()

@end

@implementation JDThemeManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static JDThemeManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[JDThemeManager alloc] init];
    });
    return instance;
}

- (BOOL)setTheme:(NSString *)themeName {
    NSBundle *bundle = [NSBundle mainBundle];
    if (!self.isDebug) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:themeName withExtension:@"bundle"];
        if (!url) {
            return NO;
        }
        bundle = [NSBundle bundleWithURL:url];
        if (!bundle) {
            return NO;
        }
    }
    _themeName = themeName;
    _bundle = bundle;
    [self sendChangeThemeNotification];
    return YES;
}

- (void)sendChangeThemeNotification {
    [[NSNotificationCenter defaultCenter] postNotificationName:JDThemeChangedNotification object:nil];
}

@end
