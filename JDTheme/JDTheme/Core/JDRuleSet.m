//
//  JDRuleSet.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "JDRuleSet.h"
#import "JDColorUtils.h"
#import "JDImageUtils.h"
#import "JDFontUtils.h"
#import "JDThemeManager.h"
#import <objc/runtime.h>
#import "JDStyleable.h"

@implementation JDRuleSet {
    NSDictionary *_allDictionary;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        _allDictionary = dictionary;
        //_allDictionary = [self testDic];
        [self parseObject];
    }
    return self;
}

- (NSDictionary *)testDic {
    return @{
             @"backgroundColor" : @"#000000",
             @"backgroundImage" : @"111",
             @"borderWidth" : @"1",
             @"frame" : @"{{0,0},{10,10}}",
             @"textShadowOffset" : @"{100,100}",
             @"center" : @"{100,100}",
             @"text" : @"白色",
             @"font" : @"17",
             @"textColor" : @"#444",
             @"textAlignment" : @"1",
             @"lineBreakMode" : @"1",
             @"numberOfLines" : @"0",
             @"editable" : @"YES",
             @"statusBarStyle" : @"1"
             };
}

- (void)parseObject {
    [_allDictionary enumerateKeysAndObjectsUsingBlock:^(NSString  *key, NSString *obj, BOOL * _Nonnull stop) {
        NSString *hasKey = [@"has" stringByAppendingString:[[key substringToIndex:1] uppercaseString]];
        hasKey = [hasKey stringByAppendingString:[key substringFromIndex:1]];
        [self setValue:@(YES) forKey:hasKey];
        [self _saveValue:obj forKey:key];
    }];
}

- (void)_saveValue:(NSString *)obj forKey:(NSString *)key {
    NSString *type = [JDRuleSet _getPropertyType:key];
    id value = obj;
    if ([type isEqualToString:@"UIColor"]) {
        value = [JDColorUtils colorWithHexString:obj];
    } else if ([type isEqualToString:@"UIImage"]) {
        value = [JDImageUtils imageWithImage:obj bundle:JDThemeManager.sharedInstance.bundle];
    } else if ([type isEqualToString:@"UIFont"]) {
        value = [JDFontUtils fontFromDictionary:obj];
    } else if ([type isEqualToString:@"UIView"]) {
        if ([@"relativeToView" isEqualToString:key]) {
            value = [[JDStyleable sharedInstance] objectById:value];
        }
    } else if ([type hasPrefix:@"CGRect"]) {
        value = [NSValue valueWithCGRect:CGRectFromString(value)];
    } else if ([type hasPrefix:@"CGSize"]) {
        value = [NSValue valueWithCGSize:CGSizeFromString(value)];
    } else if ([type hasPrefix:@"CGPoint"]) {
        value = [NSValue valueWithCGPoint:CGPointFromString(value)];
    }
    [self setValue:value forKey:key];
}

+ (NSString *)_getPropertyType:(NSString *)property {
    //获取对象的类型objc_getClass("UserModel")
    objc_property_t p = class_getProperty(self, property.UTF8String);
    if (!p) {
        return nil;
    }
    NSString *attrs = @(property_getAttributes(p));
    
    NSString *code = nil;
    NSUInteger loc = 3;
    
    NSUInteger dotLoc = [attrs rangeOfString:@","].location;
    if (dotLoc == NSNotFound) { // 没有,
        code = [attrs substringFromIndex:loc];
        return code;
    }
    NSUInteger atLoc = [attrs rangeOfString:@"@"].location;
    if (atLoc != NSNotFound) {
        NSUInteger lenght = dotLoc - loc -1;
        code = [attrs substringWithRange:NSMakeRange(loc, lenght)];
        return code;
    }
    
    NSString *typeCode = [attrs substringWithRange:NSMakeRange(1, 1)];
    if ([@"{" isEqualToString:typeCode]) {
        NSUInteger eqLoc = [attrs rangeOfString:@"="].location;
        NSUInteger lenght = eqLoc - 2;
        code =  [attrs substringWithRange:NSMakeRange(2, lenght)];
    }
    return code;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"key:%@ not found",key);
}

- (void)addRuleSet:(JDRuleSet *)ruleSet {
    if (ruleSet == nil) {
        return;
    }
    NSDictionary *ruleSetDic = ruleSet->_allDictionary;
    [ruleSetDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (![self->_allDictionary.allKeys containsObject:key]) {
            NSString *hasKey = [@"has" stringByAppendingString:[[key substringToIndex:1] uppercaseString]];
            hasKey = [hasKey stringByAppendingString:[key substringFromIndex:1]];
            [self setValue:@(YES) forKey:hasKey];
            [self _saveValue:obj forKey:key];
        }
    }];
}

#pragma mark ------用于调试---------

- (NSString *)description {
    return [self descriptionPrivate];
}

- (NSString *)debugDescription {
    return [self descriptionPrivate];
}

- (NSString *)descriptionPrivate {
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"{\t\n "];
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        if (![key hasPrefix:@"has"]) {
            NSString *hasKey = [@"has" stringByAppendingString:[[key substringToIndex:1] uppercaseString]];
            hasKey = [hasKey stringByAppendingString:[key substringFromIndex:1]];
            BOOL hasValue = [[self valueForKey:hasKey] boolValue];
            if (hasValue) {
                id value= [self valueForKey:key];
                [str appendFormat:@"\t \"%@\" = %@,\n",key, value];
            }
        }
    }
    [str appendString:@"}"];
    free(properties);
    return str;
}



@end
