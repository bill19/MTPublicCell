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
#import "UIFrameWorkController.h"
#import "MTPublicCController.h"

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
        case 0:{

            WebKitController * web = [[WebKitController alloc] init];
            web.urlString = @"http://ireader.h5-legend.com/h5/otherday.html";
            [self pushToVc:web andNumber:indexPath.row];
        }
            break;
        case 1:
            [self pushToVc:[[FramerWorkViewController alloc] init] andNumber:indexPath.row];
            break;
        case 2:
            [self pushToVc:[[UIFrameWorkController alloc] init] andNumber:indexPath.row];
            break;
        case 3:{

            WebKitController * web = [[WebKitController alloc] init];
            web.urlString = @"https://www.baidu.com";
            [self pushToVc:web andNumber:indexPath.row];
        }
            break;
        case 4:{
            MTPublicCController * pubC = [[MTPublicCController alloc] init];
            [self pushToVc:pubC andNumber:indexPath.row];
        }
            break;
        default:
            break;
    }
}


- (void)pushToVc:(UIViewController *)vc andNumber:(NSInteger)number{

    vc.title = _dataSource[number];
    [self.navigationController pushViewController:vc animated:YES];
}




@end
