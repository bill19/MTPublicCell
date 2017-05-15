//
//  MTWifiInfo.m
//  MTPublicCell
//
//  Created by HaoSun on 2017/2/3.
//  Copyright © 2017年 MaiTian. All rights reserved.
//

#import "MTWifiInfo.h"
#import <SystemConfiguration/CaptiveNetwork.h>

@interface MTWifiInfo ()

@property (nonatomic, weak) UILabel *label;


@end

@implementation MTWifiInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"000----11---";

    NSArray *ifs = (__bridge id)CNCopySupportedInterfaces();

    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) {
            break;
        }
    }
    NSDictionary *dctySSID = (NSDictionary *)info;
    NSString *ssid = [[dctySSID objectForKey:@"SSID"] lowercaseString];
    NSString *bssid = [[dctySSID objectForKey:@"BSSID"] lowercaseString];
    NSString *ssidData = [[ NSString alloc] initWithData:info[@"SSIDDATA"] encoding:NSUTF8StringEncoding];


    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"%@---%@---%@",ssid,bssid,ssidData];
    label.frame = CGRectMake(10, 100, 300, 80);
    label.backgroundColor = [UIColor redColor];
    _label = label;
    [self.view addSubview:_label];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
