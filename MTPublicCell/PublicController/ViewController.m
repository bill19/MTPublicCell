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
#import "MTShowListController.h"
#import "MTTestController.h"
#import "SCViewController.h"
#import "MTDropViewController.h"
#import "MTACActionSheetController.h"
#import "MTAlertViewController.h"
#import "MTCacheController.h"
#import "MTTextController.h"
#import "MTAttriController.h"
#import "MTRegularExpressionViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>
//展示
@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, weak) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"PublicCell";
    [self setupTableView];
    self.dataSource = @[@"HTML展示",@"ios框架化内容解析",@"基本UI控件展示",@"嵌入百度页面",@"c语言程序",@"show",@"testUrl",@"折线图",@"下拉菜单",@"ACSheet",@"MTAlertViewController",@"MTCache",@"MTTextController",@"MTAttriController",@"正则表达式",@"打电话"];
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
        case 5:{
            MTShowListController * showC = [[MTShowListController alloc] init];
            [self pushToVc:showC andNumber:indexPath.row];
        }
            break;

        case 6:{
            MTTestController * testMVC = [[MTTestController alloc] init];
            [self pushToVc:testMVC andNumber:indexPath.row];
        }

            break;
        case 7:{
            SCViewController * scv = [[SCViewController alloc] init];
            [self pushToVc:scv andNumber:indexPath.row];
        }
            break;
        case 8:{
            MTDropViewController * drp = [[MTDropViewController alloc] init];
            [self pushToVc:drp andNumber:indexPath.row];
        }
            break;
        case 9:{
            MTACActionSheetController * actionSheet = [[MTACActionSheetController alloc] init];
            [self pushToVc:actionSheet andNumber:indexPath.row];
        }
            break;
        case 10:{
            MTAlertViewController * actionSheet = [[MTAlertViewController alloc] init];
            [self pushToVc:actionSheet andNumber:indexPath.row];
        }
            break;
        case 11:{
            MTCacheController * actionSheet = [[MTCacheController alloc] init];
            [self pushToVc:actionSheet andNumber:indexPath.row];
        }
            break;

        case 12:{
            MTTextController *textC = [[MTTextController alloc] init];
            [self pushToVc:textC andNumber:indexPath.row];
        }
            break;

        case 13:{

            MTAttriController *attVc = [[MTAttriController alloc] init];
            [self pushToVc:attVc andNumber:indexPath.row];
        }
            break;
        case 14:{
            MTRegularExpressionViewController *reVc = [[MTRegularExpressionViewController alloc] init];
            [self pushToVc:reVc andNumber:indexPath.row];
        }
            break;

        case 15:{
            [self telPhone];
        }
            break;
        case 16:{
            [self telPhone];
        }
            break;
        default:
            break;
    }
}

- (void)telPhone{

    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"拨打电话" message:@"186xxxx6979" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"拨打", nil];
    
    [alertview show];
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 1) {
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"186xxxx6979"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }

}



- (void)pushToVc:(UIViewController *)vc andNumber:(NSInteger)number{

    vc.title = _dataSource[number];
    [self.navigationController pushViewController:vc animated:YES];
}




@end
