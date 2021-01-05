/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIView+style.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

@interface UIView (style)
/// 创建边框
/// @param color 颜色
/// @param radius 角度
/// @param width 宽度
- (void)cl_setBordersWithColor:(UIColor *)color andCornerRadius:(CGFloat)radius andWidth:(CGFloat)width;

/**
 * Function: 删除边框
 */
- (void)cl_removeBorders;

/// 创建阴影
/// @param offset 阴影偏移量
/// @param opacity 透明度
/// @param radius 模糊程度
- (void)cl_setRectShadowWithOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius;

/// 创建圆角半径阴影
/// @param cornerRadius 圆角半径
/// @param offset 偏移量
/// @param opacity 透明度
/// @param radius 模糊程度
- (void)cl_setCornerRadiusShadowWithCornerRadius:(CGFloat)cornerRadius offset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius;

/// 圆角View
/// @param corners 上下左右
/// @param radius 角度
- (void)cl_setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius;

/**
 * Function: 摇摆动画
 */
- (void)cl_shakeAnimation;

@end
