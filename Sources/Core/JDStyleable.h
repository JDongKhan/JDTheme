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

typedef NSDictionary *(^JDStyleableParserBlock)(NSString *fileName);

@interface JDStyleable : NSObject

+ (instancetype)sharedInstance;


/**
 设置样式解析器，默认是解析plist文件

 @param parserBlock 解析器
 */
- (void)setStyleableParser:(JDStyleableParserBlock)parserBlock;

/**
 设置bundle全局的样式文件

 @param name 样式文件名称
 */
- (void)setGlobalStyleableName:(NSString *)name;

/**
 重新加载所有已经加载过的样式文件，并刷新所有使用样式的对象
 
 @param compeletion 完成block
 */
- (void)reloadAllObjectStyles:(void(^)(BOOL compeletion))compeletion;

/**
 根据keyPath获取ruleSet
 
 @param keyPath keyPath
 @param compeletion 完成block
 */
- (void)ruleSetForKeyPath:(NSString *)keyPath compeletion:(void(^)(JDRuleSet *ruleSet))compeletion;

/**
 通过keyPath获取RuleSet
 
 @param keyPath keyPath
 
 */
- (JDRuleSet *)ruleSetForKeyPath:(NSString *)keyPath;

/**
 注册使用样式的对象
 
 @param object 对象
 */
- (void)registerObject:(JDWeakExecutor *)object forKey:(NSString *)keyPath;

/**
 取消使用样式的对象
 
 @param object 对象
 */
- (void)unRegisterObject:(JDWeakExecutor *)object forKey:(NSString *)keyPath;

/**
 根据ID找object

 @param objectId id
 @return object
 */
- (NSObject *)objectById:(NSString *)objectId;


@end
