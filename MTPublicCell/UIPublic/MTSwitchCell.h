//
//  MTSwitchCell.h
//  MTPublicCell
//
//  Created by HaoSun on 16/11/3.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MTSwitchModel;

@interface MTSwitchCell : UITableViewCell

+ (instancetype)switchCell:(UITableView *)tableView;

@property (nonatomic, strong) MTSwitchModel *switchModel;

@end
