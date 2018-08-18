# JDTheme


先上图，本demo数据模拟，样式和图片全部来自配置文件

下面是demo效果图

![效果图](https://github.com/JDongKhan/JDTheme/blob/master/demo.gif)



下面是demo中的配置属性以及使用图

![属性图](https://github.com/JDongKhan/JDTheme/blob/master/demo1.gif)


# 使用步骤
1、集成SDK

2、在APPDelegate 通过 [[JDThemeManager sharedInstance] setBundle:bundle]; 设置一款包含资源的bundle，当然该bundle来源不管，你可以网络下载也可以是mainBundle。

3、给你的控件设置jd_themeKey属性（可以代码设置，也可以直接xib设置），jd_themeKey是你的bundle里面的一组配置key

4、享受吧

如果你想更改样式，需要[[JDThemeManager sharedInstance] changeBundle:bundle];这样做来更改bundle。

## 现有支持的属性：

```
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

```

上面可以看出，不止可以定制image、颜色，连文字、font、边框等都可以定制，甚至后面会增加对约束的支持。(Tips:父类拥有的子类也拥有哦)

## 支持自定义控件 
当然这些是系统的控件和属性，还可以支持自定义控件和属性，只需要你的类重现jd_applyThemeWithRuleSet即可，拿到JDRuleSet你想怎么渲染就怎么渲染

## 支持多文件

可以看出key的规则是keyPath，它是区分文件的，懒加载模式极大提高大规模使用能力，避免配置文件过大加载很慢。

## 支持样式继承

你的样式表里面只要增加parent即可达到继承其他文件的样式，当然你也能重写，不过只重写你修改的属性哦。

如果你的动态样式表有同样的key，会将重复的配置重写掉，方便样式封装及定制。

## 支持自定义文件解析

通过 JDStyleable 的 setStyleableParser 方法，可以自定解析器，比如bundle里面带有css文件，只要规则一样，数据格式类型无所谓。


# CocoaPods

1、在 Podfile 中添加 `pod 'JDTheme'`。

2、执行 `pod install` 或 `pod update`。

3、导入 \<JDTheme/JDTheme.h\>。
