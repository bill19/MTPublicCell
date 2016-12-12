//
//  MTSelectCell.m
//  MTPublicCell
//
//  Created by HaoSun on 16/11/16.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "MTSelectCell.h"
#import "MTSelectModel.h"

#import "MTPublicHeader.h"

@interface MTSelectCell()

@property (nonatomic, weak) UILabel *contentTextLabel;

@property (nonatomic, weak) UILabel *titleLabel;

@property (nonatomic, weak) UIPickerView *pickerView;
@end


@implementation MTSelectCell



+ (instancetype)selectCell:(UITableView *)tableView{
    static NSString *ID = @"MTSelectCell";
    MTSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MTSelectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
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

- (void)setupSubViews{
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setFont:MTFont16];
    _titleLabel = titleLabel;
    [self.contentView addSubview:_titleLabel];

    UILabel *contentTextLabel = [[UILabel alloc] init];
    [contentTextLabel setFont:MTFont16];
    _contentTextLabel = contentTextLabel;
    [self.contentView addSubview:self.textLabel];

}

- (void)setupLayout{

    CGFloat space = 5;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(space*2);
        make.top.equalTo(self.mas_top).offset(space);
        make.bottom.equalTo(self.mas_bottom).offset(space);
    }];

    [_contentTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel.mas_left).offset(ScreenW - 100);
        make.top.equalTo(self.mas_top).offset(space);
        make.bottom.equalTo(self.mas_bottom).offset(space);
    }];

}

- (void)setSelectModel:(MTSelectModel *)selectModel{

    _selectModel = selectModel;

    _titleLabel.text = _selectModel.selectTitle;
    _contentTextLabel.text = _selectModel.contentText;

}

@end
