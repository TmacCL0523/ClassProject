/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIView+cl_Action.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (cl_Action)

/// 点击事件
/// @param actionBlock 回调
- (void)cl_addAcitonWith:(GestureActionBlock)actionBlock;

/// 长按事件
/// @param actionBlock 回调
- (void)cl_addLongActionWith:(GestureActionBlock)actionBlock;

@end
