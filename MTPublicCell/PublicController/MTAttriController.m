//
//  MTAttriController.m
//  MTPublicCell
//
//  Created by HaoSun on 16/11/29.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "MTAttriController.h"
#import "MTPublicHeader.h"

@interface MTAttriController ()

@property (nonatomic, weak) UILabel *attrLabel;

@property (nonatomic, weak) UILabel *mytestLable;

@end

@implementation MTAttriController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*2.     常见的属性及说明

     NSFontAttributeName
     字体
     NSParagraphStyleAttributeName
     段落格式
     NSForegroundColorAttributeName
     字体颜色
     NSBackgroundColorAttributeName
     背景颜色
     NSStrikethroughStyleAttributeName
     删除线格式
     NSUnderlineStyleAttributeName
     下划线格式
     NSStrokeColorAttributeName
     删除线颜色
     NSStrokeWidthAttributeName
     删除线宽度
     NSShadowAttributeName 
     阴影
     */
    /*段落文字展示*/
    //段落剧中
    NSMutableParagraphStyle *paragraphLeft = [[NSMutableParagraphStyle alloc] init];
    paragraphLeft.alignment = NSTextAlignmentLeft;
    //段落剧左侧
    NSMutableParagraphStyle *paragraphCenter = [[NSMutableParagraphStyle alloc] init];
    paragraphCenter.alignment = NSTextAlignmentCenter;

    //段落居右
    NSMutableParagraphStyle *paragraphRight = [[NSMutableParagraphStyle alloc] init];
    paragraphRight.alignment = NSTextAlignmentRight;

    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *attrLabel = [[UILabel alloc] init];
    attrLabel.frame = CGRectMake(0, 100, ScreenW, 200);
    self.attrLabel = attrLabel;
    [self.view addSubview:_attrLabel];
    //iOS6以后 在UILabel显示不同的字体和颜色
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"Using NSAttributed String"];

    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0,5)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(6,12)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(19,6)];

    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:30.0] range:NSMakeRange(0, 5)];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0] range:NSMakeRange(6, 12)];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier-BoldOblique" size:30.0] range:NSMakeRange(19, 6)];
    self.attrLabel.attributedText = str;



    UILabel *mytestlabel = [[UILabel alloc] init];
    mytestlabel.frame = CGRectMake(0, 300, ScreenW, 200);
    mytestlabel.numberOfLines = 0;
    
    _mytestLable = mytestlabel;

    [self.view addSubview:_mytestLable];

    NSMutableAttributedString *mytestString = [[NSMutableAttributedString alloc] initWithString:@"我来尝试并且测试一下我的文文档信息\n这里是居中显示文字\n这里的段落文字我试试左侧展示    \n这一段居右侧显示\n并且测试一下我的文文档信息我来尝试并且测试一下我\n的文文档信息"];

    [mytestString addAttributes:@{NSForegroundColorAttributeName : [UIColor greenColor],
                                  NSFontAttributeName : [UIFont fontWithName:@"Arial-BoldItalicMT" size:30.0],
                                  } range:NSMakeRange(0, 5)];
    [mytestString addAttributes:@{NSForegroundColorAttributeName : [UIColor blueColor],
                                  NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0],
                                  } range:NSMakeRange(5, 12)];

    [mytestString addAttributes:@{NSForegroundColorAttributeName : [UIColor redColor],
                                  NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0],
                                  NSParagraphStyleAttributeName : paragraphCenter,
                                  } range:NSMakeRange(18, 24)];

    [mytestString addAttributes:@{NSForegroundColorAttributeName : [UIColor greenColor],
                                  NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0],
                                  NSParagraphStyleAttributeName : paragraphLeft,
                                  NSStrokeWidthAttributeName : @3,
                                  NSStrokeColorAttributeName : [UIColor greenColor],
                                  } range:NSMakeRange(28, 38)];


    self.mytestLable.attributedText = mytestString;

    NSString *string = [NSString stringWithFormat:@"%@",mytestString];
    NSArray *arr = [NSArray arrayWithObject:@"这里"];
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 500, ScreenW, 200);

    label.attributedText = [MTAttributedTools ls_changeCorlorWithColor:[UIColor yellowColor] TotalString:string SubStringArray:arr];


}
@end
