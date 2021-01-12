/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UILabel+cl_Create.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

@interface UILabel (cl_Create)
/// 初始化
/// @param text 文本信息
/// @param font 文本字体
/// @param color 文本颜色
/// @param alignment 对齐方式
/// @param lines 行数
+ (UILabel *)cl_lableWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment lines:(NSInteger)lines;

/// 初始化 - 阴影效果
/// @param text 文本信息
/// @param font 文本字体
/// @param color 文本颜色
/// @param alignment 对齐方式
/// @param lines 行数
/// @param colorShadow 阴影颜色
+ (UILabel *)cl_shadowColorLableWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment lines:(NSInteger)lines shadowColor:(UIColor *)colorShadow;

/// 划线
/// @param color 颜色
+ (UILabel *)cl_lineWithColor:(UIColor *)color;
@end
