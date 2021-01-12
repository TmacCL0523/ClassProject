/**
 *********************************************************************************
 *
 * 用户名:     QiYue
 * 文件名:     CLShareTools.h
 * 工程名:     BaseObject
 * 父类:       NSObject
 * 创建时间:    2021/1/8
 *
 *********************************************************************************
 **/

#import <Foundation/Foundation.h>
#import <UMShare/UMShare.h>

typedef NS_ENUM(NSUInteger, CLShareType) {
    /**
     * Function: 微信
     */
    CLShareTypeWeChat,

    /**
     * Function: QQ
     */
    CLShareTypeQQ,
};

typedef NS_ENUM(NSUInteger, CLShareDataType) {

    /**
     * Function: 网页
     */
    CLShareDataTypeUrl,

    /**
     * Function: 图片
     */
    CLShareDataTypeImage,

    /**
     * Function: 文本
     */
    CLShareDataTypeText,

    /**
     * Function: 文本图片
     */
    CLShareDataTypeTextAndImage,

    /**
     * Function: 小程序
     */
    CLShareDataTypeApplets,

    /**
     * Function: 视频
     */
    CLShareDataTypeVideo,

    /**
     * Function: 音乐
     */
    CLShareDataTypeMusic,
};

typedef void (^LoginByThreePattyBlock)(UMSocialUserInfoResponse *userInfo);
typedef void (^LoginByThreePattyError)(NSError *error);
typedef void (^ShareResultBlock)(id data);
typedef void (^shareErrorBlock)(NSError *error);

@interface CLShareData : NSObject

/// 分享类型
@property (nonatomic, assign) CLShareDataType dataType;

/// 标题
@property (nonatomic, strong) NSString *title;

/// 内容描述
@property (nonatomic, strong) NSString *content;

/// 缩略图片
@property (nonatomic, strong) NSString *thumImage;

/// 分享链接
@property (nonatomic, strong) NSString *url;

/// 分享文本
@property (nonatomic, strong) NSString *text;

/// 分享图片
@property (nonatomic, strong) NSString *shareImage;

/// 小程序username，如 gh_3ac2059ac66f
@property (nonatomic, strong) NSString *userName;

/// 小程序页面路径，如 pages/page10007/page10007
@property (nonatomic, strong) NSString *path;

@end

@interface CLShareTools : NSObject

CLKit_SingletonH(shareTools);

/// 三方登录
/// @param type 类型
/// @param resultBlock 成功回调
/// @param errorBlock 失败回调
- (void)cl_loginByType:(CLShareType)type result:(LoginByThreePattyBlock)resultBlock error:(LoginByThreePattyError)errorBlock;

/// 三方分享
/// @param data 分享内容 - CLShareData对象
/// @param shareType 分享类型 - 微信、QQ
/// @param vc 控制器
/// @param resultBlock 成功回调
/// @param errorBlock 失败回调
- (void)cl_shareData:(CLShareData *)data type:(CLShareType)shareType currentViewController:(UIViewController *)vc result:(ShareResultBlock)resultBlock error:(shareErrorBlock)errorBlock;

@end
