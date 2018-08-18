//
//  JDStyleable.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "JDStyleable.h"
#import "JDThemeManager.h"
#import <objc/runtime.h>
#import "NSObject+JDTheme.h"
#import "NSObject+JDDeallocBlock.h"

@interface JDStyleable()

@property (nonatomic, strong, readonly) NSMutableArray<JDWeakExecutor *> *allViews;

@property (nonatomic, strong) NSMutableDictionary *ruleSetConfig;

@end

@implementation JDStyleable {
    dispatch_queue_t _queue;
    dispatch_semaphore_t _semaphore;
    NSString *_globalStyleName;
    JDStyleableParserBlock _parserBlock;
}

+ (instancetype)sharedInstance {
    static JDStyleable *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JDStyleable alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        _allViews = [NSMutableArray array];
        _queue = dispatch_queue_create("com.JDTheme", DISPATCH_QUEUE_CONCURRENT);
        _semaphore = dispatch_semaphore_create(1);
        self.ruleSetConfig = [NSMutableDictionary dictionary];
        _parserBlock = ^(NSString *fileName){
            NSURL *url = [[JDThemeManager sharedInstance].bundle URLForResource:fileName withExtension:@"plist"];
            return [NSDictionary dictionaryWithContentsOfURL:url];
        };
    }
    return self;
}

/**
 设置样式解析器，默认是解析plist文件
 
 @param parserBlock 解析器
 */
- (void)setStyleableParser:(JDStyleableParserBlock)parserBlock {
    _parserBlock = [parserBlock copy];
}

/**
 解析样式文件，并存储到字典缓存中

 @param name 样式文件名称
 */
- (void)loadStyleWithName:(NSString *)name {
    if ([self.ruleSetConfig.allKeys containsObject:name]) {
        return;
    }
    NSDictionary *config = _parserBlock(name);
    if ([JDThemeManager sharedInstance].debug) {
        NSLog(@"[JDTheme] loadStyleWithName:%@  content : %@", name , config);
    }
    NSMutableDictionary *rulesetDic = [NSMutableDictionary dictionary];
    [config enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, NSDictionary *obj, BOOL * _Nonnull stop) {
        NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithDictionary:obj];
        JDRuleSet *ruleSet = [[JDRuleSet alloc] initWithDictionary:newDic];
        [rulesetDic setObject:ruleSet forKey:key];
    }];
    [self.ruleSetConfig setObject:rulesetDic forKey:name];
}


/**
 重新加载所有已经加载过的样式文件
 */
- (void)reloadStyles {
    NSArray *allFiles = self.ruleSetConfig.allKeys;
    [self.ruleSetConfig removeAllObjects];
    for (NSString *fileName in allFiles) {
        [self loadStyleWithName:fileName];
    }
}


/**
 重新加载所有已经加载过的样式文件，并刷新所有使用样式的对象

 @param compeletion 完成block
 */
- (void)reloadAllObjectStyles:(void(^)(BOOL compeletion))compeletion {
    // 在异步函数中执行
    dispatch_async(_queue, ^{
        [self reloadStyles];
        dispatch_async(dispatch_get_main_queue(), ^{
            for (JDWeakExecutor *obj in self.allViews) {
                NSObject *object = obj.weakObject;
                JDRuleSet *ruleSet = [self ruleSetForKeyPath:object.jd_themeKey];
                [object jd_applyThemeWithRuleSet:ruleSet];
            }
            if (compeletion) {
                compeletion(YES);
            }
        });
    });
}

/**
 通过keyPath获取RuleSet

 @param keyPath keyPath

 */
- (JDRuleSet *)ruleSetForKeyPath:(NSString *)keyPath {
    NSString *newKeyPath = [_globalStyleName stringByAppendingString:[keyPath substringFromIndex:[keyPath rangeOfString:@"." options:0].location]];
    JDRuleSet *defaultRuleSet = [self.ruleSetConfig valueForKeyPath:newKeyPath];
    JDRuleSet *ruleSet = [self.ruleSetConfig valueForKeyPath:keyPath];
    [ruleSet addRuleSet:defaultRuleSet];
    return ruleSet;
}

/**
 设置全局样式名称

 @param name 样式文件名称
 */
- (void)setGlobalStyleableName:(NSString *)name {
    _globalStyleName = name;
    [self loadStyleWithName:name];
}


/**
 根据keyPath获取ruleSet

 @param keyPath keyPath
 @param compeletion 完成block
 */
- (void)ruleSetForKeyPath:(NSString *)keyPath  compeletion:(void(^)(JDRuleSet *ruleSet))compeletion {
    dispatch_async(_queue, ^{
        NSString *fileName = [keyPath componentsSeparatedByString:@"."].firstObject;
        dispatch_semaphore_wait(self->_semaphore, DISPATCH_TIME_FOREVER);
        [self loadStyleWithName:fileName];
        dispatch_semaphore_signal(self->_semaphore);
        
        JDRuleSet *ruleSet = [self ruleSetForKeyPath:keyPath];
        if (compeletion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                compeletion(ruleSet);
            });
        }
    });
}

/**
 注册使用样式的对象

 @param object 对象
 */
- (void)registerObject:(JDWeakExecutor *)object {
    [self.allViews addObject:object];
}

/**
 取消使用样式的对象

 @param object 对象
 */
- (void)unRegisterObject:(JDWeakExecutor *)object {
    [self.allViews removeObject:object];
}

@end

