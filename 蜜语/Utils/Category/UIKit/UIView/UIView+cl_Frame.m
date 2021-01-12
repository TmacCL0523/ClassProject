/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIView+cl_Frame.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "UIView+cl_Frame.h"

@implementation UIView (cl_Frame)
- (CGPoint)viewOrigin {
    return self.frame.origin;
}

- (void)setViewOrigin:(CGPoint)viewOrigin {
    CGRect newFrame = self.frame;
    newFrame.origin = viewOrigin;
    self.frame      = newFrame;
}

- (CGSize)viewSize {
    return self.frame.size;
}

- (void)setViewSize:(CGSize)viewSize {
    CGRect newFrame = self.frame;
    newFrame.size   = viewSize;
    self.frame      = newFrame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    CGRect newFrame   = self.frame;
    newFrame.origin.x = x;
    self.frame        = newFrame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    CGRect newFrame   = self.frame;
    newFrame.origin.y = y;
    self.frame        = newFrame;
}

- (CGFloat)width {
    return CGRectGetWidth(self.bounds);
}

- (void)setWidth:(CGFloat)width {
    CGRect newFrame     = self.frame;
    newFrame.size.width = width;
    self.frame          = newFrame;
}

- (CGFloat)height {
    return CGRectGetHeight(self.bounds);
}

- (void)setHeight:(CGFloat)height {
    CGRect newFrame      = self.frame;
    newFrame.size.height = height;
    self.frame           = newFrame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top {
    CGRect newFrame   = self.frame;
    newFrame.origin.y = top;
    self.frame        = newFrame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect newFrame   = self.frame;
    newFrame.origin.y = bottom - self.frame.size.height;
    self.frame        = newFrame;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left {
    CGRect newFrame   = self.frame;
    newFrame.origin.x = left;
    self.frame        = newFrame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect newFrame   = self.frame;
    newFrame.origin.x = right - self.frame.size.width;
    self.frame        = newFrame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint newCenter = self.center;
    newCenter.x       = centerX;
    self.center       = newCenter;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint newCenter = self.center;
    newCenter.y       = centerY;
    self.center       = newCenter;
}

/// 添加数组View
/// @param views 数组view
- (void)cl_AddSubViews:(NSArray<UIView *> *)views {
    [views enumerateObjectsUsingBlock:^(UIView *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        [self addSubview:obj];
    }];
}
@end
