/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSMutableArray+CLKit.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import <Foundation/Foundation.h>

@interface NSMutableArray (CLKit)

/// 安全模式 - 取索引对象    （如果自身是空的则无）
/// @param index 索引
- (id)safeObjectAtIndex:(NSUInteger)index;

/// 移动对象从一个索引到另一个索引
/// @param from 源索引
/// @param to 目标索引
- (void)moveObjectFromIndex:(NSUInteger)from toIndex:(NSUInteger)to;

/// 创建反向数组
- (NSMutableArray *)reversedArray;

/// 获取给定的键值和排序的数组
/// @param key 键值
/// @param array 指定的集合
/// @param ascending YES为升序，NO为降序
+ (NSMutableArray *)sortArrayByKey:(NSString *)key array:(NSMutableArray *)array ascending:(BOOL)ascending;

/// 将字符串中的文字和表情解析出来
/// @param string 带表情的字符串
+ (NSMutableArray *)cl_ArrayFormatterEmojString:(NSString *)string;

@end
