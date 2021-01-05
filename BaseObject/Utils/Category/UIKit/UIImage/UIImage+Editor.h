/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIImage+Editor.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

@interface UIImage (Editor)

/**
 * Function: 截屏
 */
+ (UIImage *)cl_screenshots;

/// 截图
/// @param view 界面
+ (UIImage *)cl_screenshotsWithView:(UIView *)view;

/// 合成图片 - 上下
/// @param fistImage 上图片
/// @param otherImage 下图片
+ (UIImage *)cl_mergeImage:(UIImage *)fistImage otherImage:(UIImage *)otherImage;

/// 压缩图片
/// @param imageName 图片名称
/// @param targetWidth 目标宽度
+ (UIImage *)cl_compressionImage:(NSString *)imageName toTargetWidth:(CGFloat)targetWidth;

/// 压缩图片
/// @param targetWidth 目标宽度
- (UIImage *)cl_compressionTargertWidth:(CGFloat)targetWidth;

/// 合成图片 - 图片中添加文字
/// @param imageName 图片名字
/// @param title 文本
/// @param fontSize 文本字体大小
/// @param titleColor 文本颜色
+ (UIImage *)cl_imageName:(NSString *)imageName title:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor;

/// 合成图片 - 图片中添加文字 - 对象方法
/// @param title 文本
/// @param fontSize 文本字体大小
/// @param titleColor 文本颜色
- (UIImage *)cl_imageTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor;

/// 图片模糊
/// @param imageName 图片名称
+ (UIImage *)cl_imageFuzzy:(NSString *)imageName;

/**
 * Function: 图片模糊
 */
- (UIImage *)cl_imageFuzzy;

@end
