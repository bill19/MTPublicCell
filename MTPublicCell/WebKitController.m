//
//  WebKitController.m
//  MTPublicCell
//
//  Created by HaoSun on 16/10/26.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "WebKitController.h"

@interface WebKitController ()
@property (nonatomic, weak) UIWebView *webview;

@end

@implementation WebKitController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HTML5展示";
    [self setupWebView];
}

- (void)setupWebView{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURL *url = [NSURL URLWithString:@"http://ireader.h5-legend.com/h5/world3.html"];
//    NSURL *url = [NSURL URLWithString:@"http://zengzhangheikezaizhongguo.h5-legend.com/h5/62865c85-389a-74d4-34ea-469e5fcfbc13.html?t=1477472584822"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    _webview = webView;
    [self.view addSubview:_webview];

}

@end
