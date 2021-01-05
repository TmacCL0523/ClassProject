/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIView+Find.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

@interface UIView (Find)

/// 找到指定类名的SubVie对象
/// @param clazz SubVie类名
- (id)cl_findSubViewWithSubViewClass:(Class)clazz;

/// 找到指定类名的SuperView对象
/// @param clazz SuperView类名
- (id)cl_findSuperViewWithSuperViewClass:(Class)clazz;

/**
 * Function: 找到并且resign第一响应者
 */
- (BOOL)cl_findAndResignFirstResponder;

/**
 * Function: 找到第一响应者
 */
- (UIView *)cl_findFirstResponder;

@end
