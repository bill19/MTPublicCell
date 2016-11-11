//
//  MTTextCell.m
//  MTPublicCell
//
//  Created by HaoSun on 16/11/3.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "MTTextCell.h"
#import "MTTextModel.h"
#import "MTPublicHeader.h"

@interface MTTextCell()<UITextFieldDelegate>

@property (nonatomic, weak) UILabel *titleLabel;

@property (nonatomic, weak) UITextField *textField;

@end

@implementation MTTextCell

+ (instancetype)textCell:(UITableView *)tableView{
    static NSString *ID = @"MTTextCell";
    MTTextCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MTTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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

- (void)setupSubViews{

    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setFont:[UIFont systemFontOfSize:16]];
    _titleLabel = titleLabel;
    [self.contentView addSubview:_titleLabel];

    UITextField *textField = [[UITextField alloc] init];
    textField.delegate = self;
    _textField = textField;
    [self.contentView addSubview:_textField];

}

- (void)setupLayout{

    CGFloat space = 5;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(space*2);
        make.top.equalTo(self.mas_top).offset(space);
        make.bottom.equalTo(self.mas_bottom).offset(space);
    }];

    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel.mas_right).offset(space*4);
        make.top.equalTo(self.mas_top).offset(space);
        make.bottom.equalTo(self.mas_bottom).offset(space);
    }];
}


- (void)setTextModel:(MTTextModel *)textModel{

    _textModel = textModel;
    _titleLabel.text = _textModel.textTitle;
    _textField.placeholder = _textModel.textDetial;

}


@end
