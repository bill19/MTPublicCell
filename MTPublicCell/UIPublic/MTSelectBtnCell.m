//
//  MTSelectBtnCell.m
//  MTPublicCell
//
//  Created by HaoSun on 16/11/16.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "MTSelectBtnCell.h"
#import "MTSelectBtnModel.h"
#import "MTPublicHeader.h"

@interface MTSelectBtnCell()

@property (nonatomic, weak) UILabel * titleLabel;

@property (nonatomic, weak) UIButton *selectBtn;

@end

@implementation MTSelectBtnCell


+ (instancetype)selectBtnCell:(UITableView *)tableView{
    static NSString *ID = @"MTSelectBtnCell";
    MTSelectBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MTSelectBtnCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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

    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [selectBtn setImage:[UIImage imageNamed:@"Selected"] forState:UIControlStateSelected];
    [selectBtn setImage:[UIImage imageNamed:@"unSelected"] forState:UIControlStateNormal];
    [selectBtn addTarget:selectBtn action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _selectBtn = selectBtn;
    [self.contentView addSubview:_selectBtn];


}

- (void)setupLayout{

    CGFloat space = 5;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(space*2);
        make.top.equalTo(self.mas_top).offset(space);
        make.bottom.equalTo(self.mas_bottom).offset(space);
    }];

    [_selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(_titleLabel.mas_right).offset(space);
        make.top.equalTo(self.mas_top).offset(space);
        make.bottom.equalTo(self.mas_bottom).offset(space);
    }];
}

- (void)selectBtnClick:(UIButton *)sender{

    sender.selected = !sender.selected;
    if (sender.selected) {
        [_selectBtn setImage:[UIImage imageNamed:@"Selected"] forState:UIControlStateSelected];
    }else{
        [_selectBtn setImage:[UIImage imageNamed:@"unSelected"] forState:UIControlStateNormal];
    }
    NSLog(@"hellow");
}


- (void)setSelectBtnModel:(MTSelectBtnModel *)selectBtnModel{

    _selectBtnModel = selectBtnModel;

    _titleLabel.text = _selectBtnModel.selectTitle;

    if (_selectBtnModel.isSelect == YES) {
        [_selectBtn setImage:[UIImage imageNamed:@"Selected"] forState:UIControlStateSelected];
    }else{
        [_selectBtn setImage:[UIImage imageNamed:@"unSelected"] forState:UIControlStateNormal];
    }
}

@end
