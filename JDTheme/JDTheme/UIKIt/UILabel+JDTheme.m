//
//  UILabel+JDTheme.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "UILabel+JDTheme.h"
#import "NSObject+JDTheme.h"
#import "JDFontUtils.h"

@implementation UILabel (JDTheme)

- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme {
    [super jd_applyThemeWithRuleSet:theme];
    
    if (theme.hasText) {
        self.text = theme.text;
    }
    
    if (theme.hasTextColor) {
        self.textColor = theme.textColor;
    }
    
    if (theme.hasFont) {
        self.font = theme.font;
    }
    
    if (theme.hasTextAlignment) {
        self.textAlignment = theme.textAlignment;
    }
    
    if (theme.hasNumberOfLines) {
        self.numberOfLines = theme.numberOfLines;
    }
    
    if (theme.hasLineBreakMode) {
        self.lineBreakMode = theme.lineBreakMode;
    }
}

@end
