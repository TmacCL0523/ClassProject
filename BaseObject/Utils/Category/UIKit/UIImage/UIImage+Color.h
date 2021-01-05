/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIImage+Color.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

@interface UIImage (Color)

/// 根据颜色生成纯色图片
/// @param color 颜色
+ (UIImage *)cl_imageWithColor:(UIColor *)color;

/// 取图片某一点的颜色
/// @param point 坐标
- (UIColor *)cl_colorAtPoint:(CGPoint)point;

/// 取某一像素的颜色
/// @param point 坐标
- (UIColor *)cl_colorAtPixel:(CGPoint)point;

/**
 * Function: 图片是否有透明度通道
 */
- (BOOL)cl_hasAlphaChannel;

/// 获得灰度图
/// @param imageName 图片名称
+ (UIImage *)cl_covertToGrayImageName:(NSString *)imageName;

/**
 * Function: 获得灰度图
 */
-(UIImage *)cl_covertToGrayImage;

@end
