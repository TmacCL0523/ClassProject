/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     AppDelegate+PushConfig.h
 * 创建时间:    2020-12-29
 * 作用:       推送分类
 *********************************************************************************
 */

#import "AppDelegate.h"

@interface AppDelegate (PushConfig)

/// 注册APNS
- (void)registerNotification;

/// 注册voip
- (void)voipRegistration;

/// 注册极光推送
- (void)registerJPusherWithOptions:(NSDictionary *)launchOptions;

@end
