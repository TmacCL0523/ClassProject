/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     AppDelegate+PushConfig.m
 * 创建时间:    2020-12-29
 * 作用:       推送
 *********************************************************************************
 */

#import "AppDelegate+PushConfig.h"
#import "JPUSHService.h"
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
    #import <UserNotifications/UserNotifications.h>
#endif

@interface
    AppDelegate () <JPUSHRegisterDelegate>

@end

@implementation AppDelegate (PushConfig)

-(void)registerJPusherWithOptions:(NSDictionary *)launchOptions{
    [JPUSHService setLogOFF];
    [JPUSHService setupWithOption:launchOptions appKey:JPushAPPSDKKey
                          channel:@""
                 apsForProduction:YES];
}


- (void)registerNotification {
    // Required
    // notice: 3.0.0 及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity *entity = [[JPUSHRegisterEntity alloc] init];
    if( @available(iOS 12.0, *) ) {
        entity.types = JPAuthorizationOptionAlert | JPAuthorizationOptionBadge | JPAuthorizationOptionSound | JPAuthorizationOptionProvidesAppNotificationSettings;
    } else {
        entity.types = JPAuthorizationOptionAlert | JPAuthorizationOptionBadge | JPAuthorizationOptionSound;
    }
    if( [[UIDevice currentDevice].systemVersion floatValue] >= 8.0 ) {
        // 可以添加自定义 categories
        // NSSet<UNNotificationCategory *> *categories for iOS10 or later
        // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    [JPUSHService requestNotificationAuthorization:^(JPAuthorizationStatus status) {
        CLLogInteger(status);
    }];

}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    CLLogString(deviceToken.cl_APNSToken);
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    // Optional
    CLLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

#pragma mark - JPUSHRegisterDelegate

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification {
    if( notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]] ) {
        //从通知界面直接进入应用
    } else {
        //从通知设置界面进入应用
    }
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSDictionary *userInfo = notification.request.content.userInfo;
    CLLogObj(userInfo);
    if( [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]] ) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    CLLogObj(userInfo);
    if( [response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]] ) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(); // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // Required, iOS 7 Support
    CLLogObj(userInfo);
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    CLLogObj(userInfo);
    // Required, For systems with less than or equal to iOS 6
    [JPUSHService handleRemoteNotification:userInfo];
}

@end
