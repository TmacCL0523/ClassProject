/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     CLKitConst.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#ifndef CLKitConst_h
#define CLKitConst_h
#import <Foundation/Foundation.h>

/**
 *  yyyy-MM-dd
 */
static NSString *const FormatString_YMD = @"yyyy-MM-dd";

/**
 *  yyyy-MM-dd HH:mm
 */
static NSString *const FormatString_YMDHM = @"yyyy-MM-dd HH:mm";

/**
 *  yyyy-MM-dd HH:mm:ss
 */
static NSString *const FormatString_YMDHMS = @"yyyy-MM-dd HH:mm:ss";

/**
 *  yyyy-MM-dd, EEE, HH:mm:ss
 */
static NSString *const FormatString_YMDEHMS = @"yyyy-MM-dd, EEE, HH:mm:ss";

/**
 *  yyyy-MM
 */
static NSString *const FormatString_YM = @"yyyy-MM";

/**
 *  MM-dd HH:mm
 */
static NSString *const FormatString_MDHM = @"MM-dd HH:mm";

/**
 *  yyyy/MM/dd
 */
static NSString *const FormatString_YMD2 = @"yyyy/MM/dd";

/**
 *  yyyy/MM/dd HH:mm
 */
static NSString *const FormatString_YMDHM2 = @"yyyy/MM/dd HH:mm";

/**
 *  yyyy/MM/dd HH:mm:ss
 */
static NSString *const FormatString_YMDHMS2 = @"yyyy/MM/dd HH:mm:ss";

/**
 *  yyyy/MM/dd, EEE, HH:mm:ss
 */
static NSString *const FormatString_YMDEHMS2 = @"yyyy/MM/dd, EEE, HH:mm:ss";

/**
 *  yyyy/MM
 */
static NSString *const FormatString_YM2 = @"yyyy/MM";

/**
 *  yyyy年MM月dd日
 */
static NSString *const FormatString_YMD3 = @"yyyy年MM月dd日";

/**
 *  yyyy
 */
static NSString *const FormatString_Y = @"yyyy";

/**
 *  MM
 */
static NSString *const FormatString_M = @"MM";

/**
 *  dd
 */
static NSString *const FormatString_D = @"dd";

/**
 *  HH:mm
 */
static NSString *const FormatString_HM = @"HH:mm";

/**
 *  HH:mm:ss
 */
static NSString *const FormatString_HMS = @"HH:mm:ss";

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

#endif /* CLKitConst_h */
