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
#import "JDStyleable.h"

@implementation NSObject (JDTheme)

- (void)setJd_themeID:(NSString *)jd_themeID {
    objc_setAssociatedObject(self, @selector(jd_themeID), jd_themeID, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    //设置样式
    __weak NSObject *weakSelf = self;
    [[JDStyleable sharedInstance] ruleSetForKeyPath:self.jd_themeID compeletion:^(JDRuleSet *ruleSet) {
        [[JDStyleable sharedInstance] registerObject:weakSelf forKey:jd_themeID];
        [weakSelf jd_applyThemeWithRuleSet:ruleSet];
    }];
}

- (NSString *)jd_themeID {
    return objc_getAssociatedObject(self, _cmd);
}

/**
 应用样式

 @param theme 样式表
 */
- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme {

}

@end




