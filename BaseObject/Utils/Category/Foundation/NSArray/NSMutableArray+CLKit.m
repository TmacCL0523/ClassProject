/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSMutableArray+CLKit.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import "NSMutableArray+CLKit.h"
#import "NSArray+CLKit.h"

#define PATTERN_STR         @"\\[[^\\[\\]]*\\]"


@implementation NSMutableArray (CLKit)

/// 安全模式 - 取索引对象    （如果自身是空的则无）
/// @param index 索引
- (id)safeObjectAtIndex:(NSUInteger)index {
    if( [self count] > 0 && [self count] > index )
        return [self objectAtIndex:index];
    else
        return nil;
}

/// 移动对象从一个索引到另一个索引
/// @param from 源索引
/// @param to 目标索引
- (void)moveObjectFromIndex:(NSUInteger)from toIndex:(NSUInteger)to {
    if( to != from ) {
        id obj = [self safeObjectAtIndex:from];
        // 删除集合指定的元素
        [self removeObjectAtIndex:from];

        if( to >= [self count] )
            // 向集合添加元素
            [self addObject:obj];
        else
            // 向集合的指定位置插入一个元素
            [self insertObject:obj atIndex:to];
    }
}

/// 创建反向数组
- (NSMutableArray *)reversedArray {
    return (NSMutableArray *) [NSArray reversedArray:self];
}

/// 获取给定的键值和排序的数组
/// @param key 键值
/// @param array 指定的集合
/// @param ascending YES为升序，NO为降序
+ (NSMutableArray *)sortArrayByKey:(NSString *)key array:(NSMutableArray *)array ascending:(BOOL)ascending {
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    // 集合移除全部对象
    [tempArray removeAllObjects];
    // 向集合尾部添加指定集合
    [tempArray addObjectsFromArray:array];
    // 初始化一个指定键值和排序的排序描述器
    NSSortDescriptor *brandDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    NSArray *         sortDescriptors = [NSArray arrayWithObjects:brandDescriptor, nil];
    // 通过排序接收机对象返回一个新的数组
    NSArray *sortedArray = [tempArray sortedArrayUsingDescriptors:sortDescriptors];
    [tempArray removeAllObjects];
    tempArray = (NSMutableArray *) sortedArray;
    [array removeAllObjects];
    [array addObjectsFromArray:tempArray];

    return array;
}

/// 将字符串中的文字和表情解析出来
/// @param string 带表情的字符串
+ (NSMutableArray *)cl_ArrayFormatterEmojString:(NSString *)string {
    NSMutableArray *array = [NSMutableArray array];

    NSRegularExpression *regex       = [[NSRegularExpression alloc] initWithPattern:PATTERN_STR options:NSRegularExpressionCaseInsensitive | NSRegularExpressionDotMatchesLineSeparators error:nil];
    NSArray *            chunks      = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    NSMutableArray *     matchRanges = [NSMutableArray array];

    for( NSTextCheckingResult *result in chunks ) {
        NSString *resultStr = [string substringWithRange:[result range]];

        if( [resultStr hasPrefix:@"["] && [resultStr hasSuffix:@"]"] ) {
            NSString *name = [resultStr substringWithRange:NSMakeRange(1, [resultStr length] - 2)];
            name           = [NSString stringWithFormat:@"[%@]", name];
            NSLog(@"name:%@", name);
            NSDictionary *faceMap = [[NSUserDefaults standardUserDefaults] objectForKey:@"FaceMap"];
            if( [[faceMap allValues] containsObject:name] ) {
                //                [array addObject:name];
                [matchRanges addObject:[NSValue valueWithRange:result.range]];
            }
        }
    }

    NSRange r = NSMakeRange([string length], 0);
    [matchRanges addObject:[NSValue valueWithRange:r]];

    NSUInteger lastLoc = 0;
    for( NSValue *v in matchRanges ) {
        NSRange resultRange = [v rangeValue];
        if( resultRange.location == 0 ) {
            NSString *faceString = [string substringWithRange:resultRange];
            NSLog(@"aaaaaaaaa:faceString:%@", faceString);
            if( faceString.length != 0 ) {
                [array addObject:faceString];
            }

            NSRange   normalStringRange = NSMakeRange(lastLoc, resultRange.location - lastLoc);
            NSString *normalString      = [string substringWithRange:normalStringRange];
            lastLoc                     = resultRange.location + resultRange.length;
            NSLog(@"aaaaaaa:normalString:%@", normalString);
            if( normalString.length != 0 ) {
                [array addObject:normalString];
            }
        } else {
            NSRange   normalStringRange = NSMakeRange(lastLoc, resultRange.location - lastLoc);
            NSString *normalString      = [string substringWithRange:normalStringRange];
            lastLoc                     = resultRange.location + resultRange.length;
            NSLog(@"bbbbbbb:normalString:%@", normalString);
            if( normalString.length != 0 ) {
                [array addObject:normalString];
            }

            NSString *faceString = [string substringWithRange:resultRange];
            NSLog(@"bbbbbbbb:faceString:%@", faceString);
            if( faceString.length != 0 ) {
                [array addObject:faceString];
            }
        }
    }
    if( [matchRanges count] == 0 ) {
        if( string.length != 0 ) {
            [array addObject:string];
        }
    }
    NSLog(@"字符串中的文字和表情解析出来 的 array ：%@", array);

    return array;
}

@end
