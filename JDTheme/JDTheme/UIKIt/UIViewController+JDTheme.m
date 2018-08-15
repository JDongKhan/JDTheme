//
//  UIViewController+JDTheme.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "UIViewController+JDTheme.h"
#import <objc/runtime.h>

@implementation UIViewController (JDTheme)

- (JDStyleable *)jd_styleable {
    JDStyleable *styleable = objc_getAssociatedObject(self, _cmd);
    return styleable;
}

- (void)setJd_styleable:(JDStyleable *)jd_styleable {
    jd_styleable.viewController = self;
    objc_setAssociatedObject(self, @selector(jd_styleable), jd_styleable, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
