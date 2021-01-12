/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIScrollView+Category.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

@interface UIScrollView (cl_Category)



/// 初始化
/// @param contentSize 内容视图大小
/// @param clipsToBounds 剪切边界
/// @param pagingEnabled 翻页
/// @param isVertical 滚动方向 - 垂直
/// @param isHorizontal 滚动方向 - 横向
/// @param delegate 代理
+ (UIScrollView *)cl_scrollviewWithContentSize:(CGSize)contentSize
                                 clipsToBounds:(BOOL)clipsToBounds
                                 pagingEnabled:(BOOL)pagingEnabled
            showScrollVerticalScrollIndicators:(BOOL)isVertical
          showScrollHorizontalScrollIndicators:(BOOL)isHorizontal
                                      delegate:(id<UIScrollViewDelegate>)delegate;

/// 滚动到顶部
- (void)cl_scrollToTop;

/// 滚动到底部
- (void)cl_scrollToBottom;

/// 滚动到左边
- (void)cl_scrollToLeft;

/// 滚动到右边
- (void)cl_scrollToRight;

/// 滚动到顶部 - 动画
/// @param animated 是否开启动画
- (void)cl_scrollToTopAnimated:(BOOL)animated;

/// 滚动到底部 - 动画
/// @param animated 是否开启动画
- (void)cl_scrollToBottomAnimated:(BOOL)animated;

/// 滚动到左边 - 动画
/// @param animated 是否开启动画
- (void)cl_scrollToLeftAnimated:(BOOL)animated;

/// 滚动到右边 - 动画
/// @param animated 是否开启动画
- (void)cl_scrollToRightAnimated:(BOOL)animated;

@end
