//
//  NSObject+SDDeallocBlock.m
//  SDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "NSObject+JDDeallocBlock.h"
#import <objc/runtime.h>

@interface JDDeallocExecutor : NSObject

@property (nonatomic, copy) void(^deallocExecutorBlock)(void);

@end

@implementation JDDeallocExecutor

- (id)initWithBlock:(void(^)(void))deallocExecutorBlock {
    self = [super init];
    if (self) {
        _deallocExecutorBlock = [deallocExecutorBlock copy];
    }
    return self;
}

- (void)dealloc {
    _deallocExecutorBlock ? _deallocExecutorBlock() : nil;
}

@end


@implementation NSObject (SDDeallocBlock)

- (void)jd_executeAtDealloc:(void (^)(void))block {
    if (block) {
        JDDeallocExecutor *executor = [[JDDeallocExecutor alloc] initWithBlock:block];
        @synchronized (self) {
            [[self hs_deallocExecutors] addObject:executor];
        }
    }
}

- (NSHashTable *)hs_deallocExecutors {
    NSHashTable *table = objc_getAssociatedObject(self,_cmd);
    if (!table) {
        table = [NSHashTable hashTableWithOptions:NSPointerFunctionsStrongMemory];
        objc_setAssociatedObject(self, _cmd, table, OBJC_ASSOCIATION_RETAIN);
    }
    return table;
}

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
    NSLog(@"JDWeakExecutor:%@",self.weakObject);
}

@end
