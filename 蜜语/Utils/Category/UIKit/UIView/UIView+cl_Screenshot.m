/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIView+cl_Screenshot.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "UIView+cl_Screenshot.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (cl_Screenshot)

/**
 * Function: 截图
 */
- (UIImage *)cl_screenshot {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    if( [self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)] ) {
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    } else {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }

    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
}

/// 截图一个view中所有视图 包括旋转缩放效果
/// @param maxWidth 限制缩放的最大宽度 保持默认传0
- (UIImage *)cl_screenshot:(CGFloat)maxWidth {
    CGAffineTransform oldTransform   = self.transform;
    CGAffineTransform scaleTransform = CGAffineTransformIdentity;

    //    if (!isnan(scale)) {
    //        CGAffineTransform transformScale = CGAffineTransformMakeScale(scale, scale);
    //        scaleTransform = CGAffineTransformConcat(oldTransform, transformScale);
    //    }
    if( ! isnan(maxWidth) && maxWidth > 0 ) {
        CGFloat           maxScale       = maxWidth / CGRectGetWidth(self.frame);
        CGAffineTransform transformScale = CGAffineTransformMakeScale(maxScale, maxScale);
        scaleTransform                   = CGAffineTransformConcat(oldTransform, transformScale);
    }
    if( ! CGAffineTransformEqualToTransform(scaleTransform, CGAffineTransformIdentity) ) {
        self.transform = scaleTransform;
    }

    CGRect actureFrame  = self.frame;  //已经变换过后的frame
    CGRect actureBounds = self.bounds; // CGRectApplyAffineTransform();

    // begin
    UIGraphicsBeginImageContextWithOptions(actureFrame.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    //    CGContextScaleCTM(UIGraphicsGetCurrentContext(), 1, -1);
    CGContextTranslateCTM(context, actureFrame.size.width / 2, actureFrame.size.height / 2);
    CGContextConcatCTM(context, self.transform);
    CGPoint anchorPoint = self.layer.anchorPoint;
    CGContextTranslateCTM(context, -actureBounds.size.width * anchorPoint.x, -actureBounds.size.height * anchorPoint.y);
    if( [self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)] ) {
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    } else {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    // end
    self.transform = oldTransform;

    return screenshot;
}

@end
