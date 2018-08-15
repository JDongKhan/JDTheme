//
//  JDTheme.h
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDThemeManager.h"
#import "JDStyleable.h"
#import "NSObject+JDTheme.h"
#import "UIViewController+JDTheme.h"

#define JDThemeBind(_vc, _var, _key) [_var jd_registerKey:_key viewController:_vc];
