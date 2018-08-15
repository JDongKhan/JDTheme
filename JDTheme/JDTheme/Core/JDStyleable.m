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

static NSString *const kHasRegistChangedThemeNotification;

@interface JDStyleable()

@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) NSString *styleName;
@property (nonatomic, strong) JDStyleable *parentStyle;

@property (nonatomic, copy, readonly) NSDictionary<NSString *, JDRuleSet *> *ruleSetConfig;

@end

@implementation JDStyleable

- (instancetype)initWithStyleable:(NSString *)styleName parentStyle:(JDStyleable *)parentStyle {
    if (self = [super init]) {
        self.styleName = styleName;
        self.parentStyle = parentStyle;
        [self reloadResource];
        self.array = [NSMutableArray array];
        [self registChangedNotification];
    }
    return self;
}

- (void)registChangedNotification {
    NSNumber *hasRegist = objc_getAssociatedObject(self, &kHasRegistChangedThemeNotification);
    if (hasRegist) {
        return;
    }
    objc_setAssociatedObject(self, &kHasRegistChangedThemeNotification, @(YES), OBJC_ASSOCIATION_COPY_NONATOMIC);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChanged) name:JDThemeChangedNotification object:nil];
}

- (void)reloadResource {
    NSURL *url = [[JDThemeManager sharedInstance].bundle URLForResource:self.styleName withExtension:@"plist"];
    NSDictionary *config = [NSDictionary dictionaryWithContentsOfURL:url];
    _config = config;
    NSMutableDictionary *rulesetDic = [NSMutableDictionary dictionary];
    [config enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, NSDictionary *obj, BOOL * _Nonnull stop) {
        NSDictionary *dic = [self.parentStyle.config objectForKey:key];
        NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithDictionary:obj];
        [newDic addEntriesFromDictionary:dic];
        JDRuleSet *ruleSet = [[JDRuleSet alloc] initWithDictionary:newDic bundle:[JDThemeManager sharedInstance].bundle];
        [rulesetDic setObject:ruleSet forKey:key];
    }];
    _ruleSetConfig = rulesetDic;
}

- (void)themeDidChanged {
    [self reloadResource];
    for (NSObject *obj in self.array) {
        JDRuleSet *theme = [self.viewController.jd_styleable ruleSetForKey:obj.jd_theme_key];
        [obj jd_applyThemeWithRuleSet:theme];
    }
}

- (JDRuleSet *)ruleSetForKey:(NSString *)key {
    return [self.ruleSetConfig objectForKey:key];
}

- (void)dealloc {
     [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end


@implementation JDStyleable(Private)

- (void)holdObject:(NSObject *)object {
    [self.array addObject:object];
}

@end

