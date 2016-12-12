//
//  MTSelectBtnCell.h
//  MTPublicCell
//
//  Created by HaoSun on 16/11/16.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTSelectBtnModel.h"

@interface MTSelectBtnCell : UITableViewCell


+ (instancetype)selectBtnCell:(UITableView *)tableView;

@property (nonatomic, strong) MTSelectBtnModel *selectBtnModel;

@end
