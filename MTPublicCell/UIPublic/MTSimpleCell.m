//
//  MTSimpleCell.m
//  MTPublicCell
//
//  Created by HaoSun on 16/11/3.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "MTSimpleCell.h"
#import "MTPublicModel.h"

@interface MTSimpleCell()

/**
 *  放 数字的label
 */
@property (nonatomic, weak) UILabel *detailL;

@end

@implementation MTSimpleCell

+ (instancetype)publicSimpleCell:(UITableView *)tableView{
    static NSString *ID = @"MTSimpleCell";
    MTSimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MTSimpleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews{
    UILabel *detailL = [[UILabel alloc] init];
    detailL.textAlignment = NSTextAlignmentCenter;
    _detailL = detailL;
    [self.contentView addSubview:detailL];

}

- (void)setPublicModel:(MTPublicModel *)publicModel{

    _publicModel = publicModel;
    if (_publicModel.iconStr == nil) {
        self.imageView.image = nil;
    }else{
        self.imageView.image = [UIImage imageNamed:_publicModel.iconStr];
    }
    self.textLabel.text = _publicModel.titleStr;
    self.textLabel.font = [UIFont systemFontOfSize:16];

    if(!_publicModel.numberStr){
        _detailL.text = @"";
    }else{
        _detailL.text = _publicModel.numberStr;
    }
    _detailL.alpha = 0.4;
    _detailL.textAlignment = NSTextAlignmentRight;
    [_detailL setFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width - 100, 10, 60, 30)];
    
}
@end
