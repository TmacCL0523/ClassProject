/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSObject+SystemService.m
 * 创建时间:    2020-12-29
 * 转自: https://github.com/boai
 *********************************************************************************
 */

#import "NSObject+SystemService.h"
#import "NSString+Judge.h"

@implementation NSObject (SystemService)

- (void)cl_makingCallsWithPhoneNumber:(NSString *)phoneNumber {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tel:" stringByAppendingString:phoneNumber]]];
}
/// 跳转评论界面
/// @param identify 在App Store的id
- (void)cl_jumpToCommentViewWithIdentify:(NSString *)identify {
    [[UIApplication sharedApplication]
        openURL:[NSURL URLWithString:[@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=" stringByAppendingString:identify]]];
}
/// 打开浏览器
/// @param url url
- (void)cl_openSafeWithUrl:(NSString *)url {
    if( [url cl_regularIsUrl] ) {
        /*! 跳转系统通知 */
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    } else {
        NSLog(@"url错误，请重新输入！");
    }
}
/// 打开设置界面
/// @param urlStr 设置参数 参考CLKitConst
- (void)cl_openSettingView:(NSString *)urlStr {
    NSURL *url = [NSURL URLWithString:urlStr];
    if( [[UIApplication sharedApplication] canOpenURL:url] ) {
        [[UIApplication sharedApplication] openURL:url];
    }
}
- (UIViewController *)topMostController {
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    //  Getting topMost ViewController
    while( [topController presentedViewController] ) topController = [topController presentedViewController];
    //  Returning topMost ViewController
    return topController;
}

- (UIViewController *)getCurrentViewConttoller {
    UIViewController *currentViewController = [self topMostController];

    while( [currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController *) currentViewController topViewController] )
        currentViewController = [(UINavigationController *) currentViewController topViewController];
    while( currentViewController.presentedViewController ) {
        currentViewController = currentViewController.presentedViewController;
    }
    return currentViewController;
}

- (void)cl_registerNotifications {
#if __IPHONE_8_0

    //注册推送
    if( [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ) {
        // [UIApplication sharedApplication]

        [[UIApplication sharedApplication]
            registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        //远程推送
    }
#else
    //这里还是原来的代码
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
#endif
}

/// 切换RootViewController
/// @param vc 控制器
/// @param complete 回调
- (void)cl_changeRootViewController:(UIViewController *)vc Complete:(void (^)(BOOL success))complete {
    [UIView transitionWithView:[self getWindows]
        duration:0.5f
        options:UIViewAnimationOptionTransitionCrossDissolve
        animations:^{
            BOOL oldState = [UIView areAnimationsEnabled];
            [UIView setAnimationsEnabled:NO];
            [self getWindows].rootViewController = vc;
            [UIView setAnimationsEnabled:oldState];
        }
        completion:^(BOOL finished) {
            if( complete )
                complete(finished);
        }];
}

- (UIWindow *)getWindows {
    UIWindow *window;
    if( @available(iOS 13.0, *) ) {
        window = [UIApplication sharedApplication].windows.firstObject;
    } else {
        window = [UIApplication sharedApplication].keyWindow;
    }
    return window;
}

@end
