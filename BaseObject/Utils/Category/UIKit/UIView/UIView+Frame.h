/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIView+Frame.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

@interface UIView (Frame)

/**
 * Function: view - 原点
 */
@property (nonatomic) CGPoint viewOrigin;

/**
 * Function: view - 大小
 */
@property (nonatomic) CGSize viewSize;

/**
 * Function: x 坐标
 */
@property (nonatomic) CGFloat x;

/**
 * Function: y 坐标
 */
@property (nonatomic) CGFloat y;

/**
 * Function: 宽
 */
@property (nonatomic) CGFloat width;

/**
 * Function: 搞
 */
@property (nonatomic) CGFloat height;

/**
 * Function: 顶部
 */
@property (nonatomic) CGFloat top;

/**
 * Function: 底部
 */
@property (nonatomic) CGFloat bottom;

/**
 * Function: 左边距
 */
@property (nonatomic) CGFloat left;

/**
 * Function: 右边距
 */
@property (nonatomic) CGFloat right;

/**
 * Function: x - 中心
 */
@property (nonatomic) CGFloat centerX;

/**
 * Function: y - 中心
 */
@property (nonatomic) CGFloat centerY;

/// 添加数组View
/// @param views 数组view
- (void)cl_AddSubViews:(NSArray<UIView *> *)views;
@end
