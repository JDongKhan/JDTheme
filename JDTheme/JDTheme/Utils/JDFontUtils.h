//
//  JDFontUtils.h
//  JDTheme
//
//  Created by JD on 2018/8/16.
//  Copyright © 2018年 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDRuleSet.h"

@interface JDFontUtils : NSObject

+ (UIFont *)fontFromDictionary:(NSDictionary *)ruleSetDic;

@end
