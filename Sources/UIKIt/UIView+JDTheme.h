//
//  UIView+JDTheme.h
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JDTheme)

/**
 无它，仅仅用于支持在xib设置
 */
@property (nonatomic, copy) IBInspectable NSString *jd_themeID;

@end

NS_ASSUME_NONNULL_END
