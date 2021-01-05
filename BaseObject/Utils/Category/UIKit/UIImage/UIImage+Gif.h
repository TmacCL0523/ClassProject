/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIImage+Gif.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

typedef void (^GIFimageBlock)(UIImage *GIFImage);

@interface UIImage (Gif)

/// 根据本地GIF图片名 获得GIF image对象
/// @param name GIF图片名
+ (UIImage *)cl_imageWithGIFNamed:(NSString *)name;

/// 根据一个GIF图片的data数据 获得GIF image对象
/// @param data GIF图片的data数据
+ (UIImage *)cl_imageWithGIFData:(NSData *)data;

/// 根据一个GIF图片的URL 获得GIF image对象
/// @param url gif图片URL
/// @param gifImageBlock 回调
+ (void)cl_imageWithGIFUrl:(NSString *)url andGifImageBlock:(GIFimageBlock)gifImageBlock;

@end
