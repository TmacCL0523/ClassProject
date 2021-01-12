/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIButton+cl_Action.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)(UIButton *btn);

@interface UIButton (cl_Action)

/// 添加点击事件
/// @param actionBlock 回调
- (void)cl_addTargerWithAction:(ActionBlock)actionBlock;

@end
