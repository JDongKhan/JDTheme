//
//  UIPageControl+JDTheme.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "UIPageControl+JDTheme.h"
#import "NSObject+JDTheme.h"

@implementation UIPageControl (JDTheme)

- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme {
    [super jd_applyThemeWithRuleSet:theme];
    
    if (theme.hasTextColor) {
        self.pageIndicatorTintColor = theme.textColor;
    }
    
    if (theme.hasSelectedTextColor) {
        self.currentPageIndicatorTintColor = theme.selectedTextColor;
    }
    
}


@end
