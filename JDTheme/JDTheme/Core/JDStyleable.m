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
#import "UIViewController+JDTheme.h"
#import "NSObject+JDTheme.h"
#import "NSObject+JDDeallocBlock.h"

@interface JDStyleable()

@property (nonatomic, strong, readonly) NSMutableArray<JDWeakExecutor *> *allViews;

@property (nonatomic, strong) NSMutableDictionary *ruleSetConfig;

@end

@implementation JDStyleable {
    dispatch_queue_t _queue;
    dispatch_semaphore_t _semaphore;
    NSString *_defaultStyleName;
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
        [self registChangedNotification];
    }
    return self;
}

- (void)registChangedNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChanged) name:JDThemeChangedNotification object:nil];
}

- (void)loadStyleWithName:(NSString *)name {
    if ([self.ruleSetConfig.allKeys containsObject:name]) {
        return;
    }
    NSLog(@"JDTheme loadStyleWithName:%@",name);
    NSURL *url = [[JDThemeManager sharedInstance].bundle URLForResource:name withExtension:@"plist"];
    NSDictionary *config = [NSDictionary dictionaryWithContentsOfURL:url];
    NSMutableDictionary *rulesetDic = [NSMutableDictionary dictionary];
    [config enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, NSDictionary *obj, BOOL * _Nonnull stop) {
        NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithDictionary:obj];
        JDRuleSet *ruleSet = [[JDRuleSet alloc] initWithDictionary:newDic];
        [rulesetDic setObject:ruleSet forKey:key];
    }];
    [self.ruleSetConfig setObject:rulesetDic forKey:name];
}

- (void)reloadStyles {
    NSArray *allFiles = self.ruleSetConfig.allKeys;
    [self.ruleSetConfig removeAllObjects];
    for (NSString *fileName in allFiles) {
        [self loadStyleWithName:fileName];
    }
}

- (void)themeDidChanged {
    // 在异步函数中执行
    dispatch_async(_queue, ^{
        [self reloadStyles];
        for (JDWeakExecutor *obj in self.allViews) {
            NSObject *object = obj.weakObject;
            JDRuleSet *ruleSet = [self ruleSetForKeyPath:object.jd_themeKey];
            dispatch_async(dispatch_get_main_queue(), ^{
                [object jd_applyThemeWithRuleSet:ruleSet];
            });
        }
    });
}

- (JDRuleSet *)ruleSetForKeyPath:(NSString *)keypath {
    NSString *newKeyPath = [_defaultStyleName stringByAppendingString:[keypath substringFromIndex:[keypath rangeOfString:@"." options:0].location]];
    JDRuleSet *defaultRuleSet = [self.ruleSetConfig valueForKeyPath:newKeyPath];
    JDRuleSet *ruleSet = [self.ruleSetConfig valueForKeyPath:keypath];
    [ruleSet addRuleSet:defaultRuleSet];
    return ruleSet;
}

- (void)setDefaultStyleableName:(NSString *)name {
    _defaultStyleName = name;
    [self loadStyleWithName:name];
}

- (void)ruleSetForKeyPath:(NSString *)keypath  compeletion:(void(^)(JDRuleSet *ruleSet))compeletion {
    dispatch_async(_queue, ^{
        NSString *fileName = [keypath componentsSeparatedByString:@"."].firstObject;
        dispatch_semaphore_wait(self->_semaphore, DISPATCH_TIME_FOREVER);
        [self loadStyleWithName:fileName];
        dispatch_semaphore_signal(self->_semaphore);
        
        JDRuleSet *ruleSet = [self ruleSetForKeyPath:keypath];
        if (compeletion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                compeletion(ruleSet);
            });
        }
    });
}

- (void)registerObject:(JDWeakExecutor *)object {
    [self.allViews addObject:object];
}

- (void)unRegisterObject:(JDWeakExecutor *)object {
    [self.allViews removeObject:object];
}

- (void)dealloc {
     [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

