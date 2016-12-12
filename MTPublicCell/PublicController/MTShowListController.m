//
//  MTShowListController.m
//  MTPublicCell
//
//  Created by HaoSun on 16/11/11.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "MTShowListController.h"
#import "MTPublicHeader.h"

@interface MTShowListController ()<UITableViewDelegate, UITableViewDataSource>
//展示
@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, weak) UIView *redView;

@property (nonatomic, weak) UIView *redView2;

@end

@implementation MTShowListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"PublicCell";
    [self setupTableView];
    [self setupHeadView];

    UIView *redView = [[UIView alloc] init];
    redView.frame = CGRectMake(0, 64, ScreenW, 100);
    redView.backgroundColor = [UIColor redColor];
    _redView = redView;
    [self.view addSubview:_redView];

    self.dataSource = @[@"HTML展示",@"ios框架化内容解析",@"基本UI控件展示",@"嵌入百度页面",@"c语言程序"];
}

#pragma mark - 创建初始化
- (void)setupTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];

    [tableView setDelegate:self];
    [tableView setDataSource:self];
    _tableView = tableView;
    [self.view addSubview:_tableView];
}

- (NSArray *)dataSource{

    if (!_dataSource) {
        _dataSource = [[NSArray alloc] init];
    }
    return _dataSource;
}

- (void)setupHeadView{

    UIView *redView = [[UIView alloc] init];
    redView.frame = CGRectMake(0, 0, ScreenW, 100);
    redView.backgroundColor = [UIColor yellowColor];
    _redView2 = redView;
    _tableView.tableHeaderView = _redView2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataSource.count;
}

#pragma mark - TableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *ID = @"PublicCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell.textLabel setText:_dataSource[indexPath.row]];

    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    NSLog(@"scrollViewDidScroll  %f",scrollView.contentOffset.y);

    _redView.alpha = -scrollView.contentOffset.y/64;
    [_redView2 setFrame:CGRectMake(0, 0, ScreenW, -scrollView.contentOffset.y )];
}


- (void)pushToVc:(UIViewController *)vc andNumber:(NSInteger)number{

    vc.title = _dataSource[number];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
