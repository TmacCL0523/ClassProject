/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     CLKitSingleton.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#ifndef CLKitSingleton_h
#define CLKitSingleton_h

// TODO: .h 方法
#define CLKit_SingletonH(className)                               \
+(instancetype) shared##className;

// 2. 解决.m文件
// 判断 是否是 ARC
#if __has_feature(objc_arc)
    #define CLKit_SingletonM(className)                           \
        static id instance;                                       \
        +(instancetype) allocWithZone : (struct _NSZone *) zone { \
            static dispatch_once_t onceToken;                     \
            dispatch_once(&onceToken, ^{                          \
                instance = [super allocWithZone:zone];            \
            });                                                   \
            return instance;                                      \
        }                                                         \
        +(instancetype) shared##className {                       \
            static dispatch_once_t onceToken;                     \
            dispatch_once(&onceToken, ^{                          \
                instance = [[self alloc] init];                   \
            });                                                   \
            return instance;                                      \
        }                                                         \
        -(id) copyWithZone : (NSZone *) zone {                    \
            return instance;                                      \
        }
#else
    // MRC 部分
    #define CLKit_SingletonM(className)                 \
        static id instance;                                       \
        +(instancetype) allocWithZone : (struct _NSZone *) zone { \
            static dispatch_once_t onceToken;                     \
            dispatch_once(&onceToken, ^{                          \
                instance = [super allocWithZone:zone];            \
            });                                                   \
            return instance;                                      \
        }                                                         \
        +(instancetype) shared##className {                       \
            static dispatch_once_t onceToken;                     \
            dispatch_once(&onceToken, ^{                          \
                instance = [[self alloc] init];                   \
            });                                                   \
            return instance;                                      \
        }                                                         \
        -(id) copyWithZone : (NSZone *) zone {                    \
            return instance;                                      \
        }                                                         \
        -(oneway void) release {} - (instancetype) retain {       \
            return instance;                                      \
        }                                                         \
        -(instancetype) autorelease {                             \
            return instance;                                      \
        }                                                         \
        -(NSUInteger) retainCount {                               \
            return ULONG_MAX;                                     \
        }
#endif // 提示，最后一行不要使用

#endif /* CLKitSingleton_h */
