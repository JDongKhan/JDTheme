//
//  JDTheme.h
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

/*
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
 height : 10,
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
 
 */


#import <Foundation/Foundation.h>
#import "JDThemeManager.h"
#import "JDStyleable.h"
#import "NSObject+JDTheme.h"

