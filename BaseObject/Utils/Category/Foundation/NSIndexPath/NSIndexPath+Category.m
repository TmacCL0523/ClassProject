/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSIndexPath+Category.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "NSIndexPath+Category.h"

@implementation NSIndexPath (Category)
/**
 * Function: 上一个Row
 */
- (NSIndexPath *)cl_previousRow {
    return [NSIndexPath indexPathForRow:self.row - 1 inSection:self.section];
}

/**
 * Function: 下一个Row
 */
- (NSIndexPath *)cl_nextRow {
    return [NSIndexPath indexPathForRow:self.row + 1 inSection:self.section];
}

/**
 * Function: 上一个Item
 */
- (NSIndexPath *)cl_previousItem {
    return [NSIndexPath indexPathForItem:self.item - 1 inSection:self.section];
}

/**
 * Function: 下一个Item
 */
- (NSIndexPath *)cl_nextItem {
    return [NSIndexPath indexPathForItem:self.item + 1 inSection:self.section];
}

/**
 * Function: 上一个Section
 */
- (NSIndexPath *)cl_previousSection {
    return [NSIndexPath indexPathForRow:self.row inSection:self.section - 1];
}

/**
 * Function: 下一个Section
 */
- (NSIndexPath *)cl_nextSection {
    return [NSIndexPath indexPathForRow:self.row inSection:self.section + 1];
}
@end
