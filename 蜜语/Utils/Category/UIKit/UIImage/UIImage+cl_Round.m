/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIImage+cl_Round.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "UIImage+cl_Round.h"

@implementation UIImage (cl_Round)

/// 圆形图片
/// @param imageName 图片名称
+ (UIImage *)cl_roundImageWithName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];

    return [image cl_roundImage];
}

/// 圆形图片 - 修改为圆形图片
- (UIImage *)cl_roundImage {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    // 获取上下文
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    // 设置圆形
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctr, rect);
    // 裁剪
    CGContextClip(ctr);
    // 将图片画上去
    [self drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/// 圆形图片 - 带边框
/// @param imageName 图片名称
/// @param border 边框宽度
/// @param borderColor 边框颜色
+ (UIImage *)cl_roundImageWithName:(NSString *)imageName border:(CGFloat)border borderColor:(UIColor *)borderColor {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image cl_roundImageWithBorder:border borderColor:borderColor];
}

/// 圆形图片 - 对象方法
/// @param border 边框
/// @param borderColor 边框颜色
- (UIImage *)cl_roundImageWithBorder:(CGFloat)border borderColor:(UIColor *)borderColor {
    //    .开启一个和原始图片一样大小的位图上下文.
    CGSize size = CGSizeMake(self.size.width + 2 * border, self.size.height + 2 * border);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    //    2.绘制一个大圆,填充
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [borderColor set];
    [path fill];
    //    3.添加一个裁剪区域.
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, self.size.width, self.size.height)];
    [path addClip];
    //    4.把图片绘制到裁剪区域当中.
    [self drawAtPoint:CGPointMake(border, border)];
    //    5.生成一张新图片.
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    //    6.关闭上下文.
    UIGraphicsEndImageContext();

    return clipImage;
}

/// 圆角图片
/// @param radius 角度
+ (UIImage *)cl_roundImageWithName:(NSString *)imageName cornerRadius:(CGFloat)radius {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image cl_roundImageWithCornerRadius:radius];
}

/// 圆角图片 - 对象发
/// @param radius 角度
- (UIImage *)cl_roundImageWithCornerRadius:(CGFloat)radius {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0.0f, radius);
    CGContextAddLineToPoint(context, 0.0f, self.size.height - radius);
    CGContextAddArc(context, radius, self.size.height - radius, radius, M_PI, M_PI / 2.0f, 1);
    CGContextAddLineToPoint(context, self.size.width - radius, self.size.height);
    CGContextAddArc(context, self.size.width - radius, self.size.height - radius, radius, M_PI / 2.0f, 0.0f, 1);
    CGContextAddLineToPoint(context, self.size.width, radius);
    CGContextAddArc(context, self.size.width - radius, radius, radius, 0.0f, -M_PI / 2.0f, 1);
    CGContextAddLineToPoint(context, radius, 0.0f);
    CGContextAddArc(context, radius, radius, radius, -M_PI / 2.0f, M_PI, 1);
    CGContextClip(context);

    [self drawAtPoint:CGPointZero];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

/// 圆角图片 - UIBezierPath
/// @param imageName 图片名称
/// @param radius 角度
/// @param size 图片大小
+ (UIImage *)cl_roundImageWithName:(NSString *)imageName radius:(CGFloat)radius size:(CGSize)size {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image cl_roundImageRadius:radius size:size];
}

/// 圆角图片 - UIBezierPath
/// @param radius 角度
/// @param size 图片大小
- (UIImage *)cl_roundImageRadius:(CGFloat)radius size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);

    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef  ctx  = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(ctx, path.CGPath);
    CGContextClip(ctx);
    [self drawInRect:rect];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
