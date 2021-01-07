/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSArray+SafeOperate.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import "NSArray+SafeOperate.h"

@implementation NSArray (SafeOperate)

/// 获取元素
/// @param index 下标
- (id)cl_objectWithIndex:(NSUInteger)index {
    if( index < self.count ) {
        return self[index];
    } else {
        return nil;
    }
}

/// 获取字符串
/// @param index 下标
- (NSString *)cl_stringWithIndex:(NSUInteger)index {
    id value = [self cl_objectWithIndex:index];
    if( value == nil || value == [NSNull null] ) {
        return @"";
    }
    if( [value isKindOfClass:[NSString class]] ) {
        return (NSString *) value;
    }
    if( [value isKindOfClass:[NSNumber class]] ) {
        return [value stringValue];
    }

    return nil;
}

/// 获取number元素
/// @param index 下标
- (NSNumber *)cl_numberWithIndex:(NSUInteger)index {
    id value = [self cl_objectWithIndex:index];
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

/// 获取计算元素
/// @param index 下标
- (NSDecimalNumber *)cl_decimalNumberWithIndex:(NSUInteger)index {
    id value = [self cl_objectWithIndex:index];

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

/// 获取数组
/// @param index 下标
- (NSArray *)cl_arrayWithIndex:(NSUInteger)index {
    id value = [self cl_objectWithIndex:index];
    if( value == nil || value == [NSNull null] ) {
        return nil;
    }
    if( [value isKindOfClass:[NSArray class]] ) {
        return value;
    }
    return nil;
}

/// 获取字典类型
/// @param index 下标
- (NSDictionary *)cl_dictionaryWithIndex:(NSUInteger)index {
    id value = [self cl_objectWithIndex:index];
    if( value == nil || value == [NSNull null] ) {
        return nil;
    }
    if( [value isKindOfClass:[NSDictionary class]] ) {
        return value;
    }
    return nil;
}

/// 获取integer类型
/// @param index 下标
- (NSInteger)cl_integerWithIndex:(NSUInteger)index {
    id value = [self cl_objectWithIndex:index];
    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]] ) {
        return [value integerValue];
    }
    return 0;
}

/// 获取类型 - unsignedInteger
/// @param index 下标
- (NSUInteger)cl_unsignedIntegerWithIndex:(NSUInteger)index {
    id value = [self cl_objectWithIndex:index];
    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]] ) {
        return [value unsignedIntegerValue];
    }
    return 0;
}

/// 获取类型 - BOOL
/// @param index 下标
- (BOOL)cl_boolWithIndex:(NSUInteger)index {
    id value = [self cl_objectWithIndex:index];

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

/// 获取类型 - int16
/// @param index 下标
- (int16_t)cl_int16WithIndex:(NSUInteger)index {
    id value = [self cl_objectWithIndex:index];

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

/// 获取类型 - int32
/// @param index 下标
- (int32_t)cl_int32WithIndex:(NSUInteger)index {
    id value = [self cl_objectWithIndex:index];

    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]] ) {
        return [value intValue];
    }
    return 0;
}

/// 获取类型 - int64
/// @param index 下标
- (int64_t)cl_int64WithIndex:(NSUInteger)index {
    id value = [self cl_objectWithIndex:index];

    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]] ) {
        return [value longLongValue];
    }
    return 0;
}

/// 获取类型 - char
/// @param index 下标
- (char)cl_charWithIndex:(NSUInteger)index {
    id value = [self cl_objectWithIndex:index];

    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]] ) {
        return [value charValue];
    }
    return 0;
}

/// 获取类型 - short
/// @param index 下标
- (short)cl_shortWithIndex:(NSUInteger)index {
    id value = [self cl_objectWithIndex:index];

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

/// 获取类型 - float
/// @param index 下标
- (float)cl_floatWithIndex:(NSUInteger)index {
    id value = [self cl_objectWithIndex:index];
    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]] ) {
        return [value floatValue];
    }
    return 0;
}

/// 获取类型 - double
/// @param index 下标
- (double)cl_doubleWithIndex:(NSUInteger)index {
    id value = [self cl_objectWithIndex:index];
    if( value == nil || value == [NSNull null] ) {
        return 0;
    }
    if( [value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]] ) {
        return [value doubleValue];
    }
    return 0;
}

/// 获取类型 - date
/// @param index 下标
/// @param dateFormat dateFormat
- (NSDate *)cl_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat {
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    formater.dateFormat       = dateFormat;
    id value                  = [self cl_objectWithIndex:index];
    if( value == nil || value == [NSNull null] ) {
        return nil;
    }

    if( [value isKindOfClass:[NSString class]] && ! [value isEqualToString:@""] && ! dateFormat ) {
        return [formater dateFromString:value];
    }
    return nil;
}

/// 获取类型 - CGFloat
/// @param index 下标
- (CGFloat)cl_CGFloatWithIndex:(NSUInteger)index {
    id      value = [self cl_objectWithIndex:index];
    CGFloat f     = [value doubleValue];
    return f;
}

/// 获取类型 - CGPoint
/// @param index 下标
- (CGPoint)cl_pointWithIndex:(NSUInteger)index {
    id      value = [self cl_objectWithIndex:index];
    CGPoint point = CGPointFromString(value);
    return point;
}

/// 获取类型 - CGSize
/// @param index 下标
- (CGSize)cl_sizeWithIndex:(NSUInteger)index {
    id     value = [self cl_objectWithIndex:index];
    CGSize size  = CGSizeFromString(value);
    return size;
}

/// 获取类型 - CGRect
/// @param index 下标
- (CGRect)cl_rectWithIndex:(NSUInteger)index {
    id     value = [self cl_objectWithIndex:index];
    CGRect rect  = CGRectFromString(value);
    return rect;
}
@end

@implementation NSMutableArray (SafeOperate)

/// 添加类型 - ID
/// @param object 元素
- (void)cl_addObj:(id)object {
    if( object != nil ) {
        [self addObject:object];
    }
}

/// 添加类型 - NSString
/// @param object 元素
- (void)cl_addString:(NSString *)object {
    if( object != nil ) {
        [self addObject:object];
    }
}

/// 添加类型 - BOOL
/// @param object 元素
- (void)cl_addBool:(BOOL)object {
    [self addObject:@(object)];
}

/// 添加类型 - int
/// @param object 元素
- (void)cl_addInt:(int)object {
    [self addObject:@(object)];
}

/// 添加类型 - NSInteger
/// @param object 元素
- (void)cl_addInteger:(NSInteger)object {
    [self addObject:@(object)];
}

/// 添加类型 - NSUInteger
/// @param object 元素
- (void)cl_addUnsignedInteger:(NSUInteger)object {
    [self addObject:@(object)];
}

/// 添加类型 - CGFloat
/// @param object 元素
- (void)cl_addCGFloat:(CGFloat)object {
    [self addObject:@(object)];
}

/// 添加类型 - char
/// @param object 元素
- (void)cl_addChar:(char)object {
    [self addObject:@(object)];
}

/// 添加类型 - float
/// @param object 元素
- (void)cl_addFloat:(float)object {
    [self addObject:@(object)];
}

/// 添加类型 - CGPoint
/// @param object 元素
- (void)cl_addPoint:(CGPoint)object {
    [self addObject:NSStringFromCGPoint(object)];
}

/// 添加类型 - CGSize
/// @param object 元素
- (void)cl_addSize:(CGSize)object {
    [self addObject:NSStringFromCGSize(object)];
}

/// 添加类型 - CGRect
/// @param object 元素
- (void)cl_addRect:(CGRect)object {
    [self addObject:NSStringFromCGRect(object)];
}

@end
