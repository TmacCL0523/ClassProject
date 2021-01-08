/**
 *********************************************************************************
 *
 * 用户名:     QiYue
 * 文件名:     CLShareTools.m
 * 工程名:     BaseObject
 * 父类:       NSObject
 * 创建时间:    2021/1/8
 *
 *********************************************************************************
 **/

#import "CLShareTools.h"


#define UMSDK @"5ff7d739f1eb4f3f9b562a41"

@interface
    CLShareTools ()

@end

@implementation CLShareTools
#pragma mark ===================    Public   ===================

CLKit_SingletonM(shareTools);

#pragma mark ===================    Methods   ===================
/// 三方登录
/// @param type 类型
/// @param resultBlock 成功回调
/// @param errorBlock 失败回调
- (void)cl_loginByType:(CLShareType)type result:(LoginByThreePattyBlock)resultBlock error:(LoginByThreePattyError)errorBlock {
    UMSocialPlatformType umType = UMSocialPlatformType_QQ;
    if( type == CLShareTypeWeChat ) {
        umType = UMSocialPlatformType_WechatSession;
    }

    [[UMSocialManager defaultManager] getUserInfoWithPlatform:umType
                                        currentViewController:nil
                                                   completion:^(id result, NSError *error) {
                                                       if( error ) {
                                                           if( errorBlock ) {
                                                               errorBlock(error);
                                                           }
                                                       } else {
                                                           UMSocialUserInfoResponse *resp = result;
                                                           // 授权信息
                                                           NSLog(@"QQ uid: %@", resp.uid);
                                                           NSLog(@"QQ openid: %@", resp.openid);
                                                           NSLog(@"QQ unionid: %@", resp.unionId);
                                                           NSLog(@"QQ accessToken: %@", resp.accessToken);
                                                           NSLog(@"QQ expiration: %@", resp.expiration);
                                                           // 用户信息
                                                           NSLog(@"QQ name: %@", resp.name);
                                                           NSLog(@"QQ iconurl: %@", resp.iconurl);
                                                           NSLog(@"QQ gender: %@", resp.unionGender);
                                                           // 第三方平台SDK源数据
                                                           NSLog(@"QQ originalResponse: %@", resp.originalResponse);

                                                           if( resultBlock ) {
                                                               resultBlock(resp);
                                                           }
                                                       }
                                                   }];
}

/// 三方分享
/// @param data 分享内容 - CLShareData对象
/// @param shareType 分享类型 - 微信、QQ
/// @param vc 控制器
/// @param resultBlock 成功回调
/// @param errorBlock 失败回调
- (void)cl_shareData:(CLShareData *)data type:(CLShareType)shareType currentViewController:(UIViewController *)vc result:(ShareResultBlock)resultBlock error:(shareErrorBlock)errorBlock {
    UMSocialPlatformType umType = UMSocialPlatformType_QQ;
    if( shareType == CLShareTypeWeChat ) {
        umType = UMSocialPlatformType_WechatSession;
    }
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:umType
                                        messageObject:[self getShareObjectWithData:data]
                                currentViewController:vc
                                           completion:^(id data, NSError *error) {
                                               if( error ) {
                                                   NSLog(@"************Share fail with error %@*********", error);
                                                   if( errorBlock ) {
                                                       errorBlock(error);
                                                   }
                                               } else {
                                                   if( [data isKindOfClass:[UMSocialShareResponse class]] ) {
                                                       UMSocialShareResponse *resp = data;
                                                       //分享结果消息
                                                       NSLog(@"response message is %@", resp.message);
                                                       if( resultBlock ) {
                                                           resultBlock(resp);
                                                       }

                                                   } else {
                                                       NSLog(@"response data is %@", data);
                                                       if( resultBlock ) {
                                                           resultBlock(data);
                                                       }
                                                   }
                                               }
                                           }];
}

