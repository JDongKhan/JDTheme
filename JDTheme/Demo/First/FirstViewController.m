//
//  FirstViewController.m
//  JDTheme
//
//  Created by JD on 2018/8/14.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"
#import "UINavigationBar+JDTheme.h"
#import "JDTheme.h"

@interface FirstViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray *dataSourceArray;

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@end

@implementation FirstViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.navigationController.navigationBar.statusBarStyle;
}

- (void)themeDidChange {
    [self setNeedsStatusBarAppearanceUpdate];
    
    //暂时放这，UIActivityIndicatorView使用场景不多，就不用category实现了，可以使用通知
    if ([[JDThemeManager sharedInstance].bundle.resourcePath containsString:@"JDTheme_Black"]) {
        self.indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    } else {
        self.indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //状态栏变化通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChange) name:JDThemeChangedNotification object:nil];
    
    //创建tableView
    self.tableView.frame = self.view.bounds;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.tableView];
    self.tableView.estimatedRowHeight = 180;  //  随便设个不那么离谱的值
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"FirstTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];

    //创建加载框
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.indicatorView.center = CGPointMake(self.view.bounds.size.width / 2, 20);
    self.navigationItem.titleView = self.indicatorView;
    
    //设置Style
    self.navigationController.navigationBar.jd_themeKey = @"Style.navigationBar";
    self.view.jd_themeKey = @"Style.view";
    
    //导航右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"切换" style:UIBarButtonItemStylePlain target:self action:@selector(nextAction)];
    
    //数据源
    self.dataSourceArray = [NSMutableArray array];
    [self.dataSourceArray addObject:@{
                                      @"title" : @"高考九年 | 我多希望九年前有人告诉我这些",
                                      @"detail" : @"清楚地记得高考那两天，经历了这辈子见过的最大的雨。天仿佛漏了个洞，大雨噼里啪啦地砸下来，地上的积水没过了大半个车轱辘。 清楚地记得写完英语作文画..."
                                      }];
    [self.dataSourceArray addObject:@{
                                      @"title" : @"人性，经不起考验【转载】",
                                      @"detail" : @"一对年轻夫妻感情很好，但妻子仍不放心丈夫的忠诚度，于是就让自己的闺蜜出马，考验丈夫是否花心。 在一个中秋月圆之夜，妻子“出差”在外，闺蜜“偶遇”..."
                                      }];
    [self.dataSourceArray addObject:@{
                                      @"title" : @"当你觉得读书很苦时，看看我们……",
                                      @"detail" : @"一大早,QC同事拿了一个异常处理单过来，原来是我们所订购的商标产品名称U字母头上多了两个点。我们被吓得双脚直抖，赶紧找回合同从头到尾查原因。仔细..."
                                      }];
    [self.dataSourceArray addObject:@{
                                      @"title" : @"【谈古论今】都是裙子惹的祸",
                                      @"detail" : @"提起裙子，不得不令人想到玛丽莲·梦露那一幅堪称经典的照片，一阵风莫明其妙地吹过来，身穿连衣裙的梦露赶紧以手捂住裙子，那一份羞怯中更多暧昧性感的神..."
                                      }];
    [self.dataSourceArray addObject:@{
                                      @"title" : @"直男再见，我不要你了",
                                      @"detail" : @"我跟他吵架了。 反正我觉得是吵架了。 真的是像之前写的，痛到不行。 分手就在嘴边，箭就在弓上，千钧一发。 追我的男生还有点多，为了你我拒绝了不少..."
                                      }];
    [self.dataSourceArray addObject:@{
                                      @"title" : @"还在迷茫？八个步骤让你加速成长！",
                                      @"detail" : @"01 上一篇文章我写了《如何管理自我，启动并养成自增长的微习惯？》主要讲了两个方面的内容：第一什么是微习惯。第二是为什么微习惯会起作用。然后布置..."
                                      }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)nextAction {
    NSString *themName = @"JDTheme_White";
    if ([[JDThemeManager sharedInstance].bundle.resourcePath containsString:@"JDTheme_White"]) {
        themName = @"JDTheme_Black";
    }
    
    [self showProgress];
    
    NSLog(@"模拟下载资源中(延迟一秒刷新)....");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self downBundle:themName];
        [self hiddenProgress];
        NSLog(@"下载完成....");
    });

}

- (void)downBundle:(NSString *)themName {
    //模拟网络下载，把APP内的bundle拷贝到document下
    NSString *srcpath = [[NSBundle mainBundle] pathForResource:themName ofType:@"bundle"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *toaPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.bundle",themName]];
    NSError *error = nil;
    if ([[NSFileManager defaultManager] fileExistsAtPath:toaPath]) {
        //removing file
        if (![[NSFileManager defaultManager] removeItemAtPath:toaPath error:&error]) {
            NSLog(@"Could not remove old files. Error:%@",error);
        }
    }
    BOOL success = [[NSFileManager defaultManager] copyItemAtPath:srcpath toPath:toaPath error:&error];
    
    //从document下读取bundle
    if (success) {
        NSBundle *bundle = [NSBundle bundleWithPath:toaPath];
        [[JDThemeManager sharedInstance] changeBundle:bundle];
    }
}


- (void)showProgress {
    [self.indicatorView startAnimating];
}

- (void)hiddenProgress {
    [self.indicatorView stopAnimating];
}

#pragma mark ---- delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    [tableViewCell setDataInfo:self.dataSourceArray[indexPath.row]];
    return tableViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     [self.navigationController pushViewController:[[FirstViewController alloc] init] animated:YES];
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
