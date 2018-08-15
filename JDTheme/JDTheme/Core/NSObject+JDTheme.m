//
//  NSObject+JDTheme.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "NSObject+JDTheme.h"
#import "JDThemeManager.h"
#import <objc/runtime.h>
#import "UIViewController+JDTheme.h"
#import "JDStyleable.h"

@implementation NSObject (JDTheme)

- (void)setJd_theme_key:(NSString *)jd_theme_key {
    NSAssert([self isKindOfClass:[UIView class]], @"setJd_theme_key方法只能view的子类使用");
    if ([self isKindOfClass:[UIView class]]) {
        [self jd_registerKey:jd_theme_key viewController:[self jd_ThemeViewController:(UIView *)self]];
    }
}

- (NSString *)jd_theme_key {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)jd_registerKey:(NSString *)key viewController:(UIViewController *)vc {
    objc_setAssociatedObject(self, @selector(jd_theme_key), key, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [vc.jd_styleable holdObject:self];
    JDRuleSet *theme = [vc.jd_styleable ruleSetForKey:self.jd_theme_key];
    [self jd_applyThemeWithRuleSet:theme];
}

- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme {

}

- (UIViewController *)jd_ThemeViewController:(UIView *)view {
    UIResponder *responder = view;
    while ((responder = [responder nextResponder])) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
    }
    return nil;
}

@end




