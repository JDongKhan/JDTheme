//
//  JDRuleSet.h
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKIt/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

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

@property (nonatomic, assign, readonly) BOOL hasOpacity;
@property (nonatomic, assign, readonly) CGFloat opacity;

@property (nonatomic, assign, readonly) BOOL hasVisible;
@property (nonatomic, assign, readonly) BOOL visible;

@property (nonatomic, assign, readonly) BOOL hasFrame;
@property (nonatomic, assign, readonly) CGRect frame;

@property (nonatomic, assign, readonly) BOOL hasTintColor;
@property (nonatomic, strong, readonly) UIColor *tintColor;

@property (nonatomic, assign, readonly) BOOL hasCenter;
@property (nonatomic, assign, readonly) CGPoint center;

@property (nonatomic, assign, readonly) BOOL hasRelativeToView;
@property (nonatomic, copy, readonly)   UIView *relativeToView;

@property (nonatomic, assign, readonly) BOOL hasLeft;
@property (nonatomic, assign, readonly) CGFloat left;

@property (nonatomic, assign, readonly) BOOL hasTop;
@property (nonatomic, assign, readonly) CGFloat top;

@property (nonatomic, assign, readonly) BOOL hasRight;
@property (nonatomic, assign, readonly) CGFloat right;

@property (nonatomic, assign, readonly) BOOL hasBottom;
@property (nonatomic, assign, readonly) CGFloat bottom;

@property (nonatomic, assign, readonly) BOOL hasWidth;
@property (nonatomic, assign, readonly) CGFloat width;

@property (nonatomic, assign, readonly) BOOL hasHeight;
@property (nonatomic, assign, readonly) CGFloat height;

@property (nonatomic, assign, readonly) BOOL hasCenterX;
@property (nonatomic, assign, readonly) CGFloat centerX;

@property (nonatomic, assign, readonly) BOOL hasCenterY;
@property (nonatomic, assign, readonly) CGFloat centerY;

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

@property (nonatomic, assign, readonly) BOOL hasTextShadowColor;
@property (nonatomic, strong, readonly) UIColor *textShadowColor;

@property (nonatomic, assign, readonly) BOOL hasTextShadowOffset;
@property (nonatomic, assign, readonly) CGSize textShadowOffset;


//Label
@property (nonatomic, assign, readonly) BOOL hasText;
@property (nonatomic, copy, readonly) NSString *text;

@property (nonatomic, assign, readonly) BOOL hasTextColor;
@property (nonatomic, strong, readonly) UIColor *textColor;

@property (nonatomic, assign, readonly) BOOL hasHighlightedTextColor;
@property (nonatomic, strong, readonly) UIColor *highlightedTextColor;

@property (nonatomic, assign, readonly) BOOL hasFont;
@property (nonatomic, strong, readonly) UIFont *font;

@property (nonatomic, assign, readonly) BOOL hasTextAlignment;
@property (nonatomic, assign, readonly) NSTextAlignment textAlignment;

@property (nonatomic, assign, readonly) BOOL hasLineBreakMode;
@property (nonatomic, assign, readonly) NSLineBreakMode lineBreakMode;

@property (nonatomic, assign, readonly) BOOL hasNumberOfLines;
@property (nonatomic, assign, readonly) NSInteger numberOfLines;

@property (nonatomic, assign, readonly) BOOL hasAdjustsFontSize;
@property (nonatomic, assign, readonly) CGFloat adjustsFontSize;

@property (nonatomic, assign, readonly) BOOL hasBaselineAdjustment;
@property (nonatomic, assign, readonly) CGFloat baselineAdjustment;

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


NS_ASSUME_NONNULL_END
