/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIView+Screenshot.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

@interface UIView (Screenshot)

/**
 * Function: 截图
 */
- (UIImage *)cl_screenshot;

/// 截图一个view中所有视图 包括旋转缩放效果
/// @param maxWidth 限制缩放的最大宽度 保持默认传0
- (UIImage *)cl_screenshot:(CGFloat)maxWidth;
@end
