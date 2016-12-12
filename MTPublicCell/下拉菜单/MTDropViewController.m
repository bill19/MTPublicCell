//
//  MTDropViewController.m
//  MTPublicCell
//
//  Created by HaoSun on 16/11/18.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "MTDropViewController.h"
#import "WSDropMenuView.h"

@interface MTDropViewController ()<WSDropMenuViewDataSource,WSDropMenuViewDelegate>

@property (nonatomic, weak) WSDropMenuView *dropMenu;

@end

@implementation MTDropViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    WSDropMenuView *dropMenu = [[WSDropMenuView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 40)];
    dropMenu.dataSource = self;
    dropMenu.delegate  =self;
    _dropMenu = dropMenu;
    [self.view addSubview:_dropMenu];
}


#pragma mark - WSDropMenuView DataSource -
- (NSInteger)dropMenuView:(WSDropMenuView *)dropMenuView numberWithIndexPath:(WSIndexPath *)indexPath{

    //WSIndexPath 类里面有注释

    if (indexPath.column == 0 && indexPath.row == WSNoFound) {

        return 10;
    }
    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item == WSNoFound) {

        return 5;
    }

    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item != WSNoFound && indexPath.rank == WSNoFound) {

        return 7;
    }

    if (indexPath.column == 1) {

        return 3;
    }

    return 0;
}

- (NSString *)dropMenuView:(WSDropMenuView *)dropMenuView titleWithIndexPath:(WSIndexPath *)indexPath{

    //return [NSString stringWithFormat:@"%ld",indexPath.row];

    //左边 第一级
    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item == WSNoFound) {

        return [NSString stringWithFormat:@"第一级%ld",indexPath.row];
    }

    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item != WSNoFound && indexPath.rank == WSNoFound) {

        return [NSString stringWithFormat:@"第二级%ld",indexPath.item];
    }

    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item != WSNoFound && indexPath.rank != WSNoFound) {

        return [NSString stringWithFormat:@"第三级%ld",indexPath.rank];
    }

    if (indexPath.column == 1 && indexPath.row != WSNoFound ) {

        return [NSString stringWithFormat:@"右边%ld",indexPath.row];
    }

    return @"";

}

#pragma mark - WSDropMenuView Delegate -

- (void)dropMenuView:(WSDropMenuView *)dropMenuView didSelectWithIndexPath:(WSIndexPath *)indexPath{


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
