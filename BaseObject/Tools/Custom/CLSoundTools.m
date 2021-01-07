/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     CLSoundTools.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "CLSoundTools.h"

@implementation CLSoundTools

/**
 * Function: 播放系统声音 SystemSoundIdentify可选
 */
+ (void)cl_playSystemSound:(SystemSoundIdentify)idetify {
    AudioServicesPlaySystemSound(idetify);
}

/**
 * Function: 播放系统声音震动
 */
+ (void)cl_playSystemSoundVibration {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

/**
 * Function: 播放本地声音
 */
+ (void)cl_playCustomSound:(NSURL *)soundURL {
    SystemSoundID soundID = 0;
    OSStatus      err     = AudioServicesCreateSystemSoundID((__bridge CFURLRef) soundURL, &soundID);
    if( err != kAudioServicesNoError ) {
        NSLog(@"Could not load %@", soundURL);
    }
    AudioServicesPlaySystemSound(soundID);
}

@end
