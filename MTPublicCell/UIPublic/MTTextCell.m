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
    }
    return self;
}

- (void)setupSubViews{

    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setFont:MTFont16];
    _titleLabel = titleLabel;
    [self.contentView addSubview:_titleLabel];

    UITextField *textField = [[UITextField alloc] init];
    textField.delegate = self;
    _textField = textField;
    [self.contentView addSubview:_textField];

}



- (void)setTextModel:(MTTextModel *)textModel{


    CGFloat space = 5;
    CGFloat viewH = self.contentView.bounds.size.height;
    _textModel = textModel;
    _titleLabel.text = _textModel.textTitle;
    _textField.placeholder = _textModel.textDetial;

    
    NSDictionary *attributes = @{NSFontAttributeName : MTFont16};
    CGSize titleSize = [_textModel.textTitle sizeWithAttributes:attributes];
    [_titleLabel setFrame:CGRectMake(space, 0, titleSize.width, viewH)];
    [_textField setFrame:CGRectMake(space*3 + titleSize.width, 0, ScreenW -titleSize.width- space*4, viewH)];

}


@end
