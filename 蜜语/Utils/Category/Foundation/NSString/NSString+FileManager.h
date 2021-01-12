/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSString+FileManager.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/


#import <Foundation/Foundation.h>

@interface NSString (FileManager)


/// 获取沙盒路径
+ (nullable NSString *)clPath_getApplicationSupportPath;

/// 获取软件沙盒Documents路径
+ (nullable NSString *)clPath_getDocumentsPath;

/// 获取软件沙盒cache路径
+ (nullable NSString *)clPath_getCachePath;

/// 获取软件沙盒cachesDic路径
+ (nullable NSString *)clPath_getTemPath;

/// 在软件沙盒指定的路径创建一个目录
/// @param newPath 目录名称
+ (BOOL)clPath_createDirectory:(nullable NSString *)newPath;

/// 在软件沙盒指定的路径删除一个目录
/// @param strItem 目录名称
+ (BOOL)clPath_deleteFilesysItem:(nullable NSString *)strItem;

/// 在软件沙盒路径移动一个目录到另一个目录中
/// @param currentPath 当前目录
/// @param newPath 新目录
+ (BOOL)clPath_moveFilesysItem:(nullable NSString *)currentPath toPath:(nullable NSString *)newPath;

/*! 在软件沙盒路径中查看有没有这个路径 */

/// 在软件沙盒路径中查看有没有这个路径
/// @param path 路径字符串
+ (BOOL)clPath_fileExist:(nullable NSString *)path;

/// 在软件沙盒路径中获取指定userPath路径
/// @param userPath 指定路径
- (nullable NSString *)clPath_getUserInfoStorePath:(nullable NSString *)userPath;

@end
