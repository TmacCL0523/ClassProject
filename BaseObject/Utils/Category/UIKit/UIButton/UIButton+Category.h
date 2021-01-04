/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIButton+Category.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

@interface UIButton (Category)

/// 创建 - 文本、图片button
/// @param title 文本
/// @param color 文字颜色
/// @param font 文字字体
/// @param nonalImage 正常图片
/// @param selectImage 点击后的图片
+ (instancetype)cl_createWithTitle:(NSString *)title titleColor:(UIColor *)color titleFont:(UIFont *)font nonalImage:(UIImage *)nonalImage selectImage:(UIImage *)selectImage;

/// 创建 - 文本button
/// @param title 文本
/// @param color 文本颜色
/// @param font 文本字体
+ (instancetype)cl_createWithTitle:(NSString *)title titleColor:(UIColor *)color titleFont:(UIFont *)font;

/// 创建 - 图片button
/// @param nonalImage 默认图片
/// @param selectImage 选中图片
+ (instancetype)clcreateWithNonalImage:(UIImage *)nonalImage selectImage:(UIImage *)selectImage;

/// 设置背景颜色
/// @param backgroundColor 背景颜色
/// @param state 状态
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

/// 多久之后开始执行
/// @param timeout 多少秒
/// @param waitBlock 倒计时
/// @param finishBlock 倒计时结束时回调
- (void)clKitStartTime:(NSInteger)timeout waitBlock:(void (^)(NSInteger remainTime))waitBlock finishBlock:(void (^)(void))finishBlock;

@end
