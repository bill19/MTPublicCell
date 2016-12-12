//
//  MTAlertViewController.m
//  MTPublicCell
//
//  Created by HaoSun on 16/11/18.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "MTAlertViewController.h"
// contain this header
#import "UIView+TYAlertView.h"
// if you want blur efffect contain this
#import "TYAlertController+BlurEffects.h"

#import "SettingModelView.h"
#import "ShareView.h"

#import "MTPublicHeader.h"

@interface MTAlertViewController ()

@end

@implementation MTAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"按钮1" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(showAlertViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTintColor:[UIColor yellowColor]];
    [button1 setBackgroundColor:[UIColor greenColor]];
    [button1 setFrame:CGRectMake(0, 70, ScreenW, 30)];
    [self.view addSubview:button1];

    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"按钮2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(showActionSheetAction:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTintColor:[UIColor yellowColor]];
    [button2 setBackgroundColor:[UIColor greenColor]];
    [button2 setFrame:CGRectMake(0, 110, ScreenW, 30)];
    [self.view addSubview:button2];

    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setTitle:@"按钮3" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(blurEffectAlertViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [button3 setTintColor:[UIColor yellowColor]];
    [button3 setBackgroundColor:[UIColor greenColor]];
    [button3 setFrame:CGRectMake(0, 150, ScreenW, 30)];
    [self.view addSubview:button3];


    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 setTitle:@"按钮4" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(dropdwonAnimationAction:) forControlEvents:UIControlEventTouchUpInside];
    [button4 setTintColor:[UIColor yellowColor]];
    [button4 setBackgroundColor:[UIColor greenColor]];
    [button4 setFrame:CGRectMake(0, 190, ScreenW, 30)];
    [self.view addSubview:button4];


    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button5 setTitle:@"按钮2" forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(costomActonSheetAction:) forControlEvents:UIControlEventTouchUpInside];
    [button5 setTintColor:[UIColor yellowColor]];
    [button5 setBackgroundColor:[UIColor greenColor]];
    [button5 setFrame:CGRectMake(0, 230, ScreenW, 30)];
    [self.view addSubview:button5];

    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button6 setTitle:@"按钮3" forState:UIControlStateNormal];
    [button6 addTarget:self action:@selector(showAlertViewInWindowAction:) forControlEvents:UIControlEventTouchUpInside];
    [button6 setTintColor:[UIColor yellowColor]];
    [button6 setBackgroundColor:[UIColor greenColor]];
    [button6 setFrame:CGRectMake(0, 270, ScreenW, 30)];
    [self.view addSubview:button6];


    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button7 setTitle:@"按钮4" forState:UIControlStateNormal];
    [button7 addTarget:self action:@selector(customViewInWindowAction:) forControlEvents:UIControlEventTouchUpInside];
    [button7 setTintColor:[UIColor yellowColor]];
    [button7 setBackgroundColor:[UIColor greenColor]];
    [button7 setFrame:CGRectMake(0, 310, ScreenW, 30)];
    [self.view addSubview:button7];
}


- (void)showAlertViewAction:(id)sender {

    TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"TYAlertView" message:@"This is a message, the alert view containt text and textfiled. "];

    [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancel handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];

    // 弱引用alertView 否则 会循环引用
    __typeof (alertView) __weak weakAlertView = alertView;
    [alertView addAction:[TYAlertAction actionWithTitle:@"确定" style:TYAlertActionStyleDestructive handler:^(TYAlertAction *action) {

        NSLog(@"%@",action.title);
        for (UITextField *textField in weakAlertView.textFieldArray) {
            NSLog(@"%@",textField.text);
        }
    }]];

    [alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"请输入账号";
    }];
    [alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"请输入密码";
    }];

    // first way to show
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleAlert];

    [alertController setViewWillShowHandler:^(UIView *alertView) {
        NSLog(@"ViewWillShow");
    }];

    [alertController setViewDidShowHandler:^(UIView *alertView) {
        NSLog(@"ViewDidShow");
    }];

    [alertController setViewWillHideHandler:^(UIView *alertView) {
        NSLog(@"ViewWillHide");
    }];

    [alertController setViewDidHideHandler:^(UIView *alertView) {
        NSLog(@"ViewDidHide");
    }];

    [alertController setDismissComplete:^{
        NSLog(@"DismissComplete");
    }];

    //alertController.alertViewOriginY = 60;
    [self presentViewController:alertController animated:YES completion:nil];

    // second way ,use UIView Category
    //[alertView showInController:self preferredStyle:TYAlertControllerStyleAlert];

}
- (void)showActionSheetAction:(id)sender {

    TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"TYAlertView" message:@"This is a message, the alert view style is actionsheet. "];

    [alertView addAction:[TYAlertAction actionWithTitle:@"默认2" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];

    [alertView addAction:[TYAlertAction actionWithTitle:@"默认1" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];

    [alertView addAction:[TYAlertAction actionWithTitle:@"删除" style:TYAlertActionStyleDestructive handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancel handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];

    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleActionSheet];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)blurEffectAlertViewAction:(id)sender {
    ShareView *shareView = [ShareView createViewFromNib];

    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:shareView preferredStyle:TYAlertControllerStyleAlert];

    // blur effect
    [alertController setBlurEffectWithView:self.view];

    //alertController.alertViewOriginY = 60;
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)dropdwonAnimationAction:(id)sender {
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"TYAlertView" message:@"This is a message, the alert view containt dropdwon animation. "];

    [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancel handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];

    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleAlert transitionAnimation:TYAlertTransitionAnimationDropDown];
    [self presentViewController:alertController animated:YES completion:nil];

    // or show,use UIView Category
    //[alertView showInController:self preferredStyle:TYAlertControllerStyleAlert];
}

- (void)costomActonSheetAction:(id)sender {
    // customview from xib
    SettingModelView *settingModelView = [SettingModelView createViewFromNib];

    // fisrt way to show ,use UIView Category
    //    [settingModelView showInController:self preferredStyle:TYAlertControllerStyleActionSheet backgoundTapDismissEnable:YES];

    // second way to show
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:settingModelView preferredStyle:TYAlertControllerStyleActionSheet];
    alertController.backgoundTapDismissEnable = YES;
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)showAlertViewInWindowAction:(id)sender {

    TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"TYAlertView" message:@"A message should be a short, but it can support long message, hahahhahahahahhahahahahhaahahhahahahahahhahahahahhahahahahahhahahahahahhahahahhahahhahahahahh. (NSTextAlignmentCenter)"];

    [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancel handler:^(TYAlertAction *action) {

    }]];

    [alertView addAction:[TYAlertAction actionWithTitle:@"确定" style:TYAlertActionStyleDestructive handler:^(TYAlertAction *action) {

    }]];

    // first way to show ,use UIView Category
    [alertView showInWindowWithOriginY:200 backgoundTapDismissEnable:YES];

    // second way to show
    //[TYShowAlertView showAlertViewWithView:alertView originY:200 backgoundTapDismissEnable:YES];
}

- (void)customViewInWindowAction:(id)sender {
    ShareView *shareView = [ShareView createViewFromNib];

    // use UIView Category
    [shareView showInWindow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
