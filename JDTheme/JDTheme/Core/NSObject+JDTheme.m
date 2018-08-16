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

- (void)setJd_theme_key:(NSString *)jd_theme_key {
    objc_setAssociatedObject(self, @selector(jd_theme_key), jd_theme_key, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [[JDStyleable sharedInstance] register:self.jd_weakExcutor];
    JDWeakExecutor *execuotr = self.jd_weakExcutor;
    [self jd_executeAtDealloc:^{
        [[JDStyleable sharedInstance] unRegister:execuotr];
    }];
    
    __weak NSObject *weakSelf = self;
    [[JDStyleable sharedInstance] ruleSetForKeyPath:self.jd_theme_key compeletion:^(JDRuleSet *ruleSet) {
        [weakSelf jd_applyThemeWithRuleSet:ruleSet];
    }];
}

- (NSString *)jd_theme_key {
    return objc_getAssociatedObject(self, _cmd);
}


- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme {

}


@end




