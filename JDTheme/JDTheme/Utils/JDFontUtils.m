//
//  JDFontUtils.m
//  JDTheme
//
//  Created by JD on 2018/8/16.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "JDFontUtils.h"

@implementation JDFontUtils

+ (UIFont *)fontFromRuleSet:(JDRuleSet *)theme {
    UIFont *font = nil;
    if (theme.hasFontSize) {
        if (theme.hasFontName) {
            font = [UIFont fontWithName:theme.fontName size:theme.fontSize];
        } else if (theme.hasFontBold && theme.fontBold) {
            font = [UIFont boldSystemFontOfSize:theme.fontSize];
        } else if (theme.hasFontItalic && theme.fontItalic) {
            font = [UIFont italicSystemFontOfSize:theme.fontSize];
        } else {
            font = [UIFont systemFontOfSize:theme.fontSize];
        }
    }
    return font;
}

@end
