//
//  UIImageView+JDTheme.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "UIImageView+JDTheme.h"
#import "NSObject+JDTheme.h"

@implementation UIImageView (JDTheme)

- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme {
    [super jd_applyThemeWithRuleSet:theme];
    if (theme.hasImage) {
        self.image = theme.image;
    }
}

@end
