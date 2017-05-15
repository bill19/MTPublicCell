//
//  DXToastMessage.m
//  DXPublicCell
//
//  Created by HaoSun on 2017/5/15.
//  Copyright © 2017年 MaiTian. All rights reserved.
//

#import "DXToastMessage.h"

@implementation DXToastMessage
//麦麦
NSString *const MM_Name                        = @"消息";

NSString *const DXToastSuccess                 = @"成功";
NSString *const DXToastFailed                  = @"失败";
NSString *const DXToastError                   = @"错误";

NSString *const DXToast_NET_Failed             = @"网络连接失败，请查看网络设置";
NSString *const DXToast_NET_Error              = @"网络错误"; //300
NSString *const DXToast_SEV_Failed             = @"服务器连接失败，请稍后再试";//400
NSString *const DXToast_MOB_Failed             = @"服务器连接失败，请稍后再试";//500
NSString *const DXToast_SEV_OverTime           = @"服务器请求超时，请稍后重试";//超时
NSString *const DXToast_SEV_Loading            = @"";

NSString *const DXToastDelSuccess              = @"删除成功";
NSString *const DXToastDelFailed               = @"删除失败";

NSString *const DXToastAddSuccess              = @"添加成功";
NSString *const DXToastAddFailed               = @"添加失败";
NSString *const DXToastShareSuccess            = @"分享成功";
@end
