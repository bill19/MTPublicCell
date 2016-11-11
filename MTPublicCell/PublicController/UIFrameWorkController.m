
//  UIFrameWorkController.m
//  MTPublicCell
//
//  Created by HaoSun on 16/10/31.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "UIFrameWorkController.h"
#import "MTSimpleCell.h"
#import "MTPublicModel.h"

#import "MTTextCell.h"
#import "MTTextModel.h"

#import "MTSwitchCell.h"
#import "MTSwitchModel.h"
#import "MTPublicHeader.h"

@interface UIFrameWorkController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) NSMutableArray *dataText;

@property (nonatomic, strong) NSMutableArray *dataSwitch;

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation UIFrameWorkController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupDataSource];
    [self setupTableView];
    [self setupSubViews];

    [self setupButtonView];

}

- (void)setupDataSource{

#pragma mark- dataSource
    MTPublicModel *model1 = [[MTPublicModel alloc] init];
    model1.iconStr = @"fav";
    model1.titleStr = @"16软件";
    model1.numberStr = @"100+";


    MTPublicModel *model2 = [[MTPublicModel alloc] init];
    model2.iconStr = @"follow";
    model2.titleStr = @"16科学与技术";
    model2.numberStr = @"";

    MTPublicModel *model3 = [[MTPublicModel alloc] init];
    model3.iconStr = @"mycomt";
    model3.titleStr = @"我的设置";
    model3.numberStr = @"";

    MTPublicModel *model4 = [[MTPublicModel alloc] init];
    model4.iconStr = @"option";
    model4.titleStr = @"系统消息";
    model4.numberStr = @"";

    MTPublicModel *model5 = [[MTPublicModel alloc] init];
    model5.iconStr = @"option";
    model5.titleStr = @"系统消息";
    model5.numberStr = @"";

    [self.dataSource addObjectsFromArray:@[model1,model2,model3,model4,model5]];

#pragma mark- dataSource
    MTTextModel *tModel1 = [[MTTextModel alloc] init];
    tModel1.textTitle = @"修改资料";
    tModel1.textDetial = @"这是我的资料";

    MTTextModel *tModel2 = [[MTTextModel alloc] init];
    tModel2.textTitle = @"修改签名";
    tModel2.textDetial = @"这是我的签名";

    [self.dataText addObjectsFromArray:@[tModel1,tModel2]];

#pragma mark - dataSwitch
    MTSwitchModel *switchM1 = [[MTSwitchModel alloc] init];
    switchM1.switchTitle = @"什么开关呢？";
    switchM1.isOpen = YES;

    MTSwitchModel *switchM2 = [[MTSwitchModel alloc] init];
    switchM2.switchTitle = @"什么开关呢？";
    switchM2.isOpen = NO;

    [self.dataSwitch addObjectsFromArray:@[switchM1,switchM2]];


}

- (void)setupSubViews{


}

- (void)setupButtonView{
    CGFloat buttonW = ScreenW/5;
    CGFloat buttonH = 100;

    UIView * buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenH - 200, ScreenW, 100)];
    buttonView.backgroundColor = [UIColor greenColor];
    [_tableView addSubview:buttonView];

    UIButton *detailDisclosureButton = [UIButton buttonWithType:UIButtonTypeSystem];
    detailDisclosureButton.frame = CGRectMake(0, 0, buttonW, buttonH);
    [detailDisclosureButton setTitle:@"Button" forState:UIControlStateNormal];
    [buttonView addSubview:detailDisclosureButton];

    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    infoButton.frame = CGRectMake(buttonW, 0, buttonW, buttonH);
    [buttonView addSubview:infoButton];

    UIButton *darkButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    darkButton.frame = CGRectMake(buttonW*2, 0, buttonW, buttonH);
    [buttonView addSubview:darkButton];


    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    addButton.frame = CGRectMake(buttonW*3, 0, buttonW, buttonH);
    [buttonView addSubview:addButton];

}

#pragma mark - 创建初始化
- (void)setupTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    tableView.showsVerticalScrollIndicator = NO;
    _tableView = tableView;
    [self.view addSubview:_tableView];
}


#pragma mark - tableView datasource

- (NSMutableArray *)dataSource{

    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (NSMutableArray *)dataText{

    if (!_dataText) {
        _dataText = [NSMutableArray array];
    }
    return _dataText;
}

- (NSMutableArray *)dataSwitch{

    if (!_dataSwitch) {
        _dataSwitch = [NSMutableArray array];

    }
    return _dataSwitch;
}

#pragma mark - tableview delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    switch (section) {
        case 0:
            return  _dataSource.count;
            break;

        case 1:
            return  _dataText.count;
            break;

        case 2:
            return  _dataSwitch.count;
            break;

        default:
            break;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    switch (indexPath.section) {
        case 0:
        {
            MTSimpleCell *cell = [MTSimpleCell publicSimpleCell:_tableView];
            MTPublicModel *model = _dataSource[indexPath.row];
            cell.publicModel = model;
            return cell;

        }
            break;

        case 1:
        {
            MTTextCell *textCell = [MTTextCell textCell:_tableView];
            MTTextModel *textModel = _dataText[indexPath.row];
            textCell.textModel = textModel;
            return textCell;

        }
        case 2:
        {
            MTSwitchCell *switchCell = [MTSwitchCell switchCell:_tableView];
            MTSwitchModel *switchModel = _dataSwitch[indexPath.row];
            switchCell.switchModel = switchModel;
            return switchCell;

        }
            break;
        default:
            break;
    }

    return nil;

}



@end
