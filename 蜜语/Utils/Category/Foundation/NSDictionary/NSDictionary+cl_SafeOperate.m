/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSDictionary+cl_SafeOperate.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "NSDictionary+cl_SafeOperate.h"

@implementation NSDictionary (cl_SafeOperate)
/// 取值
/// @param key 关键字
- (BOOL)cl_hasKey:(NSString *)key {
    return [self objectForKey:key] != nil;
}

/// 取值类型 - NSString
/// @param key 关键字
- (NSString *)cl_stringForKey:(id)key {
    id value = [self objectForKey:key];
    if( value == nil || value == [NSNull null] ) {
        return nil;
    }
    if( [value isKindOfClass:[NSString class]] ) {
        return (NSString *) value;
    }
    if( [value isKindOfClass:[NSNumber class]] ) {
        return [value stringValue];
    }

    return nil;
}

/// 取值类型 - NSNumber
/// @param key 关键字
- (NSNumber *)cl_numberForKey:(id)key {
    id value = [self objectForKey:key];
    if( [value isKindOfClass:[NSNumber class]] ) {
        return (NSNumber *) value;
    }
    if( [value isKindOfClass:[NSString class]] ) {
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString *) value];
    }
    return nil;
}

/// 取值类型 - NSDecimalNumber
/// @param key 关键字
- (NSDecimalNumber *)cl_decimalNumberForKey:(id)key {
    id value = [self objectForKey:key];

    if( [value isKindOfClass:[NSDecimalNumber class]] ) {
        return value;
    } else if( [value isKindOfClass:[NSNumber class]] ) {
        NSNumber *number = (NSNumber *) value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    } else if( [value isKindOfClass:[NSString class]] ) {
        NSString *str = (NSString *) value;
        return [str isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:str];
    }
    return nil;
}

/// 取值类型 - NSArray
/// @param key 关键字
- (NSArray *)cl_arrayForKey:(id)key {
    id value = [self objectForKey:key];
    if( value == nil || value == [NSNull null] ) {
        return nil;
    }
    if( [value isKindOfClass:[NSArray class]] ) {
        return value;
    }
    return nil;
}

/// 取值类型 - NSDictionary
/// @param key 关键字
- (NSDictionary *)cl_dictionaryForKey:(id)key {
    id value = [self objectForKey:key];
    if( value == nil || value == [NSNull null] ) {
        return nil;
    }
    if( [value isKindOfClass:[NSDictionary class]] ) {
        return value;
    }
    return nil;
}

/// 取值类型 - NSInteger
/// @param key 关键字
- (NSInteger)cl_integerForKey:(id)key {
    id value = [self objectForKey:key];
    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]] ) {
        return [value integerValue];
    }
    return 0;
}

/// 取值类型 - NSUInteger
/// @param key 关键字
- (NSUInteger)cl_unsignedIntegerForKey:(id)key {
    id value = [self objectForKey:key];
    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]] ) {
        return [value unsignedIntegerValue];
    }
    return 0;
}

/// 取值类型 - BOOL
/// @param key 关键字
- (BOOL)cl_boolForKey:(id)key {
    id value = [self objectForKey:key];

    if( value == nil || value == [NSNull null] ) {
        return NO;
    }
    if( [value isKindOfClass:[NSNumber class]] ) {
        return [value boolValue];
    }
    if( [value isKindOfClass:[NSString class]] ) {
        return [value boolValue];
    }
    return NO;
}

/// 取值类型 - int16_t
/// @param key 关键字
- (int16_t)cl_int16ForKey:(id)key {
    id value = [self objectForKey:key];

    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSNumber class]] ) {
        return [value shortValue];
    }
    if( [value isKindOfClass:[NSString class]] ) {
        return [value intValue];
    }
    return 0;
}

/// 取值类型 - int32_t
/// @param key 关键字
- (int32_t)cl_int32ForKey:(id)key {
    id value = [self objectForKey:key];

    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]] ) {
        return [value intValue];
    }
    return 0;
}

/// 取值类型 - int64_t
/// @param key 关键字
- (int64_t)cl_int64ForKey:(id)key {
    id value = [self objectForKey:key];

    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]] ) {
        return [value longLongValue];
    }
    return 0;
}

/// 取值类型 - char
/// @param key 关键字
- (char)cl_charForKey:(id)key {
    id value = [self objectForKey:key];

    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]] ) {
        return [value charValue];
    }
    return 0;
}

/// 取值类型 - short
/// @param key 关键字
- (short)cl_shortForKey:(id)key {
    id value = [self objectForKey:key];

    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSNumber class]] ) {
        return [value shortValue];
    }
    if( [value isKindOfClass:[NSString class]] ) {
        return [value intValue];
    }
    return 0;
}

/// 取值类型 - float
/// @param key 关键字
- (float)cl_floatForKey:(id)key {
    id value = [self objectForKey:key];

    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]] ) {
        return [value floatValue];
    }
    return 0;
}

