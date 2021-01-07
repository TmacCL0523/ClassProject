/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSString+TransForm.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import "NSString+TransForm.h"

@implementation NSString (TransForm)

/// 数字转大写字符串
/// @param number 数字
+ (NSString *)cl_stringTransformNumberToString:(NSInteger)number {
    NSString *str = [NSString stringWithFormat:@"%ld", (long) number];

    NSRange range;
    range.length = 1;

    NSString *finalStr = [NSString string];

    for( NSUInteger i = 0; i < [str length]; i++ ) {
        range.location   = i;
        NSString *subStr = [str substringWithRange:range];
        NSInteger subNum = [subStr integerValue];

        switch( subNum ) {
            case 0: subStr = [NSString cl_replaceNewString:@"零" range:range oldString:str]; break;
            case 1: subStr = [NSString cl_replaceNewString:@"一" range:range oldString:str]; break;
            case 2: subStr = [NSString cl_replaceNewString:@"二" range:range oldString:str]; break;
            case 3: subStr = [NSString cl_replaceNewString:@"三" range:range oldString:str]; break;
            case 4: subStr = [NSString cl_replaceNewString:@"四" range:range oldString:str]; break;
            case 5: subStr = [NSString cl_replaceNewString:@"五" range:range oldString:str]; break;
            case 6: subStr = [NSString cl_replaceNewString:@"六" range:range oldString:str]; break;
            case 7: subStr = [NSString cl_replaceNewString:@"七" range:range oldString:str]; break;
            case 8: subStr = [NSString cl_replaceNewString:@"八" range:range oldString:str]; break;
            case 9: subStr = [NSString cl_replaceNewString:@"九" range:range oldString:str]; break;
            default: break;
        }
        finalStr = [finalStr stringByAppendingString:subStr];
    }
    return finalStr;
}

/// 将旧的字符替换成指定的新的字符
/// @param newString 新字符串
/// @param range 字符串位置
/// @param oldString 需要替换的字符串
+ (NSString *)cl_replaceNewString:(NSString *)newString range:(NSRange)range oldString:(NSString *)oldString {
    NSString *subStr = @"";

    if( oldString.length == 1 ) {
        subStr = newString;
    } else if( oldString.length == 2 ) {
        if( range.location == 0 ) {
            subStr = [NSString stringWithFormat:@"%@十", newString];
        } else if( range.location == 1 ) {
            subStr = newString;
        }
    } else if( oldString.length == 3 ) {
        if( range.location == 0 ) {
            subStr = [NSString stringWithFormat:@"%@百", newString];
        } else if( range.location == 1 ) {
            subStr = [NSString stringWithFormat:@"%@十", newString];
        } else if( range.location == 2 ) {
            subStr = newString;
        }
    }
    return subStr;
}

/**
 *  清除html标签
 */
- (NSString *)cl_removeHtmlTags {
    return [self stringByReplacingOccurrencesOfString:@"<[^>]+>" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, self.length)];
}

/**
 *  清除js脚本
 */
- (NSString *)cl_removeJaveScript {
    NSMutableString *    mString = [self mutableCopy];
    NSError *            error;
    NSRegularExpression *regex   = [NSRegularExpression regularExpressionWithPattern:@"<script[^>]*>[\\w\\W]*</script>" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *            matches = [regex matchesInString:mString options:NSMatchingReportProgress range:NSMakeRange(0, [mString length])];
    for( NSTextCheckingResult *match in [matches reverseObjectEnumerator] ) {
        [mString replaceCharactersInRange:match.range withString:@""];
    }
    return [mString cl_removeHtmlTags];
}

/**
 *  去除空格
 */
- (NSString *)cl_removeSpace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

/**
 *  去除空格与空行
 */
- (NSString *)cl_removeSpaceAndBankLine {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

/// 随机字符串
+ (NSString *)cl_RandomString {
    NSInteger        count        = arc4random_uniform(200);
    NSString *       letters      = @"0123456789ABCDEFGHIJKLMNOPQRST我们还是爱你的狗子你变了,.!我QWERTYUI偶怕对方过后注册风格好看UI欧派";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:count];

    for( NSInteger i = 0; i < count; i++ ) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random_uniform( (uint32_t)letters.length)]];
    }
    return randomString;
}

/// 根据key取不同语言字符串 （国际化操作）
/// @param key 关键字
/// @param table 表名
+ (NSString *)cl_GetStrForLanguageWithKey:(NSString *)key withTable:(NSString *)table {
    NSString *translated = NSLocalizedStringFromTable(key, table, nil);
    return translated;
}
@end
