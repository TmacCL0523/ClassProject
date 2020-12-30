/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSString+Regular.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import <Foundation/Foundation.h>

@interface NSString (Regular)

/// 返回正则表达式匹配的第一个结果,匹配的第一个结果 是 NSTextCheckingResult 类型
/// @param pattern 正则表达式
- (NSTextCheckingResult *)cl_regularFirstMacthWithPattern:(NSString *)pattern;

- (NSArray<NSTextCheckingResult *> *)cl_regularMachesWithPattern:(NSString *)pattern;
@end
