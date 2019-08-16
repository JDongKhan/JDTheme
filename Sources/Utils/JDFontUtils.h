//
//  JDFontUtils.h
//  JDTheme
//
//  Created by JD on 2018/8/16.
//  Copyright © 2018年 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDRuleSet.h"

NS_ASSUME_NONNULL_BEGIN

@interface JDFontUtils : NSObject

+ (UIFont *)fontFromDictionary:(id)ruleSetDic;

@end

NS_ASSUME_NONNULL_END
