/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSDictionary+cl_Merge.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "NSDictionary+cl_Merge.h"

@implementation NSDictionary (cl_Merge)

/// 创建字典 - 根据2个字典合并成一个新的字典
/// @param dict1 字典1
/// @param dict2 字典2
+ (NSDictionary *)cl_createDictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2 {
    NSMutableDictionary *result     = [NSMutableDictionary dictionaryWithDictionary:dict1];
    NSMutableDictionary *resultTemp = [NSMutableDictionary dictionaryWithDictionary:dict1];
    [resultTemp addEntriesFromDictionary:dict2];
    [resultTemp enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if( [dict1 objectForKey:key] ) {
            if( [obj isKindOfClass:[NSDictionary class]] ) {
                NSDictionary *newVal = [[dict1 objectForKey:key] cl_dictionaryByMergingWith:(NSDictionary *) obj];
                [result setObject:newVal forKey:key];
            } else {
                [result setObject:obj forKey:key];
            }
        } else if( [dict2 objectForKey:key] ) {
            if( [obj isKindOfClass:[NSDictionary class]] ) {
                NSDictionary *newVal = [[dict2 objectForKey:key] cl_dictionaryByMergingWith:(NSDictionary *) obj];
                [result setObject:newVal forKey:key];
            } else {
                [result setObject:obj forKey:key];
            }
        }
    }];
    return (NSDictionary *) [result mutableCopy];
}

/// 合并字典
/// @param dict 字典
- (NSDictionary *)cl_dictionaryByMergingWith:(NSDictionary *)dict {
    return [[self class] cl_createDictionaryByMerging:self with:dict];
}

@end
