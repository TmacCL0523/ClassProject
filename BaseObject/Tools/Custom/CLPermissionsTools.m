/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     CLPermissionsTools.m
 * 创建时间:    2020+12+29
 *
 *********************************************************************************
 */

#import "CLPermissionsTools.h"
#import <Photos/Photos.h>
#import <Contacts/Contacts.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>
#import <EventKit/EventKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
    #import <UserNotifications/UserNotifications.h>
#endif

@implementation CLPermissionsTools

/**
 * Function: 定位权限是否开启
 */
+ (BOOL)cl_permissionsLocation {
    if( [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted ||
        [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied ) {
        return NO;
    }
#if __IPHONE_8_0
#else
    if( [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized )
        return YES;
#endif
    return NO;
}

/**
 * Function: 通讯录访问权限是否开启
 */
+ (BOOL)cl_permissionsAddressBook {
    BOOL hasAccess = NO;
#if __IPHONE_9_0
    if( [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts] == CNAuthorizationStatusAuthorized ) {
        hasAccess = YES;
    }
#else
    switch( ABAddressBookGetAuthorizationStatus() ) {
        case kABAuthorizationStatusNotDetermined: hasAccess = NO; break;
        case kABAuthorizationStatusRestricted: hasAccess = NO; break;
        case kABAuthorizationStatusDenied: hasAccess = NO; break;
        case kABAuthorizationStatusAuthorized: hasAccess = YES; break;
    }
#endif
    return hasAccess;
}

/**
 * Function: 相机权限是否开启
 */
+ (BOOL)cl_permissionsCamera {
    BOOL hasAccess = NO;

    switch( [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent] ) {
        case EKAuthorizationStatusNotDetermined: hasAccess = NO; break;
        case EKAuthorizationStatusRestricted: hasAccess = NO; break;
        case EKAuthorizationStatusDenied: hasAccess = NO; break;
        case EKAuthorizationStatusAuthorized: hasAccess = YES; break;
    }

    return hasAccess;
}

/**
 * Function: 推送功能是否开启
 */
+ (BOOL)cl_permissionsPushService {
    BOOL hasAccess = NO;
    switch( [EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder] ) {
        case EKAuthorizationStatusNotDetermined: hasAccess = NO; break;
        case EKAuthorizationStatusRestricted: hasAccess = NO; break;
        case EKAuthorizationStatusDenied: hasAccess = NO; break;
        case EKAuthorizationStatusAuthorized: hasAccess = YES; break;
    }

    return hasAccess;
}

/**
 * Function: 相册权限是否开启
 */
+ (BOOL)cl_permissionsPhotosLibrary {
    BOOL hasAccess = NO;

#if __IPHONE_8_0
    NSInteger author = [PHPhotoLibrary authorizationStatus];
    if( author == PHAuthorizationStatusAuthorized ) {
        hasAccess = YES;
    }

#else
    NSInteger author = [ALAssetsLibrary authorizationStatus];
    if( author == ALAuthorizationStatusAuthorized ) {
        hasAccess = YES;
    }
#endif
    return hasAccess;
}

/**
 * Function: 麦克风开启
 */
+ (void)cl_permissionsMicrophone:(grantBlock)flag { //检测麦克风功能是否打开
    [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
        flag(granted);
    }];
}

/// 麦克风权限 - 弹窗提示
/// @param block 事件回调
+ (void)cl_showAlertViewForMicrophone:(PermissionsBlock)block {
    AVAudioSession *session = [AVAudioSession sharedInstance];
    if( [session respondsToSelector:@selector(requestRecordPermission:)] ) {
        [session performSelector:@selector(requestRecordPermission:)
                      withObject:^(BOOL granted) {
                          // do something
                          if( block ) {
                              block();
                          }
                      }];
    }
}
/// 相册权限
/// @param block 有权限
/// @param notBlock 没权限
+ (void)cl_showAlertViewForPhotoLibrary:(PermissionsBlock)block withNotPermissionsBlock:(PermissionsBlock)notBlock {
    BOOL auth = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
    if( ! auth )
        return;
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) { //弹出访问权限提示框
        if( status == PHAuthorizationStatusAuthorized ) {                  // 有权限
            dispatch_async(dispatch_get_main_queue(), ^{
                // do something
                //  一般操作
                if( block ) {
                    block();
                }
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                // 无权限
                // do something
                if( notBlock ) {
                    notBlock();
                }
            });
        }
    }];
}

/// 相机权限
/// @param authBlock 有权限
/// @param notAuthBlock 没权限
+ (void)cl_showAlertViewForCamera:(PermissionsBlock)authBlock withNotAuth:(PermissionsBlock)notAuthBlock {
    BOOL auth = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    if( ! auth )
        return;
    NSString *mediaType = AVMediaTypeVideo; //读取媒体类型
    [AVCaptureDevice requestAccessForMediaType:mediaType
                             completionHandler:^(BOOL granted) {
                                 dispatch_async(dispatch_get_main_queue(), ^{
                                     if( granted ) { // 授权成功
                                         // do something
                                         // 一般会做的操作，跳转到系统的相机
                                         if( authBlock ) {
                                             authBlock();
                                         }
                                     } else { // 拒绝授权
                                         // do something
                                         if( notAuthBlock ) {
                                             notAuthBlock();
                                         }
                                     }
                                 });
                             }];
}
/// 推送权限
/// @param authBlock 有权限
/// @param notAuthBlock 没权限
+ (void)cl_showAlertViewForNotificationAuth:(PermissionsBlock)authBlock withNotAuth:(PermissionsBlock)notAuthBlock {
    if( [[UIDevice currentDevice].systemVersion floatValue] >= 10.0 ) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        // 要消除警告的代码
        [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert)
                                                                            completionHandler:^(BOOL granted, NSError *_Nullable error) {
                                                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                                                    // do something
                                                                                    // 对granted 进行判断，是否允许权限

                                                                                    if( granted ) {
                                                                                        if( authBlock ) {
                                                                                            authBlock();
                                                                                        }
                                                                                    } else {
                                                                                        if( notAuthBlock ) {
                                                                                            notAuthBlock();
                                                                                        }
                                                                                    }
                                                                                });
                                                                            }];
#pragma clang diagnostic pop

    } else if( [[UIDevice currentDevice].systemVersion floatValue] >= 8.0 ) {
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
        BOOL auth = [self cl_permissionsPushService];
        // 对auth 进行判断，是否允许权限
        if( auth ) {
            if( authBlock ) {
                authBlock();
            }
        } else {
            if( notAuthBlock ) {
                notAuthBlock();
            }
        }
    }
}
@end
