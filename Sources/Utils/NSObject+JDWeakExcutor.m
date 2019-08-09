//
//  NSObject+JDWeakExcutor.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "NSObject+JDWeakExcutor.h"
#import <objc/runtime.h>
#import "JDThemeManager.h"


@implementation NSObject (JDWeakExcutor)

- (JDWeakExecutor *)jd_weakExcutor {
    JDWeakExecutor *weakExcutor = objc_getAssociatedObject(self,_cmd);
    if (!weakExcutor) {
        weakExcutor = [[JDWeakExecutor alloc] init];
        weakExcutor.weakObject = self;
        objc_setAssociatedObject(self, _cmd, weakExcutor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return weakExcutor;
}

@end

@implementation JDWeakExecutor

- (void)dealloc {
    if ([JDThemeManager sharedInstance].debug) {
        NSLog(@"JDWeakExecutor:%@",self.weakObject);
    }
}

@end
