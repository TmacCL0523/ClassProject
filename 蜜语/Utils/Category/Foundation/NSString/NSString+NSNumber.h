/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSString+NSNumber.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import <Foundation/Foundation.h>

@interface NSString (NSNumber)

/// 数字格式化样式 示例：12345678.89 --> 12,345,678.89
/// @param numberStyle 样式
/// @param numberString 创建字符串
+ (NSString *)cl_numberFormatterWithStyle:(NSNumberFormatterStyle)numberStyle numberString:(NSString *)numberString;

/**
 *  手机号码格式化样式
 *  344【中间空格】，示例：13855556666 --> 138 5555 6666
 */
- (NSString *)cl_phoneNumberFormatter;

/**
 *  手机号码格式化样式
 *  3*4【中间4位为*】，示例：13855556666 --> 138****6666
 */
- (NSString *)cl_phoneNumberFormatterCenterStar;

/**
 *  格式化为带小数点的数字
 *  示例：12345678.89 --> 12,345,678.89
 */
- (NSString *)cl_stringFormatterWithDecimalStyle;

/**
 *  格式化为货币样式
 *  示例：12345678.89 --> 12,345,678.89
 */
- (NSString *)cl_stringFormatterWithCurrencyStyle;

/**
 *  格式化为百分比样式
 *  示例：12345678.89 --> 1,234,567,889%
 */
- (NSString *)cl_stringFormatterWithPercentStyle;

/**
 *  格式化为科学计数样式
 *  示例：12345678.89 --> 1.234567889E7
 */
- (NSString *)cl_stringFormatterWithScientificStyle;

/**
 *  格式化为英文输出样式（注：此处根据系统语言输出）
 *  示例：12345678.89 --> 一千二百三十四万五千六百七十八点八九
 */
- (NSString *)cl_stringFormatterWithSpellOutStyle;

/**
 *  格式化为序数样式
 *  示例：12345678.89 --> 第1234,5679
 */
- (NSString *)cl_stringFormatterWithOrdinalStyle;

/**
 *  格式化为货币ISO代码样式样式
 *  示例：123456889.86 --> CNY123,456,889.86
 */
- (NSString *)cl_stringFormatterWithCurrencyISOCodeStyle;

/**
 *  格式化为货币多样式
 *  示例：12345678.89 --> USD 12,345,678.89
 */
- (NSString *)cl_stringFormatterWithCurrencyPluralStyle;

/**
 *  格式化为货币会计样式
 *  示例：12345678.89 --> 12,345,678.89美元
 */
- (NSString *)cl_stringFormatterWithCurrencyAccountingStyle;

/**
 *  保留纯数字
 */
- (NSString *)cl_removeStringSaveNumber;

/**
 *  点赞数处理
 *  2.1千，3.4万
 */
- (NSString *)cl_stringFormatterWithLikeNumberStyle;

@end