/// 取值类型 - double
/// @param key 关键字
- (double)cl_doubleForKey:(id)key {
    id value = [self objectForKey:key];

    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]] ) {
        return [value doubleValue];
    }
    return 0;
}

/// 取值类型 - long long
/// @param key 关键字
- (long long)cl_longLongForKey:(id)key {
    id value = [self objectForKey:key];
    if( [value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]] ) {
        return [value longLongValue];
    }
    return 0;
}

/// 取值类型 - unsigned long long
/// @param key 关键字
- (unsigned long long)cl_unsignedLongLongForKey:(id)key {
    id value = [self objectForKey:key];
    if( [value isKindOfClass:[NSString class]] ) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        value                 = [nf numberFromString:value];
    }
    if( [value isKindOfClass:[NSNumber class]] ) {
        return [value unsignedLongLongValue];
    }
    return 0;
}

/// 取值类型 - NSDate
/// @param key 关键字
/// @param dateFormat dateFormat
- (NSDate *)cl_dateForKey:(id)key dateFormat:(NSString *)dateFormat {
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    formater.dateFormat       = dateFormat;
    id value                  = [self objectForKey:key];

    if( value == nil || value == [NSNull null] ) {
        return nil;
    }

    if( [value isKindOfClass:[NSString class]] && ! [value isEqualToString:@""] && ! dateFormat ) {
        return [formater dateFromString:value];
    }
    return nil;
}

/// 取值类型 - CGFloat
/// @param key 关键字
- (CGFloat)cl_CGFloatForKey:(id)key {
    CGFloat f = [self[key] doubleValue];
    return f;
}

/// 取值类型 - CGPoint
/// @param key 关键字
- (CGPoint)cl_pointForKey:(id)key {
    CGPoint point = CGPointFromString(self[key]);
    return point;
}

/// 取值类型 - CGSize
/// @param key 关键字
- (CGSize)cl_sizeForKey:(id)key {
    CGSize size = CGSizeFromString(self[key]);
    return size;
}

/// 取值类型 - CGRect
/// @param key 关键字
- (CGRect)cl_rectForKey:(id)key {
    CGRect rect = CGRectFromString(self[key]);
    return rect;
}
@end

@implementation NSMutableDictionary (cl_SafeOperate)

/// 写入类型 - ID
/// @param object 元素
/// @param key 关键字
- (void)cl_setObj:(id)object forKey:(NSString *)key {
    if( object != nil ) {
        self[key] = object;
    }
}

/// 写入类型 - NSString
/// @param object 元素
/// @param key 关键字
- (void)cl_setString:(NSString *)object forKey:(NSString *)key {
    [self setValue:object forKey:key];
}

/// 写入类型 - BOOL
/// @param object 元素
/// @param key 关键字
- (void)cl_setBool:(BOOL)object forKey:(NSString *)key {
    self[key] = @(object);
}

/// 写入类型 - int
/// @param object 元素
/// @param key 关键字
- (void)cl_setInt:(int)object forKey:(NSString *)key {
    self[key] = @(object);
}

/// 写入类型 - NSInteger
/// @param object 元素
/// @param key 关键字
- (void)cl_setInteger:(NSInteger)object forKey:(NSString *)key {
    self[key] = @(object);
}

/// 写入类型 - NSUInteger
/// @param object 元素
/// @param key 关键字
- (void)cl_setUnsignedInteger:(NSUInteger)object forKey:(NSString *)key {
    self[key] = @(object);
}

/// 写入类型 - CGFloat
/// @param object 元素
/// @param key 关键字
- (void)cl_setCGFloat:(CGFloat)object forKey:(NSString *)key {
    self[key] = @(object);
}

/// 写入类型 - char
/// @param object 元素
/// @param key 关键字
- (void)cl_setChar:(char)object forKey:(NSString *)key {
    self[key] = @(object);
}

/// 写入类型 - float
/// @param object 元素
/// @param key 关键字
- (void)cl_setFloat:(float)object forKey:(NSString *)key {
    self[key] = @(object);
}

/// 写入类型 - double
/// @param object 元素
/// @param key 关键字
- (void)cl_setDouble:(double)object forKey:(NSString *)key {
    self[key] = @(object);
}

/// 写入类型 - long long
/// @param object 元素
/// @param key 关键字
- (void)cl_setLongLong:(long long)object forKey:(NSString *)key {
    self[key] = @(object);
}

/// 写入类型 - CGPoint
/// @param object 元素
/// @param key 关键字
- (void)cl_setPoint:(CGPoint)object forKey:(NSString *)key {
    self[key] = NSStringFromCGPoint(object);
}

/// 写入类型 - CGSize
/// @param object 元素
/// @param key 关键字
- (void)cl_setSize:(CGSize)object forKey:(NSString *)key {
    self[key] = NSStringFromCGSize(object);
}

/// 写入类型 - CGRect
/// @param object 元素
/// @param key 关键字
- (void)cl_setRect:(CGRect)object forKey:(NSString *)key {
    self[key] = NSStringFromCGRect(object);
}

@end
