//
//  MTACActionSheetController.m
//  MTPublicCell
//
//  Created by HaoSun on 16/11/18.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "MTACActionSheetController.h"
#import "ACActionSheet.h"
#import "MTPublicHeader.h"

@interface MTACActionSheetController ()

@end

@implementation MTACActionSheetController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"按钮1" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(_showUIActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTintColor:[UIColor yellowColor]];
    [button1 setBackgroundColor:[UIColor greenColor]];
    [button1 setFrame:CGRectMake(0, 60, ScreenW, 30)];
    [self.view addSubview:button1];

    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"按钮2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(_showUIAlertController:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTintColor:[UIColor yellowColor]];
    [button2 setBackgroundColor:[UIColor greenColor]];
    [button2 setFrame:CGRectMake(0, 160, ScreenW, 30)];
    [self.view addSubview:button2];

    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setTitle:@"按钮3" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(_showACActionSheetTypeDelegate:) forControlEvents:UIControlEventTouchUpInside];
    [button3 setTintColor:[UIColor yellowColor]];
    [button3 setBackgroundColor:[UIColor greenColor]];
    [button3 setFrame:CGRectMake(0, 260, ScreenW, 30)];
    [self.view addSubview:button3];


    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 setTitle:@"按钮4" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(_showACActionSheetTypeBlock:) forControlEvents:UIControlEventTouchUpInside];
    [button4 setTintColor:[UIColor yellowColor]];
    [button4 setBackgroundColor:[UIColor greenColor]];
    [button4 setFrame:CGRectMake(0, 360, ScreenW, 30)];
    [self.view addSubview:button4];


}


/**
 *  系统 - UIActionSheet demo
 */
- (void)_showUIActionSheet:(UIButton *)sender {

    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"微信朋友圈" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"小视频" otherButtonTitles:@"拍照",@"从手机相册选择", nil];
    
    [actionSheet showInView:self.view];
}

/**
 *  系统 - UIAlertController demo
 */
- (void)_showUIAlertController:(UIButton *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"保存或删除数据" message:@"删除数据将不可恢复" preferredStyle: UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"UIAlertController - 取消");
    }];
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"UIAlertController - 删除");
    }];
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"UIAlertController - 保存");
    }];

    [alertController addAction:cancelAction];
    [alertController addAction:deleteAction];
    [alertController addAction:saveAction];

    [self presentViewController:alertController animated:YES completion:nil];
}


/**
 *   ACActionSheet type delegate demo
 */
- (void)_showACActionSheetTypeDelegate:(UIButton *)sender {

    ACActionSheet *actionSheet = [[ACActionSheet alloc] initWithTitle:@"保存或删除数据" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除" otherButtonTitles:@"保存",@"更改", nil];

    [actionSheet show];
}



/**
 *   ACActionSheet type block demo
 */
- (void)_showACActionSheetTypeBlock:(UIButton *)sender {
    ACActionSheet *actionSheet = [[ACActionSheet alloc] initWithTitle:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@[@"小视频",@"拍照",@"从手机相册选择"] actionSheetBlock:^(NSInteger buttonIndex) {
        NSLog(@"ACActionSheet block - %ld",buttonIndex);
    }];
    [actionSheet show];
}


#pragma mark - UIActionSheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"UIActionSheet - %@ %ld",[actionSheet buttonTitleAtIndex:buttonIndex],buttonIndex);
}

#pragma mark - ACActionSheet delegate
- (void)actionSheet:(ACActionSheet *)actionSheet didClickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"ACActionSheet delegate - %ld",buttonIndex);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
