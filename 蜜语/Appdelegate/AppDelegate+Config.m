

#import "AppDelegate+Config.h"
#import "LoginViewController.h"
#import "MYTabbarViewController.h"
#import <IQKeyboardManager.h>

@implementation AppDelegate (Config)

- (void)rootViewController {
    self.window                    = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor    = [UIColor whiteColor];
    MYTabbarViewController *vc     = [[MYTabbarViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
}

- (void)setKeyBordSetting {
    IQKeyboardManager *manager                  = [IQKeyboardManager sharedManager];
    manager.enable                              = YES;
    manager.shouldResignOnTouchOutside          = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar                   = YES;
}

/// 程序取消激活状态
/// @param application app
- (void)applicationWillResignActive:(UIApplication *)application {
    CLLogString(@"程序取消激活状态");
}

/// 程序进入后台
/// @param application app
- (void)applicationDidEnterBackground:(UIApplication *)application {
    CLLogString(@"程序进入后台");
    [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^() {
    }];
}

/// 程序进入前台
/// @param application app
- (void)applicationWillEnterForeground:(UIApplication *)application {
    CLLogString(@"程序进入前台")
}

/// 程序被激活
/// @param application app
- (void)applicationDidBecomeActive:(UIApplication *)application {
    CLLogString(@"程序被激活");
}

/// 终止程序
/// @param application app
- (void)applicationWillTerminate:(UIApplication *)application {
    CLLogString(@"终止程序");
}

@end
