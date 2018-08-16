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
#import "NSObject+JDDeallocBlock.h"

@implementation NSObject (JDTheme)

- (void)setJd_themeKey:(NSString *)jd_themeKey {
    objc_setAssociatedObject(self, @selector(jd_themeKey), jd_themeKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [[JDStyleable sharedInstance] registerObject:self.jd_weakExcutor];
    JDWeakExecutor *execuotr = self.jd_weakExcutor;
    [self jd_executeAtDealloc:^{
        [[JDStyleable sharedInstance] unRegisterObject:execuotr];
    }];
    
    __weak NSObject *weakSelf = self;
    [[JDStyleable sharedInstance] ruleSetForKeyPath:self.jd_themeKey compeletion:^(JDRuleSet *ruleSet) {
        [weakSelf jd_applyThemeWithRuleSet:ruleSet];
    }];
}

- (NSString *)jd_themeKey {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme {

}

@end




