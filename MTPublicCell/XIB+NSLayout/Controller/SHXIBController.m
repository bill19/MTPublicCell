//
//  SHXIBController.m
//  MTPublicCell
//
//  Created by HaoSun on 2017/5/15.
//  Copyright © 2017年 MaiTian. All rights reserved.
//

#import "SHXIBController.h"
#import "SHXibViewCell.h"

@interface SHXIBController ()<UITableViewDelegate, UITableViewDataSource>
//展示
@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation SHXIBController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
//    for (int i = 0; i < 10; i++) {
//        [_dataSource arrayByAddingObject:[NSString stringWithFormat:@"这是%d",i]];
//    }
}

- (NSArray *)dataSource{

    if (!_dataSource) {
        _dataSource = [NSArray array];
    }
    return _dataSource;
}
#pragma mark - 创建初始化
- (void)setupTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];

    [tableView setDelegate:self];
    [tableView setDataSource:self];
    _tableView = tableView;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    SHXibViewCell *xibCell = [SHXibViewCell xibViewCell:tableView];
    return xibCell;
}


@end
