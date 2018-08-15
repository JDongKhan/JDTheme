//
//  JDRuleSet.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "JDRuleSet.h"
#import "UIColor+JDExtension.h"
#import "UIImage+JDExtension.h"

@implementation JDRuleSet

- (instancetype)initWithDictionary:(NSDictionary *)dictionary bundle:(NSBundle *)bundle {
    if (self = [super init]) {
        NSArray *allKeys = dictionary.allKeys;
        //view
        _hasBackgroundColor = [allKeys containsObject:@"backgroundColor"];
        if (_hasBackgroundColor) {
            _backgroundColor = [UIColor jd_colorWithHexString:dictionary[@"backgroundColor"]];
        }
        
        _hasBorderColor = [allKeys containsObject:@"borderColor"];
        if (_hasBorderColor) {
            _borderColor = [UIColor jd_colorWithHexString:dictionary[@"borderColor"]];
        }
        
        _hasBorderWidth = [allKeys containsObject:@"borderWidth"];
        if (_hasBorderWidth) {
            _borderWidth = [dictionary[@"borderWidth"] floatValue];
        }
        
        _hasCornerRadius = [allKeys containsObject:@"cornerRadius"];
        if (_hasCornerRadius) {
            _cornerRadius = [dictionary[@"cornerRadius"] floatValue];
        }
        
        _hasBackgroundImage = [allKeys containsObject:@"backgroundImage"];
        if (_hasBackgroundImage) {
            _backgroundImage = [UIImage jd_imageWithImage:dictionary[@"backgroundImage"] bundle:bundle];
        }
        
        _hasFrame = [allKeys containsObject:@"frame"];
        if (_hasFrame) {
            _frame = CGRectZero;
        }
        
        _hasTintColor = [allKeys containsObject:@"tintColor"];
        if (_hasTintColor) {
            _tintColor = [UIColor jd_colorWithHexString:dictionary[@"tintColor"]];
        }
        
        //image
        _hasImage = [allKeys containsObject:@"image"];
        if (_hasImage) {
            _image = [UIImage jd_imageWithImage:dictionary[@"image"] bundle:bundle];
        }
        
        //button
        _hasSelectedImage = [allKeys containsObject:@"selectedImage"];
        if (_hasSelectedImage) {
            _selectedImage = [UIImage jd_imageWithImage:dictionary[@"selectedImage"] bundle:bundle];
        }
        
        _hasSelectedTextColor = [allKeys containsObject:@"selectedTextColor"];
        if (_hasSelectedTextColor) {
            _selectedTextColor = [UIColor jd_colorWithHexString:dictionary[@"selectedTextColor"]];
        }
        
        //label
        _hasFont = [allKeys containsObject:@"font"];
        if (_hasFont) {
            CGFloat font = [dictionary[@"font"] floatValue];
            _font = [UIFont systemFontOfSize:font];
        }
        
        _hasText = [allKeys containsObject:@"text"];
        if(_hasText) {
            _text = dictionary[@"text"];
        }
        
        _hasTextColor = [allKeys containsObject:@"textColor"];
        if (_hasTextColor) {
            _textColor = [UIColor jd_colorWithHexString:dictionary[@"textColor"]];
        }
        
        _hasTextAlignment = [allKeys containsObject:@"textAlignment"];
        if (_hasTextAlignment) {
            _textAlignment = [dictionary[@"textAlignment"] integerValue];
        }
        
        _hasLineBreakMode = [allKeys containsObject:@"lineBreakMode"];
        if (_hasLineBreakMode) {
            _lineBreakMode = [dictionary[@"lineBreakMode"] integerValue];
        }
        
        _hasNumberOfLines = [allKeys containsObject:@"numberOfLines"];
        if (_hasNumberOfLines) {
            _numberOfLines = [dictionary[@"numberOfLines"] integerValue];
        }
        
        //textView
        _hasEditable = [allKeys containsObject:@"editable"];
        if (_hasEditable) {
            _editable = [dictionary[@"editable"] floatValue];
        }
        
        //textField
        _hasPlaceholder = [allKeys containsObject:@"placeholder"];
        if(_hasPlaceholder) {
            _placeholder = dictionary[@"placeholder"];
        }
        
        //tableView
        _hasSeparatorColor = [allKeys containsObject:@"separatorColor"];
        if (_hasSeparatorColor) {
            _separatorColor = [UIColor jd_colorWithHexString:dictionary[@"separatorColor"]];
        }
        
        //Switch
        _hasChecked = [allKeys containsObject:@"checked"];
        if (_hasChecked) {
            _checked = [dictionary[@"checked"] boolValue];
        }
        
        //navigation
        _hasTranslucent = [allKeys containsObject:@"translucent"];
        if (_hasTranslucent) {
            _translucent = [dictionary[@"translucent"] boolValue];
        }

        _hasShadowImage = [allKeys containsObject:@"shadowImage"];
        if (_hasShadowImage) {
            _shadowImage = [UIImage jd_imageWithImage:dictionary[@"shadowImage"] bundle:bundle];
        }
    
        _hasStatusBarStyle = [allKeys containsObject:@"statusBarStyle"];
        if (_hasStatusBarStyle) {
            _statusBarStyle = [dictionary[@"statusBarStyle"] integerValue];
        }
        
        _hasBarTintColor = [allKeys containsObject:@"barTintColor"];
        if (_hasBarTintColor) {
            _barTintColor = [UIColor jd_colorWithHexString:dictionary[@"barTintColor"]];
        }
    }
    return self;
}

@end
