/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIView+style.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "UIView+style.h"

@implementation UIView (style)

/// 创建边框
/// @param color 颜色
/// @param radius 角度
/// @param width 宽度
- (void)cl_setBordersWithColor:(UIColor *)color andCornerRadius:(CGFloat)radius andWidth:(CGFloat)width {
    // 设置边框宽度
    self.layer.borderWidth = width;
    // 设置圆角半径
    self.layer.cornerRadius = radius;
    // 设置是否栅格化
    self.layer.shouldRasterize = NO;
    // 设置栅格化规模
    self.layer.rasterizationScale = 2;
    // 设置边缘抗锯齿遮盖
    self.layer.edgeAntialiasingMask = kCALayerLeftEdge | kCALayerRightEdge | kCALayerBottomEdge | kCALayerTopEdge;
    // 设置边界剪切
    self.clipsToBounds = YES;
    // 设置边界是否遮盖
    self.layer.masksToBounds = YES;

    // 创建颜色空间
    CGColorSpaceRef space   = CGColorSpaceCreateDeviceRGB();
    CGColorRef      cgColor = [color CGColor];
    self.layer.borderColor  = cgColor;
    CGColorSpaceRelease(space);
}

/**
 * Function: 删除边框
 */
- (void)cl_removeBorders {
    self.layer.borderWidth  = 0;
    self.layer.cornerRadius = 0;
    self.layer.borderColor  = nil;
}
@end
