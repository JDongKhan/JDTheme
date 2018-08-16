//
//  UITextField+JDTheme.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "UITextField+JDTheme.h"
#import "NSObject+JDTheme.h"
#import "JDFontUtils.h"

@implementation UITextField (JDTheme)

- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme {
    [super jd_applyThemeWithRuleSet:theme];
    
    if (theme.hasText) {
        self.text = theme.text;
    }
    
    if (theme.hasTextColor) {
        self.textColor = theme.textColor;
    }
    
    UIFont *font = [JDFontUtils fontFromRuleSet:theme];
    if (font) {
        self.font = font;
    }
    
    if (theme.hasTextAlignment) {
        self.textAlignment = theme.textAlignment;
    }
    
    if (theme.hasPlaceholder) {
        self.placeholder = theme.placeholder;
    }
}

@end
