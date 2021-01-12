/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     CLKitUtilsMacroFiles.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#ifndef CLKitUtilsMacroFiles_h
#define CLKitUtilsMacroFiles_h

#pragma mark =================== Log ===================

#ifdef DEBUG
    #define CLLog(FORMAT, ...)                                                                                                                                                                       \
        fprintf(stderr,                                                                                                                                                                              \
                "\n------- 🈶 BUG🈚️ 🆚 DEBUG🈲 🈶 -------\n编译时间:\t%s\n文件名:\t%s\n方法名:\t%s\n行号:\t%d\n打印信息:\t%s\n------- 🈚️ 狗子到底了 🈚️ " \
                "-------\n",                                                                                                                                                                         \
                __TIME__, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], [[[NSString stringWithUTF8String:__func__] lastPathComponent] UTF8String], __LINE__,            \
                [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else
    #define CLLog(fmt, ...)
#endif

#define CLLogBounds(view)     CLLog(@"%s bounds: %@", #view, NSStringFromCGRect([view bounds]))
#define CLLogFrame(view)      CLLog(@"%s frame: %@", #view, NSStringFromCGRect([view frame]))
#define CLLogRect(rect)       CLLog(@"%s : %@", #rect, NSStringFromCGRect(rect))
#define CLLogSize(size)       CLLog(@"%s : %@", #size, NSStringFromCGSize(size))
#define CLLogPoint(point)     CLLog(@"%s : %@", #point, NSStringFromCGPoint(point))
#define CLLogString(str)      CLLog(@"%s : %@", #str, str)
#define CLLogObj(obj)         CLLog(@"%s : %@", #obj, obj)
#define CLLogInteger(integer) CLLog(@"%s : %ld", #integer, (long) integer)
#define CLLogFloat(float)     CLLog(@"%s : %f", #float, float)
#define CLLogBool(Bool)       CLLog(@"%s : %@", #Bool, (Bool ? @"YES" : @"NO"))

#pragma mark =================== 系统判断 ===================
#define CLKit_IOS_VERSION [UIDevice currentDevice].systemVersion
#define CLKit_isiOS10     ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
/**
 *  系统版本号对比
 *  @param v Version, like @"8.0"
 */
// 系统版本等于
#define CLKit_SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
// 系统版本大于
#define CLKit_SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
// 系统版本大于等于
#define CLKit_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
// 系统版本小于
#define CLKit_SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
// 系统版本小于等于
#define CLKit_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

/*! 判断当前的iPhone设备 */
// 判断是否为iPhone
#define CLKit_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

// 判断是否为iPad
//#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define CLKit_IS_IPAD ([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])

//判断是否为ipod
#define CLKit_IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

// 判断是否为 iPhone 5S / SE
#define CLKit_iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f

// 判断是否为iPhone 6/6s
#define CLKit_iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f

// 判断是否为iPhone 6Plus/6sPlus
#define CLKit_iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f
//最大屏幕尺寸
#define CLKit_ScreenMaxLength (MAX(CLKit_SCREEN_WIDTH, CLKit_SCREEN_HEIGHT))
//最小屏幕尺寸
#define CLKit_ScreenMinLength (MIN(CLKit_SCREEN_WIDTH, CLKit_SCREEN_HEIGHT))
//是否iPhone X
#define CLKit_IS_iPhoneX (CLKit_IS_IPHONE && CLKit_ScreenMaxLength == 812.0)
//是否iPhone XR
#define CLKit_IS_iPhoneXr (CLKit_IS_IPHONE && CLKit_ScreenMaxLength == 896.0)

#define CLKit_IS_iPhoneXX (CLKit_IS_IPHONE && CLKit_ScreenMaxLength > 811.0)

//屏幕尺寸
#define CLKit_ScreenSize [UIScreen mainScreen].bounds.size

//字体适配
#define CLKit_ScaleFont(fontSize) [UIFont systemFontOfSize:fontSize * [UIScreen mainScreen].bounds.size.width / 375]
//状态栏高度
#define CLKit_StatusBarHeightX (CLKit_IS_iPhoneXX ? 44 : 20)
//标签栏高度
#define CLKit_TabBarHeight (CLKit_StatusBarHeightX > 20 ? 83 : 49)
//导航栏高度
#define CLKit_NavBarHeight (CLKit_StatusBarHeightX + 44)
//安全区高度
#define CLKit_SafeAreaBottom (CLKit_IS_iPhoneXX ? 34 : 0)
// 底部安全距离
#define CLKit_SafeAreaBottomHeight (CLKit_IS_iPhoneXX ? 34.f : 0.f)
// 状态栏高度 + 顶部导航栏高度
#define CLKit_SafeAreaTopHeight UIApplication.sharedApplication.statusBarFrame.size.height + 44

// TODO: 获取屏幕宽度和高度
#define CLKit_SCREEN_WIDTH                                                                                  \
    ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) ||         \
      ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) \
         ? [[UIScreen mainScreen] bounds].size.width                                                        \
         : [[UIScreen mainScreen] bounds].size.height)
