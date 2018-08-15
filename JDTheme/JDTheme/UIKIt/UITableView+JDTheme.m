//
//  UITableView+JDTheme.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "UITableView+JDTheme.h"
#import "NSObject+JDTheme.h"

@implementation UITableView (JDTheme)

- (void)jd_applyThemeWithRuleSet:(JDRuleSet *)theme {
    [super jd_applyThemeWithRuleSet:theme];
    
    if (theme.hasSeparatorColor) {
        self.separatorColor = theme.separatorColor;
    }
    
}


@end
