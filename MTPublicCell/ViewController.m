//
//  ViewController.m
//  MTPublicCell
//
//  Created by HaoSun on 16/10/25.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "ViewController.h"
#import "WebKitController.h"
#import "FramerWorkViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
//展示
@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, weak) UIStoryboard *sb;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"PublicCell";
    [self setupTableView];
    self.dataSource = @[@"HTML展示",@"ios框架化内容解析",@"基本UI控件展示",@"ios"];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataSource.count;
}

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:

            [self pushToVc:[[WebKitController alloc] init]];
            break;
        case 1:
            [self pushToVc:[[FramerWorkViewController alloc] init]];
            break;
        case 2:
            [self pushToVc:[[FramerWorkViewController alloc] init]];
            break;
        case 3:
            [self pushToVc:[[FramerWorkViewController alloc] init]];
            break;
        default:
            break;
    }
}

- (void)pushToVc:(UIViewController *)vc{

    [self.navigationController pushViewController:vc animated:YES];
}




@end
