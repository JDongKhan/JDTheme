//
//  UINavigationBar+JDTheme.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "UINavigationBar+JDTheme.h"
#import "NSObject+JDTheme.h"
#import <objc/runtime.h>

NSString * const JDStatusBarChangedNotification = @"JDStatusBarChangedNotification";

@implementation UINavigationBar (JDTheme)

- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme {
    [super jd_applyThemeWithRuleSet:theme];
    
    if (theme.hasBarTintColor) {
        self.barTintColor = theme.barTintColor;
    }
    
    if (theme.hasTranslucent) {
        self.translucent = theme.translucent;
    }
    
    if (theme.hasBackgroundImage) {
        [self setBackgroundImage:theme.backgroundImage forBarMetrics:UIBarMetricsDefault];
    }
    
    if (theme.hasShadowImage) {
        self.shadowImage = theme.shadowImage;
    }
    
    if (theme.hasStatusBarStyle) {
        [[UIApplication sharedApplication] setStatusBarStyle:(UIStatusBarStyle)theme.statusBarStyle animated:YES];
        objc_setAssociatedObject(self, @selector(statusBarStyle), @(theme.statusBarStyle), OBJC_ASSOCIATION_COPY_NONATOMIC);
        [[NSNotificationCenter defaultCenter] postNotificationName:JDStatusBarChangedNotification object:nil];
    }
}

- (UIStatusBarStyle)statusBarStyle {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}


@end
