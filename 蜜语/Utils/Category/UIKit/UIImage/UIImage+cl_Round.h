/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIImage+cl_Round.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

@interface UIImage (cl_Round)

/// 圆形图片
/// @param imageName 图片名称
+ (UIImage *)cl_roundImageWithName:(NSString *)imageName;

/**
 * Function: 圆形图片 - 对象方法
 */
- (UIImage *)cl_roundImage;

/// 圆形图片 - 带边框
/// @param imageName 图片名称
/// @param border 边框宽度
/// @param borderColor 边框颜色
+ (UIImage *)cl_roundImageWithName:(NSString *)imageName border:(CGFloat)border borderColor:(UIColor *)borderColor;

/// 圆形图片 - 对象方法
/// @param border 边框
/// @param borderColor 边框颜色
- (UIImage *)cl_roundImageWithBorder:(CGFloat)border borderColor:(UIColor *)borderColor;

/// 圆角图片
/// @param radius 角度
+ (UIImage *)cl_roundImageWithName:(NSString *)imageName cornerRadius:(CGFloat)radius;

/// 圆角图片 - 对象发
/// @param radius 角度
- (UIImage *)cl_roundImageWithCornerRadius:(CGFloat)radius;

/// 圆角图片 - UIBezierPath
/// @param imageName 图片名称
/// @param radius 角度
/// @param size 图片大小
+ (UIImage *)cl_roundImageWithName:(NSString *)imageName radius:(CGFloat)radius size:(CGSize)size;

/// 圆角图片 - UIBezierPath
/// @param radius 角度
/// @param size 图片大小
- (UIImage *)cl_roundImageRadius:(CGFloat)radius size:(CGSize)size;
@end