#define CLKit_SCREEN_HEIGHT                                                                                 \
    ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) ||         \
      ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) \
         ? [[UIScreen mainScreen] bounds].size.height                                                       \
         : [[UIScreen mainScreen] bounds].size.width)

#pragma mark ===================weakSelf===================

#define CLKit_WeakSelf(type)   __weak typeof(type) weak##type = type;
#define CLKit_StrongSelf(type) __strong typeof(type) type = weak##type;

#pragma mark ===================缩写方法===================

/*! 用safari打开URL */
#define CLKit_OpenUrl(urlStr) [CLKit_SharedApplication openURL:[NSURL URLWithString:urlStr]]

/*! 复制文字内容 */
#define CLKit_CopyContent(content) [[UIPasteboard generalPasteboard] setString:content]

// TODO: 判读是否为空
#define CLKit_ISEmptyString(str)  ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO)
#define CLKit_ISEmptyArray(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0 || [array isEqual:[NSNull null]])
#define CLKit_ISEmptyDict(dic)    (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0 || [dic isEqual:[NSNull null]])
#define CLKit_ISEmptyObject(_object)                                                                                                                     \
    (_object == nil || [_object isKindOfClass:[NSNull class]] || ([_object respondsToSelector:@selector(length)] && [(NSData *) _object length] == 0) || \
     ([_object respondsToSelector:@selector(count)] && [(NSArray *) _object count] == 0))

// APP对象 （单例对象）
#define CLKit_SharedApplication [UIApplication sharedApplication]
// APP对象
#define CLKit_SharedAppDelegate (AppDelegate *) [[UIApplication sharedApplication] delegate]
// 主窗口 （keyWindow）
#define CLKit_SharedKeyWindow [UIApplication sharedApplication].keyWindow
// NSUserDefaults实例化
#define CLKit_UserDefaults [NSUserDefaults standardUserDefaults]
// 通知中心 （单例对象）
#define CLKit_NotificationCenter [NSNotificationCenter defaultCenter]
//获取temp
#define CLKit_PathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define CLKit_PathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define CLKit_PathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

#pragma mark ================颜色=================
/// 随机颜色
#define CLKit_RandomColor           [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0]
#define CLKit_RGBColor(r, g, b)     [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:1.0]
#define CLKit_RGBAColor(r, g, b, a) [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:a]
#define CLKit_RGBColor16Value(rgbValue) \
    [UIColor colorWithRed:((float) ((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float) ((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float) (rgbValue & 0xFF)) / 255.0 alpha:1.0]

// clear背景颜色
#define CLKit_ClearColor [UIColor clearColor]

#define CLKit_RadianFrom(degree)  (M_PI * (degree) / 180.0)
#define CLKit_DegreeFrom(radian)  (radian * 180.0) / (M_PI)
#define CLKit_GetImage(imageName) [UIImage imageNamed:imageName]

#pragma mark ===================单例===================

// TODO: .h 方法
#define CLKit_SingletonH(className) +(instancetype) shared##className;

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

#endif /* CLKitUtilsMacroFiles_h */
