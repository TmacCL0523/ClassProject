/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSObject+SystemService.h
 * 创建时间:    2020-12-29
 * 转自: https://github.com/boai
 *********************************************************************************
 */

#import <Foundation/Foundation.h>
#import "CLKitConst.h"

@interface NSObject (SystemService)

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
