/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIImage+cl_Editor.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "UIImage+cl_Editor.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
#import <ImageIO/ImageIO.h>

@implementation UIImage (cl_Editor)
/**
 * Function: 截屏
 */
+ (UIImage *)cl_screenshots {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, NO, 0);
    [window drawViewHierarchyInRect:window.frame afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/// 截图
/// @param view 界面
+ (UIImage *)cl_screenshotsWithView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, [UIScreen mainScreen].scale);
    // IOS7及其后续版本
    if( [view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)] ) {
        [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
    } else { // IOS7之前的版本
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    }

    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
}

/// 合成图片 - 上下
/// @param fistImage 上图片
/// @param otherImage 下图片
+ (UIImage *)cl_mergeImage:(UIImage *)fistImage otherImage:(UIImage *)otherImage {
    CGImageRef firstImageRef  = fistImage.CGImage;
    CGFloat    firstWidth     = CGImageGetWidth(firstImageRef);
    CGFloat    firstHeight    = CGImageGetHeight(firstImageRef);
    CGImageRef secondImageRef = otherImage.CGImage;
    CGFloat    secondWidth    = CGImageGetWidth(secondImageRef);
    CGFloat    secondHeight   = CGImageGetHeight(secondImageRef);
    CGSize     mergedSize     = CGSizeMake(MAX(firstWidth, secondWidth), MAX(firstHeight, secondHeight));
    UIGraphicsBeginImageContext(mergedSize);
    [fistImage drawInRect:CGRectMake(0, 0, firstWidth, firstHeight)];
    [otherImage drawInRect:CGRectMake(0, 0, secondWidth, secondHeight)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/// 压缩图片
/// @param imageName 图片名称
/// @param targetWidth 目标宽度
+ (UIImage *)cl_compressionImage:(NSString *)imageName toTargetWidth:(CGFloat)targetWidth {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image cl_compressionTargertWidth:targetWidth];
}

/// 压缩图片
/// @param targetWidth 目标宽度
- (UIImage *)cl_compressionTargertWidth:(CGFloat)targetWidth {
    //获取原图片的大小尺寸
    CGSize  imageSize = self.size;
    CGFloat width     = imageSize.width;
    CGFloat height    = imageSize.height;
    //根据目标图片的宽度计算目标图片的高度
    CGFloat targetHeight = (targetWidth / width) * height;
    //开启图片上下文
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    //绘制图片
    [self drawInRect:CGRectMake(0, 0, targetWidth, targetHeight)];
    //从上下文中获取绘制好的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图片上下文
    UIGraphicsEndImageContext();

    return newImage;
}

/// 合成图片 - 图片中添加文字
/// @param imageName 图片名字
/// @param title 文本
/// @param fontSize 文本字体大小
/// @param titleColor 文本颜色
+ (UIImage *)cl_imageName:(NSString *)imageName title:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image cl_imageTitle:title fontSize:fontSize titleColor:titleColor];
}

/// 合成图片 - 图片中添加文字 - 对象方法
/// @param title 文本
/// @param fontSize 文本字体大小
/// @param titleColor 文本颜色
- (UIImage *)cl_imageTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor {
    //画布大小
    CGSize size = CGSizeMake(self.size.width, self.size.height);
    //创建一个基于位图的上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0); // opaque:NO  scale:0.0

    [self drawAtPoint:CGPointMake(0.0, 0.0)];

    //文字居中显示在画布上
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode            = NSLineBreakByCharWrapping;
    paragraphStyle.alignment                = NSTextAlignmentCenter; //文字居中

    //计算文字所占的size,文字居中显示在画布上
    CGSize  sizeText = [title boundingRectWithSize:self.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil].size;
    CGFloat width    = self.size.width;
    CGFloat height   = self.size.height;

    CGRect rect = CGRectMake((width - sizeText.width) / 2, (height - sizeText.height) / 2, sizeText.width, sizeText.height);
    //绘制文字
    [title drawInRect:rect withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize], NSForegroundColorAttributeName : titleColor, NSParagraphStyleAttributeName : paragraphStyle}];

    //返回绘制的新图形
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/// 图片模糊
/// @param imageName 图片名称
+ (UIImage *)cl_imageFuzzy:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image cl_imageFuzzy];
}

/**
 * Function: 图片模糊
 */
