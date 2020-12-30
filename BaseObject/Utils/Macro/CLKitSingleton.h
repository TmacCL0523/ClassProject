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
#define CLKit_SingletonH(methodName) +(instancetype) shared##methodName;

// .m文件的实现
// 是ARC
#if __has_feature(objc_arc)
    #define CLKit_SingletonM(methodName)                      \
        static id _instace = nil;                             \
        +(id) allocWithZone : (struct _NSZone *) zone {       \
            if( _instace == nil ) {                           \
                static dispatch_once_t onceToken;             \
                dispatch_once(&onceToken, ^{                  \
                    _instace = [super allocWithZone:zone];    \
                });                                           \
            }                                                 \
            return _instace;                                  \
        }                                                     \
                                                              \
        -(id) init {                                          \
            static dispatch_once_t onceToken;                 \
            dispatch_once(&onceToken, ^{                      \
                _instace = [super init];                      \
            });                                               \
            return _instace;                                  \
        }                                                     \
                                                              \
        +(instancetype) shared##methodName {                  \
            return [[self alloc] init];                       \
        }                                                     \
        +(id) copyWithZone : (struct _NSZone *) zone {        \
            return _instace;                                  \
        }                                                     \
                                                              \
        +(id) mutableCopyWithZone : (struct _NSZone *) zone { \
            return _instace;                                  \
        }

#else
    // 不是ARC
    #define CLKit_SingletonM(methodName)                      \
        static id _instace = nil;                             \
        +(id) allocWithZone : (struct _NSZone *) zone {       \
            if( _instace == nil ) {                           \
                static dispatch_once_t onceToken;             \
                dispatch_once(&onceToken, ^{                  \
                    _instace = [super allocWithZone:zone];    \
                });                                           \
            }                                                 \
            return _instace;                                  \
        }                                                     \
                                                              \
        -(id) init {                                          \
            static dispatch_once_t onceToken;                 \
            dispatch_once(&onceToken, ^{                      \
                _instace = [super init];                      \
            });                                               \
            return _instace;                                  \
        }                                                     \
                                                              \
        +(instancetype) shared##methodName {                  \
            return [[self alloc] init];                       \
        }                                                     \
                                                              \
        -(oneway void) release {                              \
                                                              \
        }                                                     \
                                                              \
            - (id) retain {                                   \
            return self;                                      \
        }                                                     \
                                                              \
        -(NSUInteger) retainCount {                           \
            return 1;                                         \
        }                                                     \
        +(id) copyWithZone : (struct _NSZone *) zone {        \
            return _instace;                                  \
        }                                                     \
                                                              \
        +(id) mutableCopyWithZone : (struct _NSZone *) zone { \
            return _instace;                                  \
        }

#endif

#endif /* CLKitSingleton_h */
