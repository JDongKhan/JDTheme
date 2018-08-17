//
//  JDRuleSet.h
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKIt/UIKit.h>

@interface JDRuleSet : NSObject

// view
@property (nonatomic, assign, readonly) BOOL hasBackgroundColor;
@property (nonatomic, strong, readonly) UIColor *backgroundColor;

@property (nonatomic, assign, readonly) BOOL hasBackgroundImage;
@property (nonatomic, strong, readonly) UIImage *backgroundImage;

@property (nonatomic, assign, readonly) BOOL hasBorderColor;
@property (nonatomic, strong, readonly) UIColor *borderColor;

@property (nonatomic, assign, readonly) BOOL hasBorderWidth;
@property (nonatomic, assign, readonly) CGFloat borderWidth;

@property (nonatomic, assign, readonly) BOOL hasCornerRadius;
@property (nonatomic, assign, readonly) CGFloat cornerRadius;

@property (nonatomic, assign, readonly) BOOL hasFrame;
@property (nonatomic, assign, readonly) CGRect frame;

@property (nonatomic, assign, readonly) BOOL hasTintColor;
@property (nonatomic, strong, readonly) UIColor *tintColor;

//image
@property (nonatomic, assign, readonly) BOOL hasImage;
@property (nonatomic, strong, readonly) UIImage *image;

//button
@property (nonatomic, assign, readonly) BOOL hasSelectedBackgroundImage;
@property (nonatomic, strong, readonly) UIImage *selectedBackgroundImage;

@property (nonatomic, assign, readonly) BOOL hasSelectedTextColor;
@property (nonatomic, strong, readonly) UIColor *selectedTextColor;

@property (nonatomic, assign, readonly) BOOL hasSelectedImage;
@property (nonatomic, strong, readonly) UIImage *selectedImage;

//Label
@property (nonatomic, assign, readonly) BOOL hasText;
@property (nonatomic, copy, readonly) NSString *text;

@property (nonatomic, assign, readonly) BOOL hasTextColor;
@property (nonatomic, strong, readonly) UIColor *textColor;

@property (nonatomic, assign, readonly) BOOL hasFontName;
@property (nonatomic, copy, readonly) NSString *fontName;

@property (nonatomic, assign, readonly) BOOL hasFontSize;
@property (nonatomic, assign, readonly) CGFloat fontSize;

@property (nonatomic, assign, readonly) BOOL hasFontBold;
@property (nonatomic, assign, readonly) BOOL fontBold;

@property (nonatomic, assign, readonly) BOOL hasFontItalic;
@property (nonatomic, assign, readonly) BOOL fontItalic;

@property (nonatomic, assign, readonly) BOOL hasTextAlignment;
@property (nonatomic, assign, readonly) NSTextAlignment textAlignment;

@property (nonatomic, assign, readonly) BOOL hasLineBreakMode;
@property (nonatomic, assign, readonly) NSLineBreakMode lineBreakMode;

@property (nonatomic, assign, readonly) BOOL hasNumberOfLines;
@property (nonatomic, assign, readonly) NSInteger numberOfLines;

//textView
@property (nonatomic, assign, readonly) BOOL hasEditable;
@property (nonatomic, assign, readonly) BOOL editable;

//textField
@property (nonatomic, assign, readonly) BOOL hasPlaceholder;
@property (nonatomic, copy, readonly) NSString *placeholder;

//tableView
@property (nonatomic, assign, readonly) BOOL hasSeparatorColor;
@property (nonatomic, strong, readonly) UIColor *separatorColor;

//Switch
@property (nonatomic, assign, readonly) BOOL hasChecked;
@property (nonatomic, assign, readonly) BOOL checked;

//navigation
@property (nonatomic, assign, readonly) BOOL hasTranslucent;
@property (nonatomic, assign, readonly) BOOL translucent;

@property (nonatomic, assign, readonly) BOOL hasShadowImage;
@property (nonatomic, strong, readonly) UIImage *shadowImage;

@property (nonatomic, assign, readonly) BOOL hasStatusBarStyle;
@property (nonatomic, assign, readonly) UIStatusBarStyle statusBarStyle;

@property (nonatomic, assign, readonly) BOOL hasBarTintColor;
@property (nonatomic, strong, readonly) UIColor *barTintColor;

//other
@property (nonatomic, assign, readonly) BOOL hasEnabled;
@property (nonatomic, assign, readonly) BOOL enabled;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (void)addRuleSet:(JDRuleSet *)ruleSet;

@end
