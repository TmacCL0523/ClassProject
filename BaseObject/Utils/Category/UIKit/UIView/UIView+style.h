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
- (void)cl_removeBorders

@end
