//
//  MTTestController.m
//  MTPublicCell
//
//  Created by HaoSun on 16/11/16.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "MTTestController.h"

@interface MTTestController ()

@end

@implementation MTTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://location?id=1"];
    BOOL hasInstagram = [[UIApplication sharedApplication] canOpenURL:instagramURL];
    NSLog(@"%d",hasInstagram);
}


@end
