# JDTheme


先上图，本demo数据模拟，样式和图片全部来自配置文件

下面是demo效果图

![效果图](https://github.com/JDongKhan/JDTheme/blob/master/demo.gif)



下面是demo中的配置属性以及使用图

![属性图](https://github.com/JDongKhan/JDTheme/blob/master/demo1.gif)


# 使用步骤
1、集成SDK,支持CocoaPods

2、在APPDelegate 通过 [[JDThemeManager sharedInstance] setBundle:bundle]; 设置一款包含资源的bundle，当然该bundle来源不管，你可以网络下载也可以是mainBundle。

3、给你的控件设置jd_themeID属性（可以代码设置，也可以直接xib设置），jd_themeID是你的bundle里面的一组配置ID

4、享受吧

如果你想更改样式，需要[[JDThemeManager sharedInstance] changeBundle:bundle];这样做来更改bundle。

## 现有支持的属性：

```
各控件支持的属性
 
 UIView {
   backgroundColor : '#fff',
   borderColor : '#cecece',
   borderWidth : 1,
   cornerRadius : 1,
   tintColor : '#cececece',
   frame : { {0,0},{100,100} },
   visible : 1,
   opacity : 0.2,
   center : {100,100},
   left : 0,
   top: 0,
   right : 0,
   bottom : 0,
   width : 10,
   height: 10,
   centerX : 1,
   centerY : 1
 }
 
 UIButton {
   text : 'text',
   textColor : '#fffff',
   selectedTextColor : '#000',
   image : 'imageName',
   selectedImage : 'imageName',
   font : {
       size : 14,
       name : '',
       bold : YES,
       italic : YES
   }
   numberOfLines : 0,
   lineBreakMode : 0 ,
   backgroundImage : 'imageName',
   selectedBackgroundImage : 'imageName',
   textShadowColor : '#ccc',
   textShadowOffset : {100,100}
 }
 
 UILabel {
   text : 'text' ,
   textColor : '#fff',
   highlightedTextColor : '#ccc',
   font : {},
   adjustsFontSize : 10,
   baselineAdjustment : 0,
   textAlignment : 0,
   numberOfLines : 0,
   lineBreakMode : 0
 }
 
 UITabBar {
   backgroundColor : '#fff',
   barTintColor : ''#fff,
   translucent : NO,
 }
 
 UITextView {
   text : 'text',
   textColor : '#ccc',
   font : {},
   textAlignment : 0,
   editable : YES
 }
 
 UITextField {
   text : 'text',
   textColor : '#ccc',
   font : {},
   textAlignment : 0,
   placeholder : 'placeholder'
 }
 
 UITableView {
  separatorColor : '#fff'
 }
 
 UITabBarItem {
   text : 'text',
   image : 'imageName',
   selectedImage : 'imageName'
 }
 
 UISwitch {
   image : 'imageName'
   selectedImage : 'imageName'
   checked : YES
 }
 
 UIPageControl {
   textColor : '#ffffff',
   selectedTextColor : '#cecccc'
 }
 
 UINavigationBar {
   barTintColor : '#fff',
   translucent : NO,
   backgroundImage : 'imageName',
   shadowImage : 'imageName',
   statusBarStyle : 0
 }
 
 UIImageView {
  image : 'imageName'
 }
 
 UIBarItem {
   text : 'text',
   image : 'imageName',
   enabled : NO
 }
 

```

上面可以看出，不止可以定制image、颜色，连文字、font、边框等都可以定制，甚至还支持对约束设置。(Tips:父类拥有的子类也拥有哦)

## 支持换肤

基础功能，首页它主要为换肤服务

## 支持设置约束

它可以随意更改位置，在换肤的基础上，可以控制控件的位置

## 支持常规属性

支持设置控件的常规属性，如 label 的 numberOfLines、lineBreakMode等。

## 支持自定义控件 

当然这些是系统的控件和属性，还可以支持自定义控件和属性，只需要你的类重写jd_applyThemeWithRuleSet即可，拿到JDRuleSet你想怎么渲染就怎么渲染

## 支持多文件

可以看出key的规则是keyPath，它是区分文件的，懒加载模式极大提高大规模使用能力，避免配置文件过大加载很慢。

## 支持全局样式

你可以通过  [[JDStyleable sharedInstance] setGlobalStyleableName:@"Global"] 来设置一份全局的样式文件。

## 支持XIB和代码

xib需要在attribute设置Jd themeID即可，代码只需要view.jd_themeID = @"id"即可


## 支持各种格式的样式文件

默认是解析plist，通过 JDStyleable 的 setStyleableParser 方法，可以自定解析器，你想解析json格式的，css格式的都随你。

如下：

```
    [[JDStyleable sharedInstance] setStyleableParser:^NSDictionary *(NSString *fileName) {
        NSURL *url = [[JDThemeManager sharedInstance].bundle URLForResource:fileName withExtension:@"json"];
        return [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:url] options:kNilOptions error:nil];
    }];
```

# CocoaPods
 
1、在 Podfile 中添加 `pod 'JDTheme'`。

2、执行 `pod install` 或 `pod update`。

3、导入 \<JDTheme/JDTheme.h\>。
