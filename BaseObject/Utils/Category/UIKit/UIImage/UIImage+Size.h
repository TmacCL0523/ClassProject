/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIImage+Size.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

@interface UIImage (Size)

/// 获取网络图片 - 尺寸大小
/// @param url 链接
- (CGSize)cl_getImageSizeWithUrl:(NSString *)url;

@end
