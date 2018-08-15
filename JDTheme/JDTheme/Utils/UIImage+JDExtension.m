//
//  UIImage+JDExtension.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "UIImage+JDExtension.h"

@implementation UIImage (JDExtension)

+ (UIImage *)jd_imageWithImage:(NSString *)imageName bundle:(NSBundle *)bundle {
    if (imageName == nil) {
        return nil;
    }
    UIImage *image = [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
    if (!image) {
        NSString *imagePath = [[bundle.bundlePath stringByAppendingPathComponent:imageName] stringByAppendingPathExtension:@"png"];
        image = [UIImage imageWithContentsOfFile:imagePath];
    }
    return image;
}

@end
