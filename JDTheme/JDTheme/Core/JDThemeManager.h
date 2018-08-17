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

+ (instancetype)sharedInstance;

//修改主题bundle
- (void)changeBundle:(NSBundle *)bundle;

@end