- (UMSocialMessageObject *)getShareObjectWithData:(CLShareData *)data {
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];

    switch( data.dataType ) {
        case CLShareDataTypeUrl: {
            [self shareUrl:messageObject shareData:data];
        } break;

        case CLShareDataTypeText: {
            [self shareText:messageObject shareData:data];
        } break;

        case CLShareDataTypeImage: {
            [self shareImage:messageObject shareData:data];
        } break;

        case CLShareDataTypeTextAndImage: {
            [self shareTextImage:messageObject shareData:data];
        } break;

        case CLShareDataTypeApplets: {
            [self shareApplets:messageObject shareData:data];
        } break;

        case CLShareDataTypeVideo: {
            [self shareVideo:messageObject shareData:data];
        } break;

        case CLShareDataTypeMusic: {
            [self shareMusic:messageObject shareData:data];
        } break;

        default: break;
    }

    return messageObject;
}

/// 分享网页
/// @param message 分享对象
/// @param data 分享对象参数
- (void)shareUrl:(UMSocialMessageObject *)message shareData:(CLShareData *)data {
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:data.title descr:data.content thumImage:data.thumImage];
    //设置网页地址
    shareObject.webpageUrl = data.url;

    //分享消息对象设置分享内容对象
    message.shareObject = shareObject;
}

/// 分享文本
/// @param message 分享对象
/// @param data 分享对象参数
- (void)shareText:(UMSocialMessageObject *)message shareData:(CLShareData *)data {
    message.text = data.text;
}

/// 分享图片
/// @param message 分享对象
/// @param data 分享对象参数
- (void)shareImage:(UMSocialMessageObject *)message shareData:(CLShareData *)data {
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    shareObject.thumbImage = [UIImage imageNamed:data.thumImage];
    [shareObject setShareImage:data.shareImage];

    //分享消息对象设置分享内容对象
    message.shareObject = shareObject;
}

/// 分享图文
/// @param message 分享对象
/// @param data 分享对象参数
- (void)shareTextImage:(UMSocialMessageObject *)message shareData:(CLShareData *)data {
    message.text = data.text;
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    shareObject.thumbImage = [UIImage imageNamed:data.thumImage];
    [shareObject setShareImage:data.shareImage];
    //分享消息对象设置分享内容对象
    message.shareObject = shareObject;
}

/// 分享小程序
/// @param message 分享对象
/// @param data 分享对象参数
- (void)shareApplets:(UMSocialMessageObject *)message shareData:(CLShareData *)data {
    UMShareMiniProgramObject *shareObject = [UMShareMiniProgramObject shareObjectWithTitle:data.title descr:data.content thumImage:data.thumImage];
    shareObject.webpageUrl                = data.url;
    shareObject.userName                  = data.userName;
    shareObject.path                      = data.path;
    shareObject.hdImageData               = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logo" ofType:@"png"]];
    shareObject.miniProgramType           = UShareWXMiniProgramTypeRelease; // 可选体验版和开发板
    message.shareObject                   = shareObject;
}

/// 分享视频
/// @param message 分享对象
/// @param data 分享对象参数
- (void)shareVideo:(UMSocialMessageObject *)message shareData:(CLShareData *)data {
    //创建视频内容对象
    UMShareVideoObject *shareObject = [UMShareVideoObject shareObjectWithTitle:data.title descr:data.content thumImage:data.thumImage];
    //设置视频网页播放地址
    shareObject.videoUrl = data.url;

    //分享消息对象设置分享内容对象
    message.shareObject = shareObject;
}

/// 分享音乐
/// @param message 分享对象
/// @param data 分享对象参数
- (void)shareMusic:(UMSocialMessageObject *)message shareData:(CLShareData *)data {
    //创建音乐内容对象
    UMShareMusicObject *shareObject = [UMShareMusicObject shareObjectWithTitle:data.title descr:data.content thumImage:data.thumImage];
    //设置音乐网页播放地址
    shareObject.musicUrl = data.url;
    //分享消息对象设置分享内容对象
    message.shareObject = shareObject;
}

@end
