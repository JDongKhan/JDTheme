//
//  UITabBar+JDTheme.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "UITabBar+JDTheme.h"
#import "NSObject+JDTheme.h"

@implementation UITabBar (JDTheme)

- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme {
    [super jd_applyThemeWithRuleSet:theme];
    
    if (theme.hasBackgroundColor) {
        self.backgroundColor = theme.backgroundColor;
    }
    
    if (theme.hasBarTintColor) {
        self.barTintColor = theme.barTintColor;
    }
    
    if (theme.hasTranslucent) {
        self.translucent = theme.translucent;
    }
    
}

@end
