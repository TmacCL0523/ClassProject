/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIBarButtonItem+Category.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

typedef void (^BarButtonMethodBlock)(void);

@interface UIBarButtonItem (cl_Category)

/// 初始化 - 文本
/// @param title 文本信息
/// @param method 点击回调
+ (UIBarButtonItem *)cl_buttonWithTitle:(NSString *)title method:(BarButtonMethodBlock)method;

/// 初始化 - 图片
/// @param imageName 图片名称
/// @param method 点击回调
+ (UIBarButtonItem *)cl_buttonWithImage:(NSString *)imageName method:(BarButtonMethodBlock)method;

/// 初始化 - 文本&图片
/// @param title 文本信息
/// @param imageName 图片名称
/// @param selectImageName 选中图片名称
/// @param method 点击回调
+ (UIBarButtonItem *)cl_buttonWithTitle:(NSString *)title image:(NSString *)imageName selectImage:(NSString *)selectImageName method:(BarButtonMethodBlock)method;

@end
