/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIImage+cl_Color.m
 * 创建时间:    2020-12-29
 * 作用:       图片和颜色
 *********************************************************************************
 */

#import "UIImage+cl_Color.h"

@implementation UIImage (cl_Color)

/// 根据颜色生成纯色图片
/// @param color 颜色
+ (UIImage *)cl_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

/// 取图片某一点的颜色
/// @param point 坐标
- (UIColor *)cl_colorAtPoint:(CGPoint)point {
    if( point.x < 0 || point.y < 0 )
        return nil;

    CGImageRef imageRef = self.CGImage;
    NSUInteger width    = CGImageGetWidth(imageRef);
    NSUInteger height   = CGImageGetHeight(imageRef);
    if( point.x >= width || point.y >= height )
        return nil;

    unsigned char *rawData = malloc(height * width * 4);
    if( ! rawData )
        return nil;

    CGColorSpaceRef colorSpace       = CGColorSpaceCreateDeviceRGB();
    NSUInteger      bytesPerPixel    = 4;
    NSUInteger      bytesPerRow      = bytesPerPixel * width;
    NSUInteger      bitsPerComponent = 8;
    CGContextRef    context          = CGBitmapContextCreate(rawData, width, height, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    if( ! context ) {
        free(rawData);
        return nil;
    }
    CGColorSpaceRelease(colorSpace);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);

    int     byteIndex = (bytesPerRow * point.y) + point.x * bytesPerPixel;
    CGFloat red       = (rawData[byteIndex] * 1.0) / 255.0;
    CGFloat green     = (rawData[byteIndex + 1] * 1.0) / 255.0;
    CGFloat blue      = (rawData[byteIndex + 2] * 1.0) / 255.0;
    CGFloat alpha     = (rawData[byteIndex + 3] * 1.0) / 255.0;

    UIColor *result = nil;
    result          = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    free(rawData);
    return result;
}

/// 取某一像素的颜色
/// @param point 坐标
- (UIColor *)cl_colorAtPixel:(CGPoint)point {
    // Cancel if point is outside image coordinates
    if( ! CGRectContainsPoint(CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), point) ) {
        return nil;
    }

    // Create a 1x1 pixel byte array and bitmap context to draw the pixel into.
    // Reference: http://stackoverflow.com/questions/1042830/retrieving-a-pixel-alpha-value-for-a-uiimage
    NSInteger       pointX           = trunc(point.x);
    NSInteger       pointY           = trunc(point.y);
    CGImageRef      cgImage          = self.CGImage;
    NSUInteger      width            = self.size.width;
    NSUInteger      height           = self.size.height;
    CGColorSpaceRef colorSpace       = CGColorSpaceCreateDeviceRGB();
    int             bytesPerPixel    = 4;
    int             bytesPerRow      = bytesPerPixel * 1;
    NSUInteger      bitsPerComponent = 8;
    unsigned char   pixelData[4]     = {0, 0, 0, 0};
    CGContextRef    context          = CGBitmapContextCreate(pixelData, 1, 1, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);

    // Draw the pixel we are interested in onto the bitmap context
    CGContextTranslateCTM(context, -pointX, pointY - (CGFloat) height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat) width, (CGFloat) height), cgImage);
    CGContextRelease(context);

    // Convert color values [0..255] to floats [0.0..1.0]
    CGFloat red   = (CGFloat) pixelData[0] / 255.0f;
    CGFloat green = (CGFloat) pixelData[1] / 255.0f;
    CGFloat blue  = (CGFloat) pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat) pixelData[3] / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

/**
 * Function: 图片是否有透明度通道
 */
- (BOOL)cl_hasAlphaChannel {
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage);
    return (alpha == kCGImageAlphaFirst || alpha == kCGImageAlphaLast || alpha == kCGImageAlphaPremultipliedFirst || alpha == kCGImageAlphaPremultipliedLast);
}

/// 获得灰度图
/// @param imageName 图片名称
+ (UIImage *)cl_covertToGrayImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image cl_covertToGrayImage];
}

/**
 * Function: 获得灰度图
 */
- (UIImage *)cl_covertToGrayImage {
    int width  = self.size.width;
    int height = self.size.height;

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef    context    = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpace, kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);

    if( context == NULL ) {
        return nil;
    }

    CGContextDrawImage(context, CGRectMake(0, 0, width, height), self.CGImage);
    CGImageRef contextRef = CGBitmapContextCreateImage(context);
    UIImage *  grayImage  = [UIImage imageWithCGImage:contextRef];
    CGContextRelease(context);
    CGImageRelease(contextRef);

    return grayImage;
}

@end
