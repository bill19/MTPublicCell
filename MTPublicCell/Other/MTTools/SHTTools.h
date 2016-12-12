//
//  SHTTools.h
//  MTPublicCell
//
//  Created by HaoSun on 16/12/7.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SHTTools : NSObject


/**
 *  压缩图片到指定尺寸大小
 *
 *  @param image 原始图片
 *  @param size  目标大小
 *
 *  @return 生成图片
 */

- (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size;


/**
 *  压缩图片到指定文件大小
 *
 *  @param image 目标图片
 *  @param size  目标大小（最大值）
 *
 *  @return 返回的图片文件
 */
- (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;

@end
