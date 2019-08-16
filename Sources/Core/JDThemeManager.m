//
//  JDThemeManager.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "JDThemeManager.h"
#import "JDStyleable.h"

NSString * const JDThemeChangedNotification = @"JDThemeChangedNotification";

@interface JDThemeManager()

@end

@implementation JDThemeManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static JDThemeManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[JDThemeManager alloc] init];
    });
    return instance;
}

- (void)reloadBundle:(NSBundle *)bundle {
    [JDStyleable sharedInstance].bundle = bundle;
    //刷新所有样式表
    [[JDStyleable sharedInstance] reloadAllObjectStyles:^(BOOL compeletion) {
        [self sendChangeThemeNotification];
    }];
}

- (void)setBundle:(NSBundle *)bundle {
    [JDStyleable sharedInstance].bundle = bundle;
}

- (NSBundle *)bundle {
    return [JDStyleable sharedInstance].bundle;
}

- (void)sendChangeThemeNotification {
    [[NSNotificationCenter defaultCenter] postNotificationName:JDThemeChangedNotification object:nil];
}

@end
