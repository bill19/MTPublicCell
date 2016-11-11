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
    [self setupWebView];
}

- (void)setupWebView{
    //
    //@"http://www.baidu.com"
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURL *url = [NSURL URLWithString:self.urlString];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    _webview = webView;
    [self.view addSubview:_webview];

}

@end
