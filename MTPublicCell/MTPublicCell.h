//
//  MTPublicCell.h
//  MTPublicCell
//
//  Created by HaoSun on 16/10/25.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MTPublicCell : UITableViewCell

/**
 *  创建cell  这个cell作为发文章和发动态的类型
 */
+ (instancetype)mtPublicCell:(UITableView *)tableView;

@end
