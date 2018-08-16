//
//  JDNavigationViewController.m
//  JDTheme
//
//  Created by JD on 2018/8/16.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "JDNavigationViewController.h"

@interface JDNavigationViewController ()

@end

@implementation JDNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    UIViewController* topVC = self.topViewController;
    return [topVC preferredStatusBarStyle];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
