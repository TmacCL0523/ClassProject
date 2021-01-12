/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UITableView+Category.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

@interface UITableView (cl_Category)
/// 初始化
/// @param style 样式 UITableViewStylePlain,       UITableViewStyleGrouped(组）
/// @param cellSeparatorStyle 分割线样式
/// @param dataSource 数据源代理
/// @param delegate 代理
+ (UITableView *)cl_tableViewWithStyle:(UITableViewStyle)style
                    cellSeparatorStyle:(UITableViewCellSeparatorStyle)cellSeparatorStyle
                            dataSource:(id<UITableViewDataSource>)dataSource
                              delegate:(id<UITableViewDelegate>)delegate;

/// 更新tableview
/// @param block 回调
- (void)cl_updateWithBlock:(void (^)(UITableView *tableView))block;

// TODO: ---------- Section && Row ----------

/// 滑动
/// @param row 个数
/// @param section 组数
/// @param scrollPosition 动画效果
/// @param animated 是否动画
- (void)cl_scrollToRow:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

/// 插入
/// @param row 下标位置
/// @param section 组下标
/// @param animation 动画效果
- (void)cl_insertRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/// 刷新
/// @param row 下标位置
/// @param section 组下标位置
/// @param animation 动画效果
- (void)cl_reloadRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/// 删除
/// @param row 下标
/// @param section 组下标
/// @param animation 动画效果
- (void)cl_deleteRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

// TODO: ----------Row----------

/// 插入  indexPath
/// @param indexPath 下标元素
/// @param animation 动画效果
- (void)cl_insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

/// 刷新  indexPath
/// @param indexPath 下标元素
/// @param animation 动画效果
- (void)cl_reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

/// 删除  indexPath
/// @param indexPath 下标元素
/// @param animation 动画效果
- (void)cl_deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

// TODO: ----------Section----------

/// 插入  section
/// @param section 组元素
/// @param animation 动画效果
- (void)cl_insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/// 删除  section
/// @param section 组元素
/// @param animation 动画效果
- (void)cl_deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/// 刷新  section
/// @param section 组元素
/// @param animation 动画效果
- (void)cl_reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/// 清楚选中动画
/// @param animated YES NO
- (void)cl_clearSelectedRowsAnimated:(BOOL)animated;


@end
