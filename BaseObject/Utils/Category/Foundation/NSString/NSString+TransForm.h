/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSString+TransForm.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import <Foundation/Foundation.h>

@interface NSString (TransForm)

/// 数字转大写字符串
/// @param number 数字
+ (NSString *)cl_stringTransformNumberToString:(NSInteger)number;

/// 将旧的字符替换成指定的新的字符
/// @param newString 新字符串
/// @param range 字符串位置
/// @param oldString 需要替换的字符串
+ (NSString *)cl_replaceNewString:(NSString *)newString range:(NSRange)range oldString:(NSString *)oldString;

/// 根据key取不同语言字符串 （国际化操作）
/// @param key 关键字
/// @param table 表名
+ (NSString *)cl_GetStrForLanguageWithKey:(NSString *)key withTable:(NSString *)table;

/**
 *  随机字符串
 */
+ (NSString *)cl_RandomString;
/**
 *  清除html标签
 */
- (NSString *)cl_removeHtmlTags;

/**
 *  清除js脚本
 */
- (NSString *)cl_removeJaveScript;

/**
 *  去除空格
 */
- (NSString *)cl_removeSpace;

/**
 *  去除空格与空行
 */
- (NSString *)cl_removeSpaceAndBankLine;

@end
