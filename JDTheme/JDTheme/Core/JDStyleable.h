//
//  JDStyleable.h
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDRuleSet.h"

@interface JDStyleable : NSObject

@property (nonatomic, copy, readonly) NSDictionary<NSString *, NSDictionary *> *config;

@property (nonatomic, weak) UIViewController *viewController;

//加载配置文件
- (instancetype)initWithStyleable:(NSString *)styleName parentStyle:(JDStyleable *)parentStyle;

//从配置文件读取配置
- (JDRuleSet *)ruleSetForKey:(NSString *)key;

@end


@interface JDStyleable(Private)

- (void)holdObject:(NSObject *)object;

@end
