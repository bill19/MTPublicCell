//
//  MTPublicCell.m
//  MTPublicCell
//
//  Created by HaoSun on 16/10/25.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "MTPublicCell.h"

#define Title_Font    [UIFont systemFontOfSize:14]
#define Content_Font  [UIFont systemFontOfSize:12]

@interface MTPublicCell()



@end

@implementation MTPublicCell

+ (instancetype)mtPublicCell:(UITableView *)tableView{

    static NSString *ID = @"MTPublicCell";

    MTPublicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    if (!cell) {
        cell = [[MTPublicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;

}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
        [self setupLayout];
    }
    return self;
}

/**
 *  控件
 */
- (void)setupSubViews{


}

- (void)setupLayout{


}


@end
