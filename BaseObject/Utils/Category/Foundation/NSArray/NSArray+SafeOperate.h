/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSArray+SafeOperate.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import <Foundation/Foundation.h>

@interface NSArray (SafeOperate)

/// 获取元素
/// @param index 下标
- (id)cl_objectWithIndex:(NSUInteger)index;

/// 获取字符串
/// @param index 下标
- (NSString *)cl_stringWithIndex:(NSUInteger)index;

/// 获取number元素
/// @param index 下标
- (NSNumber *)cl_numberWithIndex:(NSUInteger)index;

/// 获取计算元素
/// @param index 下标
- (NSDecimalNumber *)cl_decimalNumberWithIndex:(NSUInteger)index;

/// 获取数组
/// @param index 下标
- (NSArray *)cl_arrayWithIndex:(NSUInteger)index;

/// 获取字典类型
/// @param index 下标
- (NSDictionary *)cl_dictionaryWithIndex:(NSUInteger)index;

/// 获取integer类型
/// @param index 下标
- (NSInteger)cl_integerWithIndex:(NSUInteger)index;

/// 获取类型 - unsignedInteger
/// @param index 下标
- (NSUInteger)cl_unsignedIntegerWithIndex:(NSUInteger)index;

/// 获取类型 - BOOL
/// @param index 下标
- (BOOL)cl_boolWithIndex:(NSUInteger)index;

/// 获取类型 - int16
/// @param index 下标
- (int16_t)cl_int16WithIndex:(NSUInteger)index;

/// 获取类型 - int32
/// @param index 下标
- (int32_t)cl_int32WithIndex:(NSUInteger)index;

/// 获取类型 - int64
/// @param index 下标
- (int64_t)cl_int64WithIndex:(NSUInteger)index;

/// 获取类型 - char
/// @param index 下标
- (char)cl_charWithIndex:(NSUInteger)index;

/// 获取类型 - short
/// @param index 下标
- (short)cl_shortWithIndex:(NSUInteger)index;

/// 获取类型 - float
/// @param index 下标
- (float)cl_floatWithIndex:(NSUInteger)index;

/// 获取类型 - double
/// @param index 下标
- (double)cl_doubleWithIndex:(NSUInteger)index;

/// 获取类型 - date
/// @param index 下标
/// @param dateFormat dateFormat
- (NSDate *)cl_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat;

/// 获取类型 - CGFloat
/// @param index 下标
- (CGFloat)cl_CGFloatWithIndex:(NSUInteger)index;

/// 获取类型 - CGPoint
/// @param index 下标
- (CGPoint)cl_pointWithIndex:(NSUInteger)index;

/// 获取类型 - CGSize
/// @param index 下标
- (CGSize)cl_sizeWithIndex:(NSUInteger)index;

/// 获取类型 - CGRect
/// @param index 下标
- (CGRect)cl_rectWithIndex:(NSUInteger)index;

@end

@interface NSMutableArray (SafeOperate)

/// 添加类型 - ID
/// @param object 元素
- (void)cl_addObj:(id)object;

/// 添加类型 - NSString
/// @param object 元素
- (void)cl_addString:(NSString *)object;

/// 添加类型 - BOOL
/// @param object 元素
- (void)cl_addBool:(BOOL)object;

/// 添加类型 - int
/// @param object 元素
- (void)cl_addInt:(int)object;

/// 添加类型 - NSInteger
/// @param object 元素
- (void)cl_addInteger:(NSInteger)object;

/// 添加类型 - NSUInteger
/// @param object 元素
- (void)cl_addUnsignedInteger:(NSUInteger)object;

/// 添加类型 - CGFloat
/// @param object 元素
- (void)cl_addCGFloat:(CGFloat)object;

/// 添加类型 - char
/// @param object 元素
- (void)cl_addChar:(char)object;

/// 添加类型 - float
/// @param object 元素
- (void)cl_addFloat:(float)object;

/// 添加类型 - CGPoint
/// @param object 元素
- (void)cl_addPoint:(CGPoint)object;

/// 添加类型 - CGSize
/// @param object 元素
- (void)cl_addSize:(CGSize)object;

/// 添加类型 - CGRect
/// @param object 元素
- (void)cl_addRect:(CGRect)object;

@end
