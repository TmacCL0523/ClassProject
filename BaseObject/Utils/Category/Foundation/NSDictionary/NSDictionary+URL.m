/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSDictionary+URL.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "NSDictionary+URL.h"

@implementation NSDictionary (URL)
/// 字典转json字符串
- (NSString *)cl_dictionaryToJson {
    return [NSDictionary cl_dictionaryToJson:self];
}

/// 字典转json字符串
/// @param dictionary 字典
+ (NSString *)cl_dictionaryToJson:(NSDictionary *)dictionary {
    NSString *json     = nil;
    NSError * error    = nil;
    NSData *  jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];

    if( ! jsonData ) {
        return @"{}";
    } else if( ! error ) {
        json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    } else {
        return error.localizedDescription;
    }
}
@end
