/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSDictionary+XML.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <Foundation/Foundation.h>

@interface NSDictionary (XML)

/// 将NSDictionary转换成XML 字符串
- (NSString *)cl_XMLString;

@end
