//
//  SHXibViewCell.h
//  MTPublicCell
//
//  Created by HaoSun on 2017/5/15.
//  Copyright © 2017年 MaiTian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHXibViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconVIew;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelLeftLayoutConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fontLabelLeftLayout;
+ (instancetype)xibViewCell:(UITableView *)tableView;
@end
