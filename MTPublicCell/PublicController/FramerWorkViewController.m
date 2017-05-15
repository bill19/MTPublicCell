//
//  FramerWorkViewController.m
//  MTPublicCell
//
//  Created by HaoSun on 16/10/31.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "FramerWorkViewController.h"
#import "SHTTools.h"

@interface FramerWorkViewController ()
@property (nonatomic, weak) UIWebView *webview;


@end

@implementation FramerWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];



//    [self setupWebView];
}



- (void)setupWebView{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURL *url = [NSURL URLWithString:@"https://github.com/cuinidaye/ios_basic_knowledge_frame"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    _webview = webView;
    [self.view addSubview:_webview];
    
}

@end
