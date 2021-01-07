/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     CLPermissionsTools.h
 * 创建时间:    2020+12+29
 *
 *********************************************************************************
 */

#import <Foundation/Foundation.h>

typedef void (^grantBlock)(BOOL granted);

typedef void (^PermissionsBlock)(void);

@interface CLPermissionsTools : NSObject

#pragma mark + Property

#pragma mark + Methods

/**
 * Function: 定位权限是否开启
 */
+ (BOOL)cl_permissionsLocation;

/**
 * Function: 通讯录访问权限是否开启
 */
+ (BOOL)cl_permissionsAddressBook;

/**
 * Function: 相机权限是否开启
 */
+ (BOOL)cl_permissionsCamera;

/**
 * Function: 推送功能是否开启
 */
+ (BOOL)cl_permissionsPushService;

/**
 * Function: 相册权限是否开启
 */
+ (BOOL)cl_permissionsPhotosLibrary;

/**
 * Function: 麦克风开启
 */
+ (void)cl_permissionsMicrophone:(grantBlock)flag;

/// 麦克风权限 - 弹窗提示
/// @param block 事件回调
+ (void)cl_showAlertViewForMicrophone:(PermissionsBlock)block;

/// 相册权限
/// @param block 有权限
/// @param notBlock 没权限
+ (void)cl_showAlertViewForPhotoLibrary:(PermissionsBlock)block withNotPermissionsBlock:(PermissionsBlock)notBlock;

/// 相机权限
/// @param authBlock 有权限
/// @param notAuthBlock 没权限
+ (void)cl_showAlertViewForCamera:(PermissionsBlock)authBlock withNotAuth:(PermissionsBlock)notAuthBlock;

/// 推送权限
/// @param authBlock 有权限
/// @param notAuthBlock 没权限
+ (void)cl_showAlertViewForNotificationAuth:(PermissionsBlock)authBlock withNotAuth:(PermissionsBlock)notAuthBlock;

@end
