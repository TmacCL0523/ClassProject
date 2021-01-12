/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSString+NSNumber.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/




#import "NSString+NSNumber.h"



@implementation NSString (NSNumber)

/// 数字格式化样式 示例：12345678.89 --> 12,345,678.89
/// @param numberStyle 样式
/// @param numberString 创建字符串
+ (NSString *)cl_numberFormatterWithStyle:(NSNumberFormatterStyle)numberStyle numberString:(NSString *)numberString {
    NSString *         numString = numberString;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *         number    = [formatter numberFromString:numString];
    formatter.numberStyle        = numberStyle;
    NSString *string             = [formatter stringFromNumber:number];

    return string;
}

/**
 *  手机号码格式化样式
 *  344【中间空格】，示例：13855556666 --> 138 5555 6666
 */
- (NSString *)cl_phoneNumberFormatter {
    NSString *phone = self;

    while( phone.length > 0 ) {
        NSString *subString = [phone substringToIndex:MIN(phone.length, 3)];
        if( phone.length >= 7 ) {
            subString = [subString stringByAppendingString:@" "];
            subString = [subString stringByAppendingString:[phone substringWithRange:NSMakeRange(3, 4)]];
        }
        if( phone.length == 11 ) {
            subString = [subString stringByAppendingString:@" "];
            subString = [subString stringByAppendingString:[phone substringWithRange:NSMakeRange(7, 4)]];
            phone     = subString;
            break;
        }
    }

    return phone;
}

/**
 *  手机号码格式化样式
 *  3*4【中间4位为*】，示例：13855556666 --> 138****6666
 */
- (NSString *)cl_phoneNumberFormatterCenterStar {
    NSString *phone = self;

    while( phone.length > 0 ) {
        phone = [phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
        break;
    }
    return phone;
}

/**
 *  格式化为带小数点的数字
 *  示例：12345678.89 --> 12,345,678.89
 */
- (NSString *)cl_stringFormatterWithDecimalStyle {
    return [NSString cl_numberFormatterWithStyle:NSNumberFormatterDecimalStyle numberString:self];
}

/**
 *  格式化为货币样式
 *  示例：12345678.89 --> 12,345,678.89
 */
- (NSString *)cl_stringFormatterWithCurrencyStyle {
    return [NSString cl_numberFormatterWithStyle:NSNumberFormatterCurrencyStyle numberString:self];
}

/**
 *  格式化为百分比样式
 *  示例：12345678.89 --> 1,234,567,889%
 */
- (NSString *)cl_stringFormatterWithPercentStyle {
    return [NSString cl_numberFormatterWithStyle:NSNumberFormatterPercentStyle numberString:self];
}

/**
 *  格式化为科学计数样式
 *  示例：12345678.89 --> 1.234567889E7
 */
- (NSString *)cl_stringFormatterWithScientificStyle {
    return [NSString cl_numberFormatterWithStyle:NSNumberFormatterScientificStyle numberString:self];
}

/**
 *  格式化为英文输出样式（注：此处根据系统语言输出）
 *  示例：12345678.89 --> 一千二百三十四万五千六百七十八点八九
 */
- (NSString *)cl_stringFormatterWithSpellOutStyle {
    return [NSString cl_numberFormatterWithStyle:NSNumberFormatterSpellOutStyle numberString:self];
}

/**
 *  格式化为序数样式
 *  示例：12345678.89 --> 第1234,5679
 */
- (NSString *)cl_stringFormatterWithOrdinalStyle {
    return [NSString cl_numberFormatterWithStyle:NSNumberFormatterOrdinalStyle numberString:self];
}

/**
 *  格式化为货币ISO代码样式样式
 *  示例：123456889.86 --> CNY123,456,889.86
 */
- (NSString *)cl_stringFormatterWithCurrencyISOCodeStyle {
    return [NSString cl_numberFormatterWithStyle:NSNumberFormatterCurrencyISOCodeStyle numberString:self];
}

/**
 *  格式化为货币多样式
 *  示例：12345678.89 --> USD 12,345,678.89
 */
- (NSString *)cl_stringFormatterWithCurrencyPluralStyle {
    return [NSString cl_numberFormatterWithStyle:NSNumberFormatterCurrencyPluralStyle numberString:self];
}
/**
 *  格式化为货币会计样式
 *  示例：12345678.89 --> 12,345,678.89美元
 */
- (NSString *)cl_stringFormatterWithCurrencyAccountingStyle {
    return [NSString cl_numberFormatterWithStyle:NSNumberFormatterCurrencyAccountingStyle numberString:self];
}
/**
 *  保留纯数字
 */
- (NSString *)cl_removeStringSaveNumber {
    NSCharacterSet *setToRemove = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    return [[self componentsSeparatedByCharactersInSet:setToRemove] componentsJoinedByString:@""];
}

/**
 *  点赞数处理
 *  2.1千，3.4万
 */
- (NSString *)cl_stringFormatterWithLikeNumberStyle {
    float number = [self integerValue];

    NSString *numberString = @"";
    if( number < 1000 ) {
        numberString = [NSString stringWithFormat:@"%.0f", number];
    } else if( number / 1000 && number / 10000 < 1 ) {
        numberString = [NSString stringWithFormat:@"%.1f千", number / 1000];
    } else {
        numberString = [NSString stringWithFormat:@"%.1f万", number / 10000];
    }

    return numberString;
}

@end
