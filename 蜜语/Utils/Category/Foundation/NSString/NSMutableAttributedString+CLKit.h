/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSMutableAttributedString+CLKit.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (CLKit)

/// 添加富文本
/// @param dict 富文本样式
/// @param range 富文本应用字符串
- (void)cl_AddAttributeDict:(NSDictionary *)dict range:(NSRange)range;

/// 字体颜色
/// @param color 颜色
/// @param range 富文本应用字符串
- (void)cl_changeTextColor:(UIColor *)color range:(NSRange)range;

/// 背景颜色
/// @param color 默认值为nil, 透明色
/// @param range 富文本应用字符串
- (void)cl_changeclckgroundColor:(UIColor *)color range:(NSRange)range;

/// 系统字体
/// @param font 字体大小
/// @param range 富文本应用字符串
- (void)cl_changeTextSystemFont:(UIFont *)font range:(NSRange)range;

/// 字形倾斜度
/// @param value 取值为 NSNumber（float）,正值右倾，负值左倾
/// @param range 富文本应用字符串
- (void)cl_changeTextObliquenessValue:(NSNumber *)value range:(NSRange)range;

/// 文字排版方向
/// @param value 取值为 NSNumber 对象(整数)，0 表示横排文本，1 表示竖排文本
/// @param range 富文本应用字符串
- (void)cl_changeTextVerticalGlyphFormValue:(NSNumber *)value range:(NSRange)range;

/// 文字书写方向
/// @param style 从左向右书写或者从右向左书写
- (void)cl_changeTextWritingDirectionStyle:(NSWritingDirection)style;

/// 行距
/// @param spacing 行距
/// @param loc 下标
/// @param length 长度
- (void)cl_changeTextLineSpacing:(CGFloat)spacing from:(NSInteger)loc length:(NSInteger)length;

/// 某位置的段落距离
/// @param spacing 段落距离
/// @param loc 下标
/// @param length 长度
- (void)cl_changeTextParagraphSpacing:(CGFloat)spacing from:(NSInteger)loc length:(NSInteger)length;

/// 段的顶部和文本内容的开头之间的距离
/// @param spacing 段的顶部和文本内容的开头之间的距离
/// @param loc 下标
/// @param length 长度
- (void)cl_changeTextBeforeLparagraphSpacing:(CGFloat)spacing from:(NSInteger)loc length:(NSInteger)length;

/// 设置下划线样式
/// @param style 样式
/// @param color 颜色
/// @param range 富文本应用字符串
- (void)cl_changeTextUnderlineStyle:(NSUnderlineStyle)style color:(UIColor *)color Range:(NSRange)range;

/// 全部加下划线
/// @param style 样式
/// @param color 颜色
- (void)cl_changeTextUnderlineAtAllStyle:(NSUnderlineStyle)style color:(UIColor *)color;

/// 设置删除线样式
/// @param style 样式
/// @param color 颜色
/// @param range 富文本应用字符串
- (void)cl_changeTextStrikethroughStyle:(NSUnderlineStyle)style color:(UIColor *)color Range:(NSRange)range;

/// 全部添加删除线
/// @param style 样式
/// @param color 颜色
- (void)cl_changeTextStrikethroughAtAllStyle:(NSUnderlineStyle)style color:(UIColor *)color;

/// 设定字符间距
/// @param value NSNumber 对象（整数），正值间距加宽，负值间距变窄
/// @param range 富文本应用字符串
- (void)cl_changeTextKernWithValue:(NSNumber *)value Range:(NSRange)range;

/// 文本横向拉伸属性
/// @param value 取值为 NSNumber （float）,正值横向拉伸文本，负值横向压缩文本
/// @param range 富文本应用字符串
- (void)cl_changeTextExpansionWithValue:(NSNumber *)value Range:(NSRange)range;

/// 根据位置添加阴影效果
/// @param shadow 阴影
/// @param range 富文本应用字符串
- (void)cl_changeShadowWithShadow:(NSShadow *)shadow Range:(NSRange)range;

/// 描边颜色
/// @param strokeColor 颜色
/// @param strokeWidth 描边宽度
/// @param range 富文本应用字符串
- (void)cl_changeStrokeColorWithColor:(UIColor *)strokeColor strokeWidth:(NSNumber *)strokeWidth Range:(NSRange)range;

/// 实例化 NSMutableAttributedString 字符串
/// @param texts 用于存储所需设置字符串的数组(根据所需自定义类型分组)
/// @param attrsArray 富文本属性样式的集合(数组元素是texts的相应文本的属性--字典)
/// @param space texts文本之间的间距数组 1 代表一个空格的距离
- (instancetype)initWithStrings:(NSArray<NSString *> *)texts attributesArray:(NSArray<NSDictionary<NSString *, id> *> *)attrsArray space:(NSArray<NSNumber *> *)space;

@end
