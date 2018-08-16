//
//  FirstViewController.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"
#import "JDTheme.h"

@interface FirstViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray *dataSourceArray;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.frame = self.view.bounds;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.tableView];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"FirstTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];

    self.view.jd_theme_key = @"Style.view";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一个" style:UITableViewStylePlain target:self action:@selector(nextAction)];
    
    self.dataSourceArray = [NSMutableArray array];
    [self.dataSourceArray addObject:@{}];
    [self.dataSourceArray addObject:@{}];
    [self.dataSourceArray addObject:@{}];
    [self.dataSourceArray addObject:@{}];
    [self.dataSourceArray addObject:@{}];
    [self.dataSourceArray addObject:@{}];
    [self.dataSourceArray addObject:@{}];
    [self.dataSourceArray addObject:@{}];
    [self.dataSourceArray addObject:@{}];
    [self.dataSourceArray addObject:@{}];
    [self.dataSourceArray addObject:@{}];
    [self.dataSourceArray addObject:@{}];
    [self.dataSourceArray addObject:@{}];
    [self.dataSourceArray addObject:@{}];
//    JDThemeBind(self,_button,@"button");

//    JDThemeBind(self,_imageView,@"image");
//    JDThemeBind(self, _label, @"button");
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)nextAction {
    [self.navigationController pushViewController:[[FirstViewController alloc] init] animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    [tableViewCell setDataInfo:self.dataSourceArray[indexPath.row]];
    return tableViewCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        [[JDThemeManager sharedInstance] setTheme:@"JDTheme_Black"];
    } else {
        [[JDThemeManager sharedInstance] setTheme:@"JDTheme_White"];
    }
}

//
//
//- (IBAction)whiteThemeAction:(id)sender {
//    [[JDThemeManager sharedInstance] setTheme:@"JDTheme_White"];
//}
//
//- (IBAction)blackThemeAction:(id)sender {
//    [[JDThemeManager sharedInstance] setTheme:@"JDTheme_Black"];
//}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
