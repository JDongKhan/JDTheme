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

@property (nonatomic, strong, readonly) NSBundle *bundle;           //主题bundle

@property (nonatomic, assign, readonly) NSString *themeName;  //当前主题名称

+ (instancetype)sharedInstance;

//修改主题
- (BOOL)setTheme:(NSString *)themeName;

@end
