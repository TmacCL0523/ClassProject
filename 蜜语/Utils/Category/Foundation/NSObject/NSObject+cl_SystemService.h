/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSObject+cl_SystemService.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <Foundation/Foundation.h>

#pragma mark ===================定义文件===================
/**
 * Function: WIFI设置界面
 */
static NSString *const SystemSetting_WIFI = @"App-Prefs:root=WIFI";

/**
 * Function: 关于设置界面
 */
static NSString *const SystemSetting_About = @"App-Prefs:root=General&path=About";

/**
 * Function: 辅助功能界面
 */
static NSString *const SystemSetting_Accessibility = @"App-Prefs:root=General&path=ACCESSIBILITY";

/**
 * Function: 飞行模式界面
 */
static NSString *const SystemSetting_AirplaneModeOn = @"App-Prefs:root=AIRPLANE_MODE";

/**
 * Function: 自动锁屏时间界面
 */
static NSString *const SystemSetting_AutoLock = @"App-Prefs:root=General&path=AUTOLOCK";

/**
 * Function: 自动锁定界面
 */
static NSString *const SystemSetting_Brightness = @"App-Prefs:root=Brightness";

/**
 * Function: 麦克风界面
 */
static NSString *const SystemSetting_MICROPHONE = @"App-Prefs:root=Privacy&path=MICROPHONE";

/**
 * Function: 通讯录界面
 */
static NSString *const SystemSetting_CONTACTS = @"App-Prefs:root=Privacy&path=CONTACTS";

/**
 * Function: 蓝牙界面
 */
static NSString *const SystemSetting_Bluetooth = @"App-Prefs:root=Bluetooth";

/**
 * Function: 日期和时间界面
 */
static NSString *const SystemSetting_Date_And_Time = @"App-Prefs:root=General&path=DATE_AND_TIME";

/**
 * Function: FaceTime界面
 */
static NSString *const SystemSetting_FaceTime = @"App-Prefs:root=FACETIME";

/**
 * Function: General界面
 */
static NSString *const SystemSetting_General = @"App-Prefs:root=General";

/**
 * Function: Keyboard界面
 */
static NSString *const SystemSetting_Keyboard = @"App-Prefs:root=General&path=Keyboard";

/**
 * Function: iCloud界面
 */
static NSString *const SystemSetting_iCloud = @"App-Prefs:root=CASTLE";

#pragma mark ===================正文===================

@interface NSObject (cl_SystemService)

/// 拨打电话
/// @param phoneNumber 电话号码
- (void)cl_makingCallsWithPhoneNumber:(NSString *)phoneNumber;

/// 跳转评论界面
/// @param identify 在App Store的id
- (void)cl_jumpToCommentViewWithIdentify:(NSString *)identify;

/// 打开浏览器
/// @param url url
- (void)cl_openSafeWithUrl:(NSString *)url;

/// 打开设置界面
/// @param urlStr 设置参数 参考CLKitConst
- (void)cl_openSettingView:(NSString *)urlStr;

/**
 * Function: 获取当前控制器
 */
- (UIViewController *)getCurrentViewConttoller;

/**
 * Function: 注册通知
 */
- (void)cl_registerNotifications;

/// 切换RootViewController
/// @param vc 控制器
/// @param complete 回调
- (void)cl_changeRootViewController:(UIViewController *)vc Complete:(void (^)(BOOL success))complete;

@end
