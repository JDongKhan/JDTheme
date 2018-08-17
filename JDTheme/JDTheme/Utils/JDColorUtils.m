//
//  JDColorUtils.m
//  JDTheme
//
//  Created by JD on 2018/8/17.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "JDColorUtils.h"

@implementation JDColorUtils


+ (UIColor *)jd_colorWithHexString:(NSString *)hexString {
    if (hexString == nil) {
        return nil;
    }
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat alpha = 0,red = 0, blue = 0, green = 0;
    
    if (colorString.length >= 8) { // #AARRGGBB
        alpha = [self colorComponentFrom:colorString start:0 length:2];
        red   = [self colorComponentFrom:colorString start:2 length:2];
        green = [self colorComponentFrom:colorString start:4 length:2];
        blue  = [self colorComponentFrom:colorString start:6 length:2];
    } else if (colorString.length >= 6) {// #RRGGBB
        alpha = 1.0f;
        red   = [self colorComponentFrom:colorString start:0 length:2];
        green = [self colorComponentFrom:colorString start:2 length:2];
        blue  = [self colorComponentFrom:colorString start:4 length:2];
    } else if (colorString.length >= 4) {// #ARGB
        alpha = [self colorComponentFrom:colorString start:0 length:1];
        red   = [self colorComponentFrom:colorString start:1 length:1];
        green = [self colorComponentFrom:colorString start:2 length:1];
        blue  = [self colorComponentFrom:colorString start:3 length:1];
    } else if (colorString.length == 3) {// #RGB
        alpha = 1.0f;
        red   = [self colorComponentFrom:colorString start:0 length:1];
        green = [self colorComponentFrom:colorString start:1 length:1];
        blue  = [self colorComponentFrom:colorString start:2 length:1];
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length {
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat:@"%@%@", substring, substring];
    unsigned hexComponent;
    NSScanner *scanner = [NSScanner scannerWithString:fullHex];
    [scanner scanHexInt:&hexComponent];
    fullHex = nil;
    substring = nil;
    scanner = nil;
    return hexComponent / 255.0;
}


@end
