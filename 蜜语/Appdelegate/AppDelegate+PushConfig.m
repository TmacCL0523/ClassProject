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
#import <PushKit/PushKit.h>

@interface
    AppDelegate () <JPUSHRegisterDelegate, PKPushRegistryDelegate>

@end

@implementation AppDelegate (PushConfig)

- (void)registerJPusherWithOptions:(NSDictionary *)launchOptions {
    [JPUSHService setLogOFF];
    [JPUSHService setupWithOption:launchOptions appKey:JPushAPPSDKKey channel:@"" apsForProduction:YES];
}

/// 注册APNS推送通知
- (void)registerNotification {
    // Required
    // notice: 3.0.0 及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity *entity = [[JPUSHRegisterEntity alloc] init];
    // 要消除警告的代码
    entity.types = JPAuthorizationOptionAlert | JPAuthorizationOptionBadge | JPAuthorizationOptionSound | JPAuthorizationOptionProvidesAppNotificationSettings;

    if( [[UIDevice currentDevice].systemVersion floatValue] >= 8.0 ) {
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
}

/// 注册voip
- (void)voipRegistration {
    dispatch_queue_t mainQueue    = dispatch_get_main_queue();
    PKPushRegistry * voipRegistry = [[PKPushRegistry alloc] initWithQueue:mainQueue];
    voipRegistry.delegate         = self;
    // Set the push type to VoIP
    voipRegistry.desiredPushTypes = [NSSet setWithObject:PKPushTypeVoIP];
}

/// 注册DeviceToken
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}

/// 注册失败
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    // Optional
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}
#pragma mark - JPUSHRegisterDelegate

// 消除方法弃用(过时)的警告
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
// 要消除警告的代码
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification API_AVAILABLE(ios(10.0)) {
    if( notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]] ) {
        //从通知界面直接进入应用
    } else {
        //从通知设置界面进入应用
    }
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center
        willPresentNotification:(UNNotification *)notification
          withCompletionHandler:(void (^)(NSInteger))completionHandler API_AVAILABLE(ios(10.0)) {
    // Required
    NSDictionary *userInfo = notification.request.content.userInfo;
    if( [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]] ) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center
    didReceiveNotificationResponse:(UNNotificationResponse *)response
             withCompletionHandler:(void (^)(void))completionHandler API_AVAILABLE(ios(10.0)) {
    // Required
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    if( [response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]] ) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(); // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // Required, For systems with less than or equal to iOS 6
    [JPUSHService handleRemoteNotification:userInfo];
}

/// 系统返回VoipToken,上报给极光服务器
- (void)pushRegistry:(PKPushRegistry *)registry didUpdatePushCredentials:(PKPushCredentials *)pushCredentials forType:(PKPushType)type {
    [JPUSHService registerVoipToken:pushCredentials.token];
}

- (void)pushRegistry:(PKPushRegistry *)registry didReceiveIncomingPushWithPayload:(PKPushPayload *)payload forType:(PKPushType)type {
    // 提交回执给极光服务器
    [JPUSHService handleVoipNotification:payload.dictionaryPayload];
}

- (void)pushRegistry:(PKPushRegistry *)registry didReceiveIncomingPushWithPayload:(PKPushPayload *)payload forType:(PKPushType)type withCompletionHandler:(void (^)(void))completion {
    // 提交回执给极光服务器
    [JPUSHService handleVoipNotification:payload.dictionaryPayload];
}
#pragma clang diagnostic pop

@end
