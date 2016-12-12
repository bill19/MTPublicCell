//
//  MTSelectCell.h
//  MTPublicCell
//
//  Created by HaoSun on 16/11/16.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTSelectModel.h"

@interface MTSelectCell : UITableViewCell

+ (instancetype)selectCell:(UITableView *)tableView;

@property (nonatomic, strong) MTSelectModel *selectModel;

@end
