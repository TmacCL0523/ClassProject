/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UILabel+cl_Create.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "UILabel+cl_Create.h"

@implementation UILabel (cl_Create)

/// 初始化
/// @param text 文本信息
/// @param font 文本字体
/// @param color 文本颜色
/// @param alignment 对齐方式
/// @param lines 行数
+ (UILabel *)cl_lableWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment lines:(NSInteger)lines {
    return [self cl_shadowColorLableWithText:text font:font color:color alignment:alignment lines:lines shadowColor:UIColor.clearColor];
}

/// 初始化 - 阴影效果
/// @param text 文本信息
/// @param font 文本字体
/// @param color 文本颜色
/// @param alignment 对齐方式
/// @param lines 行数
/// @param colorShadow 阴影颜色
+ (UILabel *)cl_shadowColorLableWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment lines:(NSInteger)lines shadowColor:(UIColor *)colorShadow {
    UILabel *label = [UILabel new];
    [label setFont:font];
    [label setText:text];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:color];
    [label setShadowColor:colorShadow];
    [label setTextAlignment:alignment];
    [label setNumberOfLines:lines];

    return label;
}

/// 划线
/// @param color 颜色
+ (UILabel *)cl_lineWithColor:(UIColor *)color {
    UILabel *lb        = [UILabel new];
    lb.backgroundColor = color;
    return lb;
}
@end
