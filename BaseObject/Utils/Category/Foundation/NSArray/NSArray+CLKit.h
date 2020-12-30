/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSArray+CLKit.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/


#import <Foundation/Foundation.h>

@interface NSArray (CLKit)

/// 安全模式 - 获取索引对象 （如果自身是空的则无）
/// @param index 索引
- (id)safeObjectAtIndex:(NSUInteger)index;

/// 创建反向数组
- (NSArray *)reversedArray;

/// 转换成JSON的NSString
- (NSString *)arrayToJson;

/// 模拟阵列当作一个圆。当它超出范围，重新开始
/// @param index 索引
- (id)objectAtCircleIndex:(NSInteger)index;

/// 反向数组
/// @param array 数组
+ (NSArray *)reversedArray:(NSArray *)array;

/// 将指定的数组转换成JSON的NSString
/// @param array 数组
+ (NSString *)arrayToJson:(NSArray *)array;

@end
