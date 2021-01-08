/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSDictionary+cl_Merge.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <Foundation/Foundation.h>

@interface NSDictionary (cl_Merge)

/// 创建字典 - 根据2个字典合并成一个新的字典
/// @param dict1 字典1
/// @param dict2 字典2
+ (NSDictionary *)cl_createDictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2;

/// 合并字典
/// @param dict 字典
- (NSDictionary *)cl_dictionaryByMergingWith:(NSDictionary *)dict;

@end
