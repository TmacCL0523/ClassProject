/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSString+CGSize.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import "NSString+CGSize.h"

@implementation NSString (CGSize)

/// 获取文本size - 根据字体大小
/// @param maxSize 最大size
/// @param fontSize 字体大小
- (CGSize)cl_stringGetSizeWithMaxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize {
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil].size;
}

/// 获取文字 size - 根据字体大小
/// @param maxSize 最大字体
/// @param font 字体
- (CGSize)cl_stringGetSizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font {
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
}

/// 获取字符串高度 - 设置宽度 字体
/// @param font 字体
/// @param width 宽度
- (CGFloat)cl_stringGetHeightWithFont:(UIFont *)font width:(CGFloat)width {
    CGRect bounds = CGRectZero;
    bounds =
        [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil];
    return ceilf(bounds.size.height);
}

/// 获取字符串宽度 - 设置高度 字体
/// @param font 字体
/// @param height 高度
- (CGFloat)cl_stringGetWidthWithFont:(UIFont *)font height:(CGFloat)height {
    CGRect bounds = CGRectZero;

    bounds =
        [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil];

    return ceilf(bounds.size.width);
}

/// 获取富文本高度 - 设置高度/富文本样式
/// @param attributeDictionary 富文本样式
/// @param width 宽度
- (CGFloat)cl_stringGetHeightWithStringAttributeDictionary:(NSDictionary<NSString *, id> *)attributeDictionary width:(CGFloat)width {
    NSParameterAssert(attributeDictionary);
    CGFloat height = 0;

    if( self.length ) {
        CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                         options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attributeDictionary
                                         context:nil];
        height      = rect.size.height;
    }

    return height;
}

/// 获取富文本宽度 - 设置富文本样式
/// @param attributeDictionary 富文本样式
- (CGFloat)cl_widthWithStringAttributeDictionary:(NSDictionary<NSString *, id> *)attributeDictionary {
    NSParameterAssert(attributeDictionary);
    CGFloat width = 0;

    if( self.length ) {
        CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, 0)
                                         options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attributeDictionary
                                         context:nil];

        width = rect.size.width;
    }

    return width;
}

/// 反转字符串
/// @param strSrc 被反转字符串
+ (NSString *)cl_reverseString:(NSString *)strSrc {
    NSMutableString *reverseString = [[NSMutableString alloc] init];
    NSInteger        charIndex     = [strSrc length];
    while( charIndex > 0 ) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reverseString appendString:[strSrc substringWithRange:subStrRange]];
    }
    return reverseString;
}

@end
