/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIImage+cl_Size.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "UIImage+cl_Size.h"
#import <ImageIO/ImageIO.h>

@implementation UIImage (cl_Size)
/// 获取网络图片 - 尺寸大小
/// @param url 链接
+ (CGSize)cl_getImageSizeWithUrl:(NSString *)url {
    NSMutableString *imageURL    = [NSMutableString stringWithFormat:@"%@", url];
    CGImageSourceRef source      = CGImageSourceCreateWithURL((CFURLRef) [NSURL URLWithString:imageURL], NULL);
    NSDictionary *   imageHeader = (__bridge NSDictionary *) CGImageSourceCopyPropertiesAtIndex(source, 0, NULL);
    NSLog(@"Image header info %@", imageHeader);
    CGFloat pixelHeight = [[imageHeader objectForKey:@"PixelHeight"] floatValue];
    CGFloat pixelWidth  = [[imageHeader objectForKey:@"PixelWidth"] floatValue];
    CGSize  size        = CGSizeMake(pixelWidth, pixelHeight);

    return size;
}
@end
