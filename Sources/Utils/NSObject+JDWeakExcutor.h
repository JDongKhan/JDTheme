//
//  NSObject+JDWeakExcutor.h
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JDWeakExecutor : NSObject

@property (nonatomic, weak) NSObject *weakObject;

@end

@interface NSObject (JDWeakExcutor)

@property (nonatomic, strong, readonly) JDWeakExecutor *jd_weakExcutor;

@end


