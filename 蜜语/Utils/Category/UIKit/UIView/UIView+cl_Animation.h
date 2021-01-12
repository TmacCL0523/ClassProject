/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIView+Animation.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

@interface UIView (cl_Animation)

/// 移动动画
/// @param destination 坐标
/// @param secs 时间
/// @param option 动画效果
- (void)cl_moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;

/// 移动动画
/// @param destination 坐标
/// @param secs 时间
/// @param option 动画效果
/// @param delegate 代理
/// @param method 方法
- (void)cl_moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option delegate:(id)delegate callback:(SEL)method;

/// 快速移动
/// @param destination 坐标
/// @param withSnapBack 是否复原
- (void)cl_raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack;

/// 快速移动
/// @param destination 坐标
/// @param withSnapBack 是否复原
/// @param delegate 代理
/// @param method 方法
- (void)cl_raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack delegate:(id)delegate callback:(SEL)method;

/// 旋转动画
/// @param degrees 角度
/// @param secs 时间
/// @param delegate 代理
/// @param method 方法
- (void)cl_rotate:(int)degrees secs:(float)secs delegate:(id)delegate callback:(SEL)method;

/// 缩放动画
/// @param secs 时间
/// @param scaleX x比例
/// @param scaleY y比例
/// @param delegate 代理
/// @param method 方法
- (void)cl_scale:(float)secs x:(float)scaleX y:(float)scaleY delegate:(id)delegate callback:(SEL)method;

/// 顺时针旋转
/// @param secs 时间
- (void)cl_spinClockwise:(float)secs;

/// 顺时针旋转
/// @param secs 时间
- (void)cl_spinCounterClockwise:(float)secs;

- (void)cl_curlDown:(float)secs;
- (void)cl_curlUpAndAway:(float)secs;
- (void)cl_drainAway:(float)secs;

/// 改变透明度
/// @param newAlpha 新透明度
/// @param secs 时间
- (void)cl_changeAlpha:(float)newAlpha secs:(float)secs;

/// 脉冲动画
/// @param secs 时间
/// @param continuously 是否连续
- (void)cl_pulse:(float)secs continuously:(BOOL)continuously;

/// 淡入动画
/// @param subview 要添加的view
- (void)cl_addSubviewWithFadeAnimation:(UIView *)subview;

@end
