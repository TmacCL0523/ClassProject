/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSDictionary+SafeOperate.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (SafeOperate)

/// 取值
/// @param key 关键字
- (BOOL)cl_hasKey:(NSString *)key;

/// 取值类型 - NSString
/// @param key 关键字
- (NSString *)cl_stringForKey:(id)key;

/// 取值类型 - NSNumber
/// @param key 关键字
- (NSNumber *)cl_numberForKey:(id)key;

/// 取值类型 - NSDecimalNumber
/// @param key 关键字
- (NSDecimalNumber *)cl_decimalNumberForKey:(id)key;

/// 取值类型 - NSArray
/// @param key 关键字
- (NSArray *)cl_arrayForKey:(id)key;

/// 取值类型 - NSDictionary
/// @param key 关键字
- (NSDictionary *)cl_dictionaryForKey:(id)key;

/// 取值类型 - NSInteger
/// @param key 关键字
- (NSInteger)cl_integerForKey:(id)key;

/// 取值类型 - NSUInteger
/// @param key 关键字
- (NSUInteger)cl_unsignedIntegerForKey:(id)key;

/// 取值类型 - BOOL
/// @param key 关键字
- (BOOL)cl_boolForKey:(id)key;

/// 取值类型 - int16_t
/// @param key 关键字
- (int16_t)cl_int16ForKey:(id)key;

/// 取值类型 - int32_t
/// @param key 关键字
- (int32_t)cl_int32ForKey:(id)key;

/// 取值类型 - int64_t
/// @param key 关键字
- (int64_t)cl_int64ForKey:(id)key;

/// 取值类型 - char
/// @param key 关键字
- (char)cl_charForKey:(id)key;

/// 取值类型 - short
/// @param key 关键字
- (short)cl_shortForKey:(id)key;

/// 取值类型 - float
/// @param key 关键字
- (float)cl_floatForKey:(id)key;

/// 取值类型 - double
/// @param key 关键字
- (double)cl_doubleForKey:(id)key;

/// 取值类型 - long long
/// @param key 关键字
- (long long)cl_longLongForKey:(id)key;

/// 取值类型 - unsigned long long
/// @param key 关键字
- (unsigned long long)cl_unsignedLongLongForKey:(id)key;

/// 取值类型 - NSDate
/// @param key 关键字
/// @param dateFormat dateFormat
- (NSDate *)cl_dateForKey:(id)key dateFormat:(NSString *)dateFormat;

/// 取值类型 - CGFloat
/// @param key 关键字
- (CGFloat)cl_CGFloatForKey:(id)key;

/// 取值类型 - CGPoint
/// @param key 关键字
- (CGPoint)cl_pointForKey:(id)key;

/// 取值类型 - CGSize
/// @param key 关键字
- (CGSize)cl_sizeForKey:(id)key;

/// 取值类型 - CGRect
/// @param key 关键字
- (CGRect)cl_rectForKey:(id)key;

@end

@interface NSMutableDictionary (SafeOperate)

/// 写入类型 - ID
/// @param object 元素
/// @param key 关键字
- (void)cl_setObj:(id)object forKey:(NSString *)key;

/// 写入类型 - NSString
/// @param object 元素
/// @param key 关键字
- (void)cl_setString:(NSString *)object forKey:(NSString *)key;

/// 写入类型 - BOOL
/// @param object 元素
/// @param key 关键字
- (void)cl_setBool:(BOOL)object forKey:(NSString *)key;

/// 写入类型 - int
/// @param object 元素
/// @param key 关键字
- (void)cl_setInt:(int)object forKey:(NSString *)key;

/// 写入类型 - NSInteger
/// @param object 元素
/// @param key 关键字
- (void)cl_setInteger:(NSInteger)object forKey:(NSString *)key;

/// 写入类型 - NSUInteger
/// @param object 元素
/// @param key 关键字
- (void)cl_setUnsignedInteger:(NSUInteger)object forKey:(NSString *)key;

/// 写入类型 - CGFloat
/// @param object 元素
/// @param key 关键字
- (void)cl_setCGFloat:(CGFloat)object forKey:(NSString *)key;

/// 写入类型 - char
/// @param object 元素
/// @param key 关键字
- (void)cl_setChar:(char)object forKey:(NSString *)key;

/// 写入类型 - float
/// @param object 元素
/// @param key 关键字
- (void)cl_setFloat:(float)object forKey:(NSString *)key;

/// 写入类型 - double
/// @param object 元素
/// @param key 关键字
- (void)cl_setDouble:(double)object forKey:(NSString *)key;

/// 写入类型 - long long
/// @param object 元素
/// @param key 关键字
- (void)cl_setLongLong:(long long)object forKey:(NSString *)key;

/// 写入类型 - CGPoint
/// @param object 元素
/// @param key 关键字
- (void)cl_setPoint:(CGPoint)object forKey:(NSString *)key;

/// 写入类型 - CGSize
/// @param object 元素
/// @param key 关键字
- (void)cl_setSize:(CGSize)object forKey:(NSString *)key;

/// 写入类型 - CGRect
/// @param object 元素
/// @param key 关键字
- (void)cl_setRect:(CGRect)object forKey:(NSString *)key;

@end
