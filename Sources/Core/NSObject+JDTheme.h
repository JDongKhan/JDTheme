//
//  NSObject+JDTheme.h
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDRuleSet.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JDTheme)

/*
 jd_themeID:主题配置表的key
 */
@property (nonatomic, copy) NSString *jd_themeID;

/**
 * 子类重写，收到换肤通知会调用本方法
 */
- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme;

@end


NS_ASSUME_NONNULL_END
