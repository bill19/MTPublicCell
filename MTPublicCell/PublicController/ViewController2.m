//
//  ViewController2.m
//  MTPublicCell
//
//  Created by HaoSun on 16/12/6.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "ViewController2.h"
#import "MTPublicHeader.h"

@interface ViewController2 ()

@property (nonatomic, strong) UIView *blurBackView;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"VC2";
    self.view.backgroundColor = [UIColor redColor];

    [self.view addSubview:self.blurBackView];

    int z = 10;
    int (^addBlock)(int a, int b) = ^(int a , int b){

        return a + b + z;
    };
    z = 0;
    int result = addBlock(1,1);
    NSLog(@"%zd -- %zd",result, z);
}


- (UIView *)blurBackView
{
    if (_blurBackView == nil) {
        _blurBackView = [[UIView alloc] init];
        _blurBackView.frame = CGRectMake(0, 100, ScreenW, 64);
        CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
        gradientLayer.frame = CGRectMake(0, 100, ScreenW, 64);
        gradientLayer.colors = @[(__bridge id)[UIColor colorWithHex:0x040012 alpha:0.76].CGColor,(__bridge id)[UIColor colorWithHex:0x040012 alpha:0.28].CGColor];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1.0);
        [_blurBackView.layer addSublayer:gradientLayer];
        _blurBackView.userInteractionEnabled = NO;
        _blurBackView.alpha = 0.5;
    }
    return _blurBackView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
