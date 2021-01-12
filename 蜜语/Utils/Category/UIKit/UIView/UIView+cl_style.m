/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIView+cl_style.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "UIView+cl_style.h"

@implementation UIView (cl_style)

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

/// 创建阴影
/// @param offset 阴影偏移量
/// @param opacity 透明度
/// @param radius 模糊程度
- (void)cl_setRectShadowWithOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius {
    // 设置阴影的颜色
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    // 设置阴影的透明度
    self.layer.shadowOpacity = opacity;
    // 设置阴影的偏移量
    self.layer.shadowOffset = offset;
    // 设置阴影的模糊程度
    self.layer.shadowRadius = radius;
    // 设置边界是否遮盖
    self.layer.masksToBounds = NO;
}

/// 创建圆角半径阴影
/// @param cornerRadius 圆角半径
/// @param offset 偏移量
/// @param opacity 透明度
/// @param radius 模糊程度
- (void)cl_setCornerRadiusShadowWithCornerRadius:(CGFloat)cornerRadius offset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius {
    // 设置阴影的颜色
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    // 设置阴影的透明度
    self.layer.shadowOpacity = opacity;
    // 设置阴影的偏移量
    self.layer.shadowOffset = offset;
    // 设置阴影的模糊程度
    self.layer.shadowRadius = radius;
    // 设置是否栅格化
    self.layer.shouldRasterize = YES;
    // 设置圆角半径
    self.layer.cornerRadius = cornerRadius;
    // 设置阴影的路径
    self.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:[self bounds] cornerRadius:cornerRadius] CGPath];
    // 设置边界是否遮盖
    self.layer.masksToBounds = NO;
}

/// 圆角View
/// @param corners 上下左右
/// @param radius 角度
- (void)cl_setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius {
    CGRect rect = self.bounds;

    // Create the path
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];

    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame         = rect;
    maskLayer.path          = maskPath.CGPath;

    // Set the newly created shape layer as the mask for the view's layer
    self.layer.mask = maskLayer;
}

/**
 * Function: 摇摆动画
 */
- (void)cl_shakeAnimation {
    // 创建关键帧动画类
    CAKeyframeAnimation *shake = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    // 设置每个关键帧的值对象的数组
    shake.values = @[ [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-5.0f, 0.0f, 0.0f)], [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(5.0f, 0.0f, 0.0f)] ];
    // 设置是否自动翻转
    shake.autoreverses = YES;
    // 设置重复次数
    shake.repeatCount = 2.0f;
    // 设置间隔时间
    shake.duration = 0.07f;
    // 添加动画
    [self.layer addAnimation:shake forKey:@"Shake"];
}

@end
