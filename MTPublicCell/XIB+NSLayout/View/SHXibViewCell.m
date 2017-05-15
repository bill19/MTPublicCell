//
//  SHXibViewCell.m
//  MTPublicCell
//
//  Created by HaoSun on 2017/5/15.
//  Copyright © 2017年 MaiTian. All rights reserved.
//

#import "SHXibViewCell.h"

@implementation SHXibViewCell

+ (instancetype)xibViewCell:(UITableView *)tableView{
    static NSString *ID = @"SHXibViewCell";
    SHXibViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:ID owner:nil options:nil] lastObject];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    /**修改约束*/
    self.fontLabelLeftLayout.constant = 0.0f;
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
