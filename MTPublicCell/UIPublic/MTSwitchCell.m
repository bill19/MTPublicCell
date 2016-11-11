//
//  MTSwitchCell.m
//  MTPublicCell
//
//  Created by HaoSun on 16/11/3.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "MTSwitchCell.h"
#import "MTSwitchModel.h"
#import "MTPublicHeader.h"

@interface MTSwitchCell()

@property (nonatomic, weak) UISwitch *mySwitch;

@property (nonatomic, weak) UILabel *titleLabel;

@end


@implementation MTSwitchCell

+ (instancetype)switchCell:(UITableView *)tableView{
    static NSString *ID = @"MTSwitchCell";
    MTSwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MTSwitchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
    [titleLabel setFont:[UIFont systemFontOfSize:16]];
    _titleLabel = titleLabel;
    [self.contentView addSubview:_titleLabel];

    UISwitch *mySwitch = [[UISwitch alloc] init];
    _mySwitch = mySwitch;
    [self.contentView addSubview:_mySwitch];


}

- (void)setupLayout{

    CGFloat space = 5;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(space*2);
        make.top.equalTo(self.mas_top).offset(space);
        make.bottom.equalTo(self.mas_bottom).offset(space);
    }];

    [_mySwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel.mas_left).offset(ScreenW - 100);
        make.top.equalTo(self.mas_top).offset(space);
        make.bottom.equalTo(self.mas_bottom).offset(space);
    }];
}

- (void)setSwitchModel:(MTSwitchModel *)switchModel{

    _switchModel = switchModel;
    _titleLabel.text = _switchModel.switchTitle;

    if (_switchModel.isOpen) {
        _mySwitch.on = YES;
    }else{
        _mySwitch.on = NO;
    }

}



@end
