//
//  CLKitLog.h
//  BaseObject
//
//  Created by QiYue on 2020/12/29.
//

#ifndef CLKitLog_h
#define CLKitLog_h

#ifdef DEBUG

    #define Log(FORMAT, ...)                                                                                                                                                           \
        fprintf(stderr, "🙏BUG🙏\t[⌚️：%s] [文件: %s\t 方法: %s\t Line: %d] \t打印开始 LOG👉\t%s\t 👈\n", __TIME__,                                               \
                [[NSString stringWithFormat:@"%@", NSStringFromClass([self class])] UTF8String], [[NSString stringWithFormat:@"%@", NSStringFromSelector(_cmd)] UTF8String], __LINE__, \
                [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else
    #define Log(fmt, ...)
#endif

#define LogBounds(view)     Log(@"%s bounds: %@", #view, NSStringFromCGRect([view bounds]))
#define LogFrame(view)      Log(@"%s frame: %@", #view, NSStringFromCGRect([view frame]))
#define LogRect(rect)       Log(@"%s : %@", #rect, NSStringFromCGRect(rect))
#define LogSize(size)       Log(@"%s : %@", #size, NSStringFromCGSize(size))
#define LogPoint(point)     Log(@"%s : %@", #point, NSStringFromCGPoint(point))
#define LogString(str)      Log(@"%s : %@", #str, str)
#define LogObj(obj)         Log(@"%s : %@", #obj, obj)
#define LogInteger(integer) Log(@"%s : %ld", #integer, (long) integer)
#define LogFloat(float)     Log(@"%s : %f", #float, float)
#define LogBool(Bool)       Log(@"%s : %@", #Bool, (Bool ? @"YES" : @"NO"))
#endif

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
#define CLKit_SCREEN_WIDTH                                                                                                                                                                            \
((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) \
     ? [[UIScreen mainScreen] bounds].size.width                                                                                                                                                      \
     : [[UIScreen mainScreen] bounds].size.height)
#define CLKit_SCREEN_HEIGHT                                                                                                                                                                           \
((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) \
     ? [[UIScreen mainScreen] bounds].size.height                                                                                                                                                     \
     : [[UIScreen mainScreen] bounds].size.width)

#pragma mark ===================weakSelf===================
#define CLKit_WeakSelf   @CLKit_Weakify(self);
#define CLKit_StrongSelf @CLKit_Strongify(self);

/*！
 * 强弱引用转换，用于解决代码块（block）与强引用self之间的循环引用问题
 * 调用方式: `@CLKit_Weakify`实现弱引用转换，`@CLKit_Strongify`实现强引用转换
 *
 * 示例：
 * @CLKit_Weakify
 * [obj block:^{
 * @strongify_self
 * self.property = something;
 * }];
 */
#ifndef CLKit_Weakify
#if DEBUG
    #if __has_feature(objc_arc)
        #define CLKit_Weakify(object) \
            autoreleasepool { }       \
            __weak __typeof__(object) weak##_##object = object;
    #else
        #define CLKit_Weakify(object) \
            autoreleasepool { }       \
            __block __typeof__(object) block##_##object = object;
    #endif
#else
    #if __has_feature(objc_arc)
        #define CLKit_Weakify(object) \
            try {                     \
            } @finally {              \
            }                         \
            { }                       \
            __weak __typeof__(object) weak##_##object = object;
    #else
        #define CLKit_Weakify(object) \
            try {                     \
            } @finally {              \
            }                         \
            { }                       \
            __block __typeof__(object) block##_##object = object;
    #endif
#endif
#endif

/*！
 * 强弱引用转换，用于解决代码块（block）与强引用对象之间的循环引用问题
 * 调用方式: `@CLKit_Weakify(object)`实现弱引用转换，`@CLKit_Strongify(object)`实现强引用转换
 *
 * 示例：
 * @CLKit_Weakify(object)
 * [obj block:^{
 * @CLKit_Strongify(object)
 * strong_object = something;
 * }];
 */
#ifndef CLKit_Strongify
#if DEBUG
    #if __has_feature(objc_arc)
        #define CLKit_Strongify(object) \
            autoreleasepool { }         \
            __typeof__(object) object = weak##_##object;
    #else
        #define CLKit_Strongify(object) \
            autoreleasepool { }         \
            __typeof__(object) object = block##_##object;
    #endif
#else
    #if __has_feature(objc_arc)
        #define CLKit_Strongify(object) \
            try {                       \
            } @finally {                \
            }                           \
            __typeof__(object) object = weak##_##object;
    #else
        #define CLKit_Strongify(object) \
            try {                       \
            } @finally {                \
            }                           \
            __typeof__(object) object = block##_##object;
    #endif
#endif
#endif

#pragma mark ===================缩写方法===================
#define CLKit_ImageName(imageName) [UIImage imageNamed:imageName]

#pragma mark - NotiCenter other
#define CLKit_NotiCenter [NSNotificationCenter defaultCenter]

#define CLKit_NSUserDefaults [NSUserDefaults standardUserDefaults]

/*! 获取sharedApplication */
#define CLKit_SharedApplication [UIApplication sharedApplication]

/*! 用safari打开URL */
#define CLKit_OpenUrl(urlStr) [CLKit_SharedApplication openURL:[NSURL URLWithString:urlStr]]

/*! 复制文字内容 */
#define CLKit_CopyContent(content) [[UIPasteboard generalPasteboard] setString:content]

// TODO: 判读是否为空
#define CLKit_ISEmptyString(str)  ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO)
#define CLKit_ISEmptyArray(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0 || [array isEqual:[NSNull null]])
#define CLKit_ISEmptyDict(dic)    (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0 || [dic isEqual:[NSNull null]])
#define CLKit_ISEmptyObject(_object)                                                                                                                 \
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

#endif /* CLKitLog_h */
