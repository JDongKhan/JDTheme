//
//  ViewController.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "ViewController.h"
#import "JDTheme.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //下面代码属于全局
    [[JDThemeManager sharedInstance] setTheme:@"JDTheme_White"];
    
    //下面代码跟页面走
    self.jd_styleable = [[JDStyleable alloc] initWithStyleable:@"Style" parentStyle:nil];
    self.button.jd_theme_key = @"button";
    self.view.jd_theme_key = @"view";
    self.imageView.jd_theme_key = @"image";
    self.label.jd_theme_key = @"button";
    
//    JDThemeBind(self,_button,@"button");
//    JDThemeBind(self,self.view,@"view");
//    JDThemeBind(self,_imageView,@"image");
//    JDThemeBind(self, _label, @"button");
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)whiteThemeAction:(id)sender {
    [[JDThemeManager sharedInstance] setTheme:@"JDTheme_White"];
}

- (IBAction)blackThemeAction:(id)sender {
    [[JDThemeManager sharedInstance] setTheme:@"JDTheme_Black"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
