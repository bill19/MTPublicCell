//
//  MTTextCell.h
//  MTPublicCell
//
//  Created by HaoSun on 16/11/3.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MTTextModel;

@interface MTTextCell : UITableViewCell

+ (instancetype)textCell:(UITableView *)tableView;

@property (nonatomic, strong) MTTextModel *textModel;

@end
