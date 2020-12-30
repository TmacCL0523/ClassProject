/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSString+Encryption.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import <Foundation/Foundation.h>

@interface NSString (Encryption)

/// 字符串 - MD5
- (NSString *)cl_MD5String;

/// 字符串 - SHA1
- (NSString *)cl_SHA1string;

/// 字符串 - SHA256
- (NSString *)cl_SHA256string;

/// 字符串 - SHA512
- (NSString *)cl_SHA512string;

/// 检查自身是否追加字符串
/// @param substring 追加字符串
- (BOOL)cl_stringIsHasString:(NSString *)substring;

/// 创建 - Base64编码字符串
/// @param string 需要编码的字符串
+ (NSString *)cl_stringEncodeToBase64:(NSString *)string;

/// 字符串 - Base64编码字符串
- (NSString *)cl_stringEncodeToBase64;

/// 创建 - Base64解码字符串
/// @param string 需要解码字符串
+ (NSString *)cl_stringDecodeBase64:(NSString *)string;

/// 字符串 - Base64解码字符串
- (NSString *)cl_stringDecodeBase64;

/// 字符串 - 转换为UTF8字符串
/// @param string 出入字符串
+ (NSString *)cl_convertToUTF8Entities:(NSString *)string;
@end
