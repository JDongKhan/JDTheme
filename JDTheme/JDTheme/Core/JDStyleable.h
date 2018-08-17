//
//  JDStyleable.h
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDRuleSet.h"

@class JDWeakExecutor;

@interface JDStyleable : NSObject

+ (instancetype)sharedInstance;

- (void)setDefaultStyleableName:(NSString *)name;

- (void)reloadAllObjectStyles:(void(^)(BOOL compeletion))compeletion;

//从配置文件读取配置
- (void)ruleSetForKeyPath:(NSString *)keypath compeletion:(void(^)(JDRuleSet *ruleSet))compeletion;

- (JDRuleSet *)ruleSetForKeyPath:(NSString *)keypath;


- (void)registerObject:(JDWeakExecutor *)object;

- (void)unRegisterObject:(JDWeakExecutor *)object;

@end
