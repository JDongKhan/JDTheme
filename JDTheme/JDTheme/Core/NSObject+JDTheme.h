//
//  NSObject+JDTheme.h
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDRuleSet.h"

@interface NSObject (JDTheme)

/*
 jd_theme_key:主题配置表的key
 */
@property (nonatomic, copy) NSString *jd_theme_key;

/*
 key:主题配置表的key
 vc :当前vi
 */
- (void)jd_registerKey:(NSString *)key viewController:(UIViewController *)vc;

/**
 * 子类重写，收到换肤通知会调用本方法
 */
- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme;

@end

