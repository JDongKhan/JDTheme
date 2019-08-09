//
//  JDFontUtils.m
//  JDTheme
//
//  Created by JD on 2018/8/16.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "JDFontUtils.h"

@implementation JDFontUtils

+ (UIFont *)fontFromDictionary:(id)ruleSetDic {
    if ([ruleSetDic isKindOfClass:[NSString class]]) {
        return [UIFont systemFontOfSize:[ruleSetDic floatValue]];
    }
    UIFont *font = nil;
    NSString *fontSize = [ruleSetDic objectForKey:@"size"];
    NSString *fontName = [ruleSetDic objectForKey:@"name"];
    NSString *fontBold = [ruleSetDic objectForKey:@"bold"];
    NSString *fontItalic = [ruleSetDic objectForKey:@"italic"];
    
    if (fontSize) {
        if (fontName) {
            font = [UIFont fontWithName:fontName size:fontSize.floatValue];
        } else if (fontBold) {
            font = [UIFont boldSystemFontOfSize:fontSize.floatValue];
        } else if (fontItalic) {
            font = [UIFont italicSystemFontOfSize:fontSize.floatValue];
        } else {
            font = [UIFont systemFontOfSize:fontSize.floatValue];
        }
    }
    return font;
}

@end
