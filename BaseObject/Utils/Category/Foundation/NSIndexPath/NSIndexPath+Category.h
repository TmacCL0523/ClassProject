/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSIndexPath+Category.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <Foundation/Foundation.h>

@interface NSIndexPath (Category)

/**
 * Function: 上一个Row
 */
- (NSIndexPath *)cl_previousRow;

/**
 * Function: 下一个Row
 */
- (NSIndexPath *)cl_nextRow;

/**
 * Function: 上一个Item
 */
- (NSIndexPath *)cl_previousItem;

/**
 * Function: 下一个Item
 */
- (NSIndexPath *)cl_nextItem;

/**
 * Function: 上一个Section
 */
- (NSIndexPath *)cl_previousSection;

/**
 * Function: 下一个Section
 */
- (NSIndexPath *)cl_nextSection;

@end
