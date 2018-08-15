//
//  UISwitch+JDTheme.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "UISwitch+JDTheme.h"
#import "NSObject+JDTheme.h"

@implementation UISwitch (JDTheme)

- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme {
    [super jd_applyThemeWithRuleSet:theme];
    
    if (theme.hasImage) {
        self.offImage = theme.image;
    }
    
    if (theme.hasSelectedImage) {
        self.onImage = theme.selectedImage;
    }
    
    if (theme.hasChecked) {
        self.on = theme.checked;
    }
}


@end
