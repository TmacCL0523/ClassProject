//
//  AppDelegate.m
//  BaseObject
//
//  Created by QiYue on 2020/11/30.
//

#import "AppDelegate.h"
#import "AppDelegate+Config.h"
#import "AppDelegate+PushConfig.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];

    [self registerJPusherWithOptions:launchOptions];
    [self registerNotification];
    
    [self setKeyBordSetting];
    [self rootViewController];

    CLLogSize(CLKit_ScreenSize);
    return YES;
}





@end
