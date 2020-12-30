/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSDictionary+CLKit.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import <Foundation/Foundation.h>

@interface NSDictionary (CLKit)

/// 字典转json字符串
- (NSString *)cl_dictionaryToJson;

/// 字典转json字符串
/// @param dictionary 字典
+ (NSString *)cl_dictionaryToJson:(NSDictionary *)dictionary;

@end
