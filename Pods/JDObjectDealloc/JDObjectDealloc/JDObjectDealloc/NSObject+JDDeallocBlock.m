//
//  NSObject+JDDeallocBlock.m
//  JDTheme
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


@implementation NSObject (JDDeallocBlock)

- (void)jd_executeAtDealloc:(void (^)(void))block {
    if (block) {
        JDDeallocExecutor *executor = [[JDDeallocExecutor alloc] initWithBlock:block];
        @synchronized (self) {
            [[self jd_deallocExecutors] addObject:executor];
        }
    }
}

- (NSHashTable *)jd_deallocExecutors {
    NSHashTable *table = objc_getAssociatedObject(self,_cmd);
    if (!table) {
        table = [NSHashTable hashTableWithOptions:NSPointerFunctionsStrongMemory];
        objc_setAssociatedObject(self, _cmd, table, OBJC_ASSOCIATION_RETAIN);
    }
    return table;
}

@end
