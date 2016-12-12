//
//  MTCacheController.m
//  MTPublicCell
//
//  Created by HaoSun on 16/11/21.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "MTCacheController.h"
#import "MTPublicHeader.h"

@interface MTCacheController ()

@end

@implementation MTCacheController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    YYCache *cache = [[YYCache alloc] initWithName:@"MTCacheDemo"];
    NSLog(@"%@",cache);
    
}

@end
