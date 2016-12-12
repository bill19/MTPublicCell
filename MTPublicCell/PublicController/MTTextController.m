//
//  MTTextController.m
//  MTPublicCell
//
//  Created by HaoSun on 16/11/21.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "MTTextController.h"
#import "MTPublicHeader.h"

@interface MTTextController ()

@property (nonatomic, weak) NSMutableArray *dataSource;

@end

@implementation MTTextController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self setupYYText];
}

- (NSMutableArray *)dataSource{

    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)setupYYText{

    YYTextView *textView = [[YYTextView alloc] init];
    textView.text = @"我总觉得你是对的";
    [textView setFrame:CGRectMake(100, 100, 100, 30)];
    [textView setFont:MTFont16];
    [textView setTextColor:[UIColor greenColor]];
    [textView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:textView];


    YYLabel *shLabel = [[YYLabel alloc] init];
    shLabel.text = @"试试";
    shLabel.frame = CGRectMake(100, 140, 100, 30);
    shLabel.backgroundColor = [UIColor greenColor];
    shLabel.textColor = [UIColor redColor];

    [self.view addSubview:shLabel];


}

@end
