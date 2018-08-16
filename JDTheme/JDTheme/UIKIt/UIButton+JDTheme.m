//
//  UIButton+JDTheme.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "UIButton+JDTheme.h"
#import "NSObject+JDTheme.h"
#import "JDFontUtils.h"

@implementation UIButton (JDTheme)

- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme {
    [super jd_applyThemeWithRuleSet:theme];
    
    if (theme.hasText) {
        [self setTitle:theme.text forState:UIControlStateNormal];
    }
    
    if (theme.hasTextColor) {
        [self setTitleColor:theme.textColor forState:UIControlStateNormal];
    }
    
    if (theme.hasSelectedTextColor) {
        [self setTitleColor:theme.selectedTextColor forState:UIControlStateSelected];
    }
    
    if (theme.hasImage) {
        [self setImage:theme.image forState:UIControlStateNormal];
    }
    
    if (theme.hasSelectedImage) {
        [self setImage:theme.selectedImage forState:UIControlStateSelected];
    }
    
    UIFont *font = [JDFontUtils fontFromRuleSet:theme];
    if (font) {
        self.titleLabel.font = font;
    }
    
    if (theme.hasNumberOfLines) {
        self.titleLabel.numberOfLines = theme.numberOfLines;
    }
    
    if (theme.hasLineBreakMode) {
        self.titleLabel.lineBreakMode = theme.lineBreakMode;
    }
    
    if (theme.hasBackgroundImage) {
        [self setBackgroundImage:theme.backgroundImage forState:UIControlStateNormal];
    }
    
    if (theme.hasSelectedBackgroundImage) {
        [self setBackgroundImage:theme.selectedBackgroundImage forState:UIControlStateSelected];
    }
}

@end
