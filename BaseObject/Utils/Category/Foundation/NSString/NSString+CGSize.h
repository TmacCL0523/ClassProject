/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSString+CGSize.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import <Foundation/Foundation.h>

@interface NSString (CGSize)

/// 获取文本size - 根据字体大小
/// @param maxSize 最大size
/// @param fontSize 字体大小
- (CGSize)cl_stringGetSizeWithMaxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize;

/// 获取文字 size - 根据字体大小
/// @param maxSize 最大字体
/// @param font 字体
- (CGSize)cl_stringGetSizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font;

/// 获取字符串高度 - 设置宽度 字体
/// @param font 字体
/// @param width 宽度
- (CGFloat)cl_stringGetHeightWithFont:(UIFont *)font width:(CGFloat)width;

/// 获取字符串宽度 - 设置高度 字体
/// @param font 字体
/// @param height 高度
- (CGFloat)cl_stringGetWidthWithFont:(UIFont *)font height:(CGFloat)height;

/// 获取富文本高度 - 设置高度/富文本样式
/// @param attributeDictionary 富文本样式
/// @param width 宽度
- (CGFloat)cl_stringGetHeightWithStringAttributeDictionary:(NSDictionary<NSString *, id> *)attributeDictionary width:(CGFloat)width;

/// 获取富文本宽度 - 设置富文本样式
/// @param attributeDictionary 富文本样式
- (CGFloat)cl_widthWithStringAttributeDictionary:(NSDictionary<NSString *, id> *)attributeDictionary;

/// 反转字符串
/// @param strSrc 被反转字符串
+ (NSString *)cl_reverseString:(NSString *)strSrc;
@end
