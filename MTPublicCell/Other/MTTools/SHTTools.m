//
//  SHTTools.m
//  MTPublicCell
//
//  Created by HaoSun on 16/12/7.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "SHTTools.h"

@implementation SHTTools

/**
*  压缩图片到指定尺寸大小
*
*  @param image 原始图片
*  @param size  目标大小
*
*  @return 生成图片
 */

- (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size{

    UIImage * resultImage = image;
    UIGraphicsBeginImageContext(size);
    [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIGraphicsEndImageContext();
    return image;
}


/**
 *  压缩图片到指定文件大小
 *
 *  @param image 目标图片
 *  @param size  目标大小（最大值）
 *
 *  @return 返回的图片文件
 */
- (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size{
    NSData * data = UIImageJPEGRepresentation(image, 1.0);
    CGFloat dataKBytes = data.length/1000.0;
    CGFloat maxQuality = 0.9f;
    CGFloat lastData = dataKBytes;
    while (dataKBytes > size && maxQuality > 0.01f) {
        maxQuality = maxQuality - 0.01f;
        data = UIImageJPEGRepresentation(image, maxQuality);
        dataKBytes = data.length / 1000.0;
        if (lastData == dataKBytes) {
            break;
        }else{
            lastData = dataKBytes;
        }
    }
    return data;
}


//头像/图片点击产生大图 ,截取路径
+ (NSString *)cutStringWithPath:(NSString *)path{

    NSString *str = [NSString stringWithFormat:@"%@",path];

    NSMutableString *newString = [[NSMutableString alloc] initWithCapacity:str.length];

    for (NSInteger i = str.length - 1; i >= 0 ; i--) {
        unichar ch = [str characterAtIndex:i];
        [newString appendFormat:@"%c",ch];
    }

    NSRange startRange = [newString rangeOfString:@"."];
    NSRange endRange = [newString rangeOfString:@"_"];
    NSRange range = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
    NSString *temp1;
    if (range.length != 1) {
        temp1 = @"";
    }else{
        temp1 = [NSString stringWithFormat:@".%@_",[newString substringWithRange:range]];
    }

    NSString *temp2 = [newString stringByReplacingOccurrencesOfString:temp1 withString:@"."];

    NSMutableString *tempstr = [[NSMutableString alloc] initWithCapacity:temp2.length];

    for (NSInteger i = temp2.length - 1; i >= 0 ; i--) {
        unichar ch = [temp2 characterAtIndex:i];
        [tempstr appendFormat:@"%c",ch];
    }

    return tempstr;

}
@end
