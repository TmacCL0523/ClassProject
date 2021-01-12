/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     CLSoundTools.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

typedef NS_ENUM(UInt32, SystemSoundIdentify) {
    SystemSoundIdentifyNewMail                   = 1000,
    SystemSoundIdentifyMailSent                  = 1001,
    SystemSoundIdentifyVoiceMail                 = 1002,
    SystemSoundIdentifyRecivedMessage            = 1003,
    SystemSoundIdentifySentMessage               = 1004,
    SystemSoundIdentifyAlarm                     = 1005,
    SystemSoundIdentifyLowPower                  = 1006,
    SystemSoundIdentifySMSReceived1              = 1007,
    SystemSoundIdentifySMSReceived2              = 1008,
    SystemSoundIdentifySMSReceived3              = 1009,
    SystemSoundIdentifySMSReceived4              = 1010,
    SystemSoundIdentifySMSReceived5              = 1013,
    SystemSoundIdentifySMSReceived6              = 1014,
    SystemSoundIdentifyTweetSent                 = 1016,
    SystemSoundIdentifyAnticipate                = 1020,
    SystemSoundIdentifyBloom                     = 1021,
    SystemSoundIdentifyCalypso                   = 1022,
    SystemSoundIdentifyChooChoo                  = 1023,
    SystemSoundIdentifyDescent                   = 1024,
    SystemSoundIdentifyFanfare                   = 1025,
    SystemSoundIdentifyLadder                    = 1026,
    SystemSoundIdentifyMinuet                    = 1027,
    SystemSoundIdentifyNewsFlash                 = 1028,
    SystemSoundIdentifyNoir                      = 1029,
    SystemSoundIdentifySherwoodForest            = 1030,
    SystemSoundIdentifySpell                     = 1031,
    SystemSoundIdentifySuspence                  = 1032,
    SystemSoundIdentifyTelegraph                 = 1033,
    SystemSoundIdentifyTiptoes                   = 1034,
    SystemSoundIdentifyTypewriters               = 1035,
    SystemSoundIdentifyUpdate                    = 1036,
    SystemSoundIdentifyUSSDAlert                 = 1050,
    SystemSoundIdentifySIMToolkitCallDropped     = 1051,
    SystemSoundIdentifySIMToolkitGeneralBeep     = 1052,
    SystemSoundIdentifySIMToolkitNegativeACK     = 1053,
    SystemSoundIdentifySIMToolkitPositiveACK     = 1054,
    SystemSoundIdentifySIMToolkitSMS             = 1055,
    SystemSoundIdentifyTink                      = 1057,
    SystemSoundIdentifyCTBusy                    = 1070,
    SystemSoundIdentifyCTCongestion              = 1071,
    SystemSoundIdentifyCTPathACK                 = 1072,
    SystemSoundIdentifyCTError                   = 1073,
    SystemSoundIdentifyCTCallWaiting             = 1074,
    SystemSoundIdentifyCTKeytone                 = 1075,
    SystemSoundIdentifyLock                      = 1100,
    SystemSoundIdentifyUnlock                    = 1101,
    SystemSoundIdentifyFailedUnlock              = 1102,
    SystemSoundIdentifyKeypressedTink            = 1103,
    SystemSoundIdentifyKeypressedTock            = 1104,
    SystemSoundIdentifyTock                      = 1105,
    SystemSoundIdentifyBeepBeep                  = 1106,
    SystemSoundIdentifyRingerCharged             = 1107,
    SystemSoundIdentifyPhotoShutter              = 1108,
    SystemSoundIdentifyShake                     = 1109,
    SystemSoundIdentifyJBLBegin                  = 1110,
    SystemSoundIdentifyJBLConfirm                = 1111,
    SystemSoundIdentifyJBLCancel                 = 1112,
    SystemSoundIdentifyBeginRecording            = 1113,
    SystemSoundIdentifyEndRecording              = 1114,
    SystemSoundIdentifyJBLAmbiguous              = 1115,
    SystemSoundIdentifyJBLNoMatch                = 1116,
    SystemSoundIdentifyBeginVideoRecord          = 1117,
    SystemSoundIdentifyEndVideoRecord            = 1118,
    SystemSoundIdentifyVCInvitationAccepted      = 1150,
    SystemSoundIdentifyVCRinging                 = 1151,
    SystemSoundIdentifyVCEnded                   = 1152,
    SystemSoundIdentifyVCCallWaiting             = 1153,
    SystemSoundIdentifyVCCallUpgrade             = 1154,
    SystemSoundIdentifyTouchTone1                = 1200,
    SystemSoundIdentifyTouchTone2                = 1201,
    SystemSoundIdentifyTouchTone3                = 1202,
    SystemSoundIdentifyTouchTone4                = 1203,
    SystemSoundIdentifyTouchTone5                = 1204,
    SystemSoundIdentifyTouchTone6                = 1205,
    SystemSoundIdentifyTouchTone7                = 1206,
    SystemSoundIdentifyTouchTone8                = 1207,
    SystemSoundIdentifyTouchTone9                = 1208,
    SystemSoundIdentifyTouchTone10               = 1209,
    SystemSoundIdentifyTouchToneStar             = 1210,
    SystemSoundIdentifyTouchTonePound            = 1211,
    SystemSoundIdentifyHeadsetStartCall          = 1254,
    SystemSoundIdentifyHeadsetRedial             = 1255,
    SystemSoundIdentifyHeadsetAnswerCall         = 1256,
    SystemSoundIdentifyHeadsetEndCall            = 1257,
    SystemSoundIdentifyHeadsetCallWaitingActions = 1258,
    SystemSoundIdentifyHeadsetTransitionEnd      = 1259,
    SystemSoundIdentifyVoicemail                 = 1300,
    SystemSoundIdentifyReceivedMessage           = 1301,
    SystemSoundIdentifyNewMail2                  = 1302,
    SystemSoundIdentifyMailSent2                 = 1303,
    SystemSoundIdentifyAlarm2                    = 1304,
    SystemSoundIdentifyLock2                     = 1305,
    SystemSoundIdentifyTock2                     = 1306,
    SystemSoundIdentifySMSReceived1_2            = 1307,
    SystemSoundIdentifySMSReceived2_2            = 1308,
    SystemSoundIdentifySMSReceived3_2            = 1309,
    SystemSoundIdentifySMSReceived4_2            = 1310,
    SystemSoundIdentifySMSReceivedVibrate        = 1311,
    SystemSoundIdentifySMSReceived1_3            = 1312,
    SystemSoundIdentifySMSReceived5_3            = 1313,
    SystemSoundIdentifySMSReceived6_3            = 1314,
    SystemSoundIdentifyVoicemail2                = 1315,
    SystemSoundIdentifyAnticipate2               = 1320,
    SystemSoundIdentifyBloom2                    = 1321,
    SystemSoundIdentifyCalypso2                  = 1322,
    SystemSoundIdentifyChooChoo2                 = 1323,
    SystemSoundIdentifyDescent2                  = 1324,
    SystemSoundIdentifyFanfare2                  = 1325,
    SystemSoundIdentifyLadder2                   = 1326,
    SystemSoundIdentifyMinuet2                   = 1327,
    SystemSoundIdentifyNewsFlash2                = 1328,
    SystemSoundIdentifyNoir2                     = 1329,
    SystemSoundIdentifySherwoodForest2           = 1330,
    SystemSoundIdentifySpell2                    = 1331,
    SystemSoundIdentifySuspence2                 = 1332,
    SystemSoundIdentifyTelegraph2                = 1333,
    SystemSoundIdentifyTiptoes2                  = 1334,
    SystemSoundIdentifyTypewriters2              = 1335,
    SystemSoundIdentifyUpdate2                   = 1336,
    SystemSoundIdentifyRingerVibeChanged         = 1350,
    SystemSoundIdentifySilentVibeChanged         = 1351,
    SystemSoundIdentifyVibrate                   = 4095
};
@interface CLSoundTools : NSObject

/**
 * Function: 播放系统声音 SystemSoundIdentify可选
 */
+ (void)cl_playSystemSound:(SystemSoundIdentify)idetify;

/**
 * Function: 播放系统声音震动
 */
+ (void)cl_playSystemSoundVibration;

/**
 * Function: 播放网页声音
 */
+ (void)cl_playCustomSound:(NSURL *)soundURL;

@end
