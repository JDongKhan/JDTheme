//
//  JDThemeManager.h
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const JDThemeChangedNotification;

@interface JDThemeManager : NSObject

@property (nonatomic, strong) NSBundle *bundle;           //主题bundle

@property (nonatomic, assign) BOOL debug;           //是否是debug模式

+ (instancetype)sharedInstance;

//修改主题bundle
- (void)changeBundle:(NSBundle *)bundle;

@end
