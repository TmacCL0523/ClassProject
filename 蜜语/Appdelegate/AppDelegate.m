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
    [self rootViewController];


    return YES;
}





@end
