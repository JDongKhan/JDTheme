//
//  UIView+JDTheme.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "UIView+JDTheme.h"
#import "NSObject+JDTheme.h"
#import <JDAutoLayout/UIView+JDAutolayout.h>

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
    
    if (theme.hasFrame) {
        self.frame = theme.frame;
    }
    
    if (theme.hasCenter) {
        self.center = theme.center;
    }
    
    if (theme.hasOpacity) {
        self.alpha = theme.opacity;
    }
    
    if (theme.hasVisible) {
        self.hidden = !theme.visible;
    }
    
    UIView *relativeToView = theme.relativeToView;
    if (relativeToView == nil) {
        relativeToView = self.superview;
    }
    
    if (theme.hasLeft) {
        self.jd_left(relativeToView).jd_equal(theme.left).jd_update();
    }
    
    if (theme.hasTop) {
        self.jd_top(relativeToView).jd_equal(theme.top).jd_update();
    }

    if (theme.hasRight) {
        self.jd_right(relativeToView).jd_equal(theme.right).jd_update();
    }
    
    if (theme.hasBottom) {
        self.jd_bottom(relativeToView).jd_equal(theme.bottom).jd_update();
    }
    
    if (theme.hasWidth) {
        self.jd_width(relativeToView).jd_equal(theme.width).jd_update();
    }
    
    if (theme.hasHeight) {
        self.jd_height(relativeToView).jd_equal(theme.height).jd_update();
    }
    
}

@end
