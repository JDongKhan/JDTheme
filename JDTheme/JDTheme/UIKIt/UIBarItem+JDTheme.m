//
//  UIBarItem+JDTheme.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "UIBarItem+JDTheme.h"
#import "NSObject+JDTheme.h"

@implementation UIBarItem (JDTheme)

- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme {
    [super jd_applyThemeWithRuleSet:theme];
    
    if (theme.hasText) {
        self.title = theme.text;
    }
    
    if (theme.hasImage) {
        self.image = theme.image;
    }
    
    if (theme.hasSelectedImage) {
        self.selectedImage = theme.selectedImage;
    }
}

@end
