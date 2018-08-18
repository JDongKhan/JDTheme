//
//  JDImageUtils.m
//  JDTheme
//
//  Created by JD on 2018/8/17.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "JDImageUtils.h"

@implementation JDImageUtils

+ (UIImage *)imageWithImage:(NSString *)imageName bundle:(NSBundle *)bundle {
    if (imageName == nil) {
        return nil;
    }
    UIImage *image = [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
    if (!image) {
        NSString *imagePath = [bundle.bundlePath stringByAppendingPathComponent:imageName];
        image = [UIImage imageWithContentsOfFile:imagePath];
    }
    return image;
}


@end