- (UIImage *)cl_imageFuzzy {
    return [self imgWithLightAlpha:0.01 radius:3 colorSaturationFactor:1];
}
#pragma mark ================私有方法=================
- (UIImage *)imgWithLightAlpha:(CGFloat)alpha radius:(CGFloat)radius colorSaturationFactor:(CGFloat)colorSaturationFactor {
    UIColor *tintColor = [UIColor colorWithWhite:1.0 alpha:alpha];
    return [self imgBluredWithRadius:radius tintColor:tintColor saturationDeltaFactor:colorSaturationFactor maskImage:nil];
}

- (UIImage *)imgBluredWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage {
    CGRect   imageRect   = {CGPointZero, self.size};
    UIImage *effectImage = self;

    BOOL hasBlur             = blurRadius > __FLT_EPSILON__;
    BOOL hasSaturationChange = fabs(saturationDeltaFactor - 1.) > __FLT_EPSILON__;
    if( hasBlur || hasSaturationChange ) {
        UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef effectInContext = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(effectInContext, 1.0, -1.0);
        CGContextTranslateCTM(effectInContext, 0, -self.size.height);
        CGContextDrawImage(effectInContext, imageRect, self.CGImage);

        vImage_Buffer effectInBuffer;
        effectInBuffer.data     = CGBitmapContextGetData(effectInContext);
        effectInBuffer.width    = CGBitmapContextGetWidth(effectInContext);
        effectInBuffer.height   = CGBitmapContextGetHeight(effectInContext);
        effectInBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectInContext);

        UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef  effectOutContext = UIGraphicsGetCurrentContext();
        vImage_Buffer effectOutBuffer;
        effectOutBuffer.data     = CGBitmapContextGetData(effectOutContext);
        effectOutBuffer.width    = CGBitmapContextGetWidth(effectOutContext);
        effectOutBuffer.height   = CGBitmapContextGetHeight(effectOutContext);
        effectOutBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectOutContext);

        if( hasBlur ) {
            CGFloat inputRadius = blurRadius * [[UIScreen mainScreen] scale];
            int     radius      = floor(inputRadius * 3. * sqrt(2 * M_PI) / 4 + 0.5);
            if( radius % 2 != 1 ) {
                radius += 1; // force radius to be odd so that the three box-blur methodology works.
            }
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
        }
        BOOL effectImageBuffersAreSwapped = NO;
        if( hasSaturationChange ) {
            CGFloat s                               = saturationDeltaFactor;
            CGFloat floatingPointSaturationMatrix[] = {
                0.0722 + 0.9278 * s,
                0.0722 - 0.0722 * s,
                0.0722 - 0.0722 * s,
                0,
                0.7152 - 0.7152 * s,
                0.7152 + 0.2848 * s,
                0.7152 - 0.7152 * s,
                0,
                0.2126 - 0.2126 * s,
                0.2126 - 0.2126 * s,
                0.2126 + 0.7873 * s,
                0,
                0,
                0,
                0,
                1,
            };
            const int32_t divisor    = 256;
            NSUInteger    matrixSize = sizeof(floatingPointSaturationMatrix) / sizeof(floatingPointSaturationMatrix[0]);
            int16_t       saturationMatrix[matrixSize];
            for( NSUInteger i = 0; i < matrixSize; ++i ) {
                saturationMatrix[i] = (int16_t) roundf(floatingPointSaturationMatrix[i] * divisor);
            }
            if( hasBlur ) {
                vImageMatrixMultiply_ARGB8888(&effectOutBuffer, &effectInBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
                effectImageBuffersAreSwapped = YES;
            } else {
                vImageMatrixMultiply_ARGB8888(&effectInBuffer, &effectOutBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
            }
        }
        if( ! effectImageBuffersAreSwapped )
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

        if( effectImageBuffersAreSwapped )
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }

    // 开启上下文 用于输出图像
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef outputContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(outputContext, 1.0, -1.0);
    CGContextTranslateCTM(outputContext, 0, -self.size.height);

    // 开始画底图
    CGContextDrawImage(outputContext, imageRect, self.CGImage);

    // 开始画模糊效果
    if( hasBlur ) {
        CGContextSaveGState(outputContext);
        if( maskImage ) {
            CGContextClipToMask(outputContext, imageRect, maskImage.CGImage);
        }
        CGContextDrawImage(outputContext, imageRect, effectImage.CGImage);
        CGContextRestoreGState(outputContext);
    }

    // 添加颜色渲染
    if( tintColor ) {
        CGContextSaveGState(outputContext);
        CGContextSetFillColorWithColor(outputContext, tintColor.CGColor);
        CGContextFillRect(outputContext, imageRect);
        CGContextRestoreGState(outputContext);
    }

    // 输出成品,并关闭上下文
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return outputImage;
}
@end
