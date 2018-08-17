# JDTheme


先上图

![](https://github.com/wangjindong/JDTheme/blob/master/demo.gif)

![](https://github.com/wangjindong/JDTheme/blob/master/p.png)



配置文件支持属性：

// view
@property (nonatomic, strong, readonly) UIColor *backgroundColor;

@property (nonatomic, strong, readonly) UIImage *backgroundImage;

@property (nonatomic, strong, readonly) UIColor *borderColor;

@property (nonatomic, assign, readonly) CGFloat borderWidth;

@property (nonatomic, assign, readonly) CGFloat cornerRadius;

@property (nonatomic, assign, readonly) CGRect frame;

@property (nonatomic, strong, readonly) UIColor *tintColor;

//image
@property (nonatomic, strong, readonly) UIImage *image;

//button
@property (nonatomic, strong, readonly) UIImage *selectedBackgroundImage;

@property (nonatomic, strong, readonly) UIColor *selectedTextColor;

@property (nonatomic, strong, readonly) UIImage *selectedImage;

//Label
@property (nonatomic, copy, readonly) NSString *text;

@property (nonatomic, strong, readonly) UIColor *textColor;

@property (nonatomic, copy, readonly) NSString *fontName;

@property (nonatomic, assign, readonly) CGFloat fontSize;

@property (nonatomic, assign, readonly) BOOL fontBold;

@property (nonatomic, assign, readonly) BOOL fontItalic;

@property (nonatomic, assign, readonly) NSTextAlignment textAlignment;

@property (nonatomic, assign, readonly) NSLineBreakMode lineBreakMode;

@property (nonatomic, assign, readonly) NSInteger numberOfLines;

//textView
@property (nonatomic, assign, readonly) BOOL editable;

//textField
@property (nonatomic, copy, readonly) NSString *placeholder;

//tableView
@property (nonatomic, strong, readonly) UIColor *separatorColor;

//Switch
@property (nonatomic, assign, readonly) BOOL checked;

//navigation
@property (nonatomic, assign, readonly) BOOL translucent;

@property (nonatomic, strong, readonly) UIImage *shadowImage;

@property (nonatomic, assign, readonly) UIStatusBarStyle statusBarStyle;

@property (nonatomic, strong, readonly) UIColor *barTintColor;


# CocoaPods

1、在 Podfile 中添加 `pod 'JDTheme'`。

2、执行 `pod install` 或 `pod update`。

3、导入 \<JDTheme/JDTheme.h\>。
