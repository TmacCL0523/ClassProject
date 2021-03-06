/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSString+Regular.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import "NSString+Regular.h"

@implementation NSString (Regular)

/// 返回正则表达式匹配的第一个结果,匹配的第一个结果 是 NSTextCheckingResult 类型
/// @param pattern 正则表达式
- (NSTextCheckingResult *)cl_regularFirstMacthWithPattern:(NSString *)pattern {
    //正则表达式的创建很容易失败，注意捕获错误
    NSError *error = nil;
    //根据正则表达式创建实例
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    if( error ) {
        NSLog(@"正则表达式创建失败");

        return nil;
    }
    //匹配出结果
    NSTextCheckingResult *result = [regular firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];

    if( result ) {
        NSLog(@"匹配");
        return result;
    } else {
        NSLog(@"不匹配");
        return nil;
    }
}

- (NSArray<NSTextCheckingResult *> *)cl_regularMachesWithPattern:(NSString *)pattern {
    NSError *            error      = nil;
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    if( error ) {
        NSLog(@"正则表达式创建失败");
        return nil;
    }
    return [expression matchesInString:self options:0 range:NSMakeRange(0, self.length)];
}

@end
