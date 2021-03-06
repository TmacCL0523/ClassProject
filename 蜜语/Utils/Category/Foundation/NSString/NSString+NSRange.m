/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSString+NSRange.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import "NSString+NSRange.h"

@implementation NSString (NSRange)

/// 在接收器的给定范围内查找并返回给定字符串的范围
/// @param searchString searchString
/// @param options  指定搜索选项的掩码。 可以通过将它们与C位OR运算符组合来指定以下选项：NSCaseInsensitiveSearch，NSLiteralSearch，NSBackwardsSearch，NSAnchoredSearch。
/// 有关这些选项的详细信息，请参阅“String Programming Guide”
/// @param serachRange serachRange
- (NSArray<NSValue *> *)cl_rangesOfString:(NSString *)searchString options:(NSStringCompareOptions)options serachRange:(NSRange)serachRange {
    if( serachRange.location == NSNotFound ) {
        serachRange = NSMakeRange(0, self.length);
    }
    NSMutableArray *array = [NSMutableArray array];
    [self cl_rangeOfString:searchString range:serachRange array:array options:options];

    return array;
}

- (void)cl_rangeOfString:(NSString *)searchString range:(NSRange)searchRange array:(NSMutableArray *)array options:(NSStringCompareOptions)mask {
    NSRange range = [self rangeOfString:searchString options:mask range:searchRange];

    if( range.location != NSNotFound ) {
        [array addObject:[NSValue valueWithRange:range]];
        [self cl_rangeOfString:searchString range:NSMakeRange(range.location + range.length, self.length - (range.location + range.length)) array:array options:mask];
    }
}
@end
