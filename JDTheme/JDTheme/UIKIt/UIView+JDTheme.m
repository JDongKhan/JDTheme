//
//  UIView+JDTheme.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "UIView+JDTheme.h"
#import "NSObject+JDTheme.h"

@implementation UIView (JDTheme)

- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme {
    [super jd_applyThemeWithRuleSet:theme];
    
    if (theme.hasBackgroundColor) {
        self.backgroundColor = theme.backgroundColor;
    }
    
    if (theme.hasBorderColor) {
        self.layer.borderColor = theme.borderColor.CGColor;
    }
    
    if (theme.hasBorderWidth) {
        self.layer.borderWidth = theme.borderWidth;
    }
    
    if (theme.hasCornerRadius) {
        self.layer.cornerRadius = theme.cornerRadius;
    }
    
    if (theme.hasTintColor) {
        self.tintColor = theme.tintColor;
    }
    
}

@end
