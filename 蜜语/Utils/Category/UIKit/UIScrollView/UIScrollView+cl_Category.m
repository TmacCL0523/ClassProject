/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIScrollView+Category.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "UIScrollView+cl_Category.h"

@implementation UIScrollView (cl_Category)

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
                                      delegate:(id<UIScrollViewDelegate>)delegate {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    [scrollView setDelegate:delegate];
    [scrollView setPagingEnabled:pagingEnabled];
    [scrollView setClipsToBounds:clipsToBounds];
    [scrollView setShowsVerticalScrollIndicator:isVertical];
    [scrollView setShowsHorizontalScrollIndicator:isHorizontal];
    [scrollView setContentSize:contentSize];

    return scrollView;
}

/// 滚动到顶部
- (void)cl_scrollToTop {
    [self cl_scrollToTopAnimated:YES];
}

/// 滚动到底部
- (void)cl_scrollToBottom {
    [self cl_scrollToBottomAnimated:YES];
}

/// 滚动到左边
- (void)cl_scrollToLeft {
    [self cl_scrollToLeftAnimated:YES];
}

/// 滚动到右边
- (void)cl_scrollToRight {
    [self cl_scrollToRightAnimated:YES];
}

/// 滚动到顶部 - 动画
/// @param animated 是否开启动画
- (void)cl_scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y       = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

/// 滚动到底部 - 动画
/// @param animated 是否开启动画
- (void)cl_scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y       = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

/// 滚动到左边 - 动画
/// @param animated 是否开启动画
- (void)cl_scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x       = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

/// 滚动到右边 - 动画
/// @param animated 是否开启动画
- (void)cl_scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x       = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}

@end
