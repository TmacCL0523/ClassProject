/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIBarButtonItem+Category.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "UIBarButtonItem+cl_Category.h"
#import "UIButton+cl_Action.h"

@implementation UIBarButtonItem (cl_Category)

/// 初始化 - 文本
/// @param title 文本信息
/// @param method 点击回调
+ (UIBarButtonItem *)cl_buttonWithTitle:(NSString *)title method:(BarButtonMethodBlock)method {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame     = CGRectMake(0, 0, 40, 40);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn cl_addTargerWithAction:^(UIButton *btn) {
        if( method ) {
            method();
        };
    }];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return barButtonItem;
}

/// 初始化 - 图片
/// @param imageName 图片名称
/// @param method 点击回调
+ (UIBarButtonItem *)cl_buttonWithImage:(NSString *)imageName method:(BarButtonMethodBlock)method {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame     = CGRectMake(0, 0, 40, 40);
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn cl_addTargerWithAction:^(UIButton *btn) {
        if( method ) {
            method();
        };
    }];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return barButtonItem;
}

/// 初始化 - 文本&图片
/// @param title 文本信息
/// @param imageName 图片名称
/// @param selectImageName 选中图片名称
/// @param method 点击回调
+ (UIBarButtonItem *)cl_buttonWithTitle:(NSString *)title image:(NSString *)imageName selectImage:(NSString *)selectImageName method:(BarButtonMethodBlock)method {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame     = CGRectMake(0, 0, 40, 40);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateHighlighted];

    [btn cl_addTargerWithAction:^(UIButton *btn) {
        if( method ) {
            method();
        };
    }];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return barButtonItem;
}

@end
