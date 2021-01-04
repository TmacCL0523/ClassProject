/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSDictionary+XML.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "NSDictionary+XML.h"

@implementation NSDictionary (XML)

/// 将NSDictionary转换成XML 字符串
- (NSString *)cl_XMLString {
    NSString *xmlStr = @"<xml>";

    for( NSString *key in self.allKeys ) {
        NSString *value = [self objectForKey:key];

        xmlStr = [xmlStr stringByAppendingString:[NSString stringWithFormat:@"<%@>%@</%@>", key, value, key]];
    }

    xmlStr = [xmlStr stringByAppendingString:@"</xml>"];

    return xmlStr;
}

@end
