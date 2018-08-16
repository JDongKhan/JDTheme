//
//  JDRuleSet.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "JDRuleSet.h"
#import "UIColor+JDExtension.h"
#import "UIImage+JDExtension.h"
#import "JDThemeManager.h"
#import <objc/runtime.h>

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
             @"frame" : @"{0,0,10,10}}",
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
    NSString *type = [JDRuleSet getPropertyType:key];
    id value = obj;
    if ([type isEqualToString:@"UIColor"]) {
        value = [UIColor jd_colorWithHexString:obj];
    } else if ([type isEqualToString:@"UIImage"]) {
        value = [UIImage jd_imageWithImage:obj bundle:JDThemeManager.sharedInstance.bundle];
    } else if ([type isEqualToString:@"BOOL"]) {
        value = @([obj boolValue]);
    } else if ([type isEqualToString:@"NSInteger"]) {
        value = @([obj integerValue]);
    } else if ([type isEqualToString:@"CGFloat"]) {
        value = @([obj floatValue]);
    } else if ([type isEqualToString:@"UIFont"]) {
        value = [UIFont systemFontOfSize:obj.floatValue];
    } else if ([type hasPrefix:@"GRect"]) {
        return;
    }
    [self setValue:value forKey:key];
}

+(NSString *)getPropertyType:(NSString *)property {
    //获取对象的类型objc_getClass("UserModel")
    objc_property_t p = class_getProperty(self, property.UTF8String);
    // 2.成员类型
    NSString *attrs = @(property_getAttributes(p));
    NSUInteger dotLoc = [attrs rangeOfString:@","].location;
    NSString *code = nil;
    NSUInteger loc = 3;
    if (dotLoc == NSNotFound) { // 没有,
        code = [attrs substringFromIndex:loc];
    } else {
        CGFloat lenght = dotLoc - loc -1;
        if (lenght < 0) {
            lenght = 0;
        }
        code = [attrs substringWithRange:NSMakeRange(loc, lenght)];
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
        id value= [self valueForKey:key];
        [str appendFormat:@"\t \"%@\" = %@,\n",key, value];
    }
    [str appendString:@"}"];
    free(properties);
    return str;
}



@end
