/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSString+FileManager.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import "NSString+FileManager.h"

@implementation NSString (FileManager)

/// 获取沙盒路径
+ (nullable NSString *)clPath_getApplicationSupportPath {
    // such as:../Applications/9A425424-645E-4337-8730-8A080DF086F4/Library/Application Support

    NSArray *libraryPaths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSAllDomainsMask, YES);

    NSString *path = nil;
    if( [libraryPaths count] > 0 ) {
        path = [libraryPaths objectAtIndex:0];
    }

    if( ! [self clPath_fileExist:path] ) {
        [self clPath_createDirectory:path];
    }

    return path;
}

/// 获取软件沙盒Documents路径
+ (nullable NSString *)clPath_getDocumentsPath {
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];

    // such as:../Applications/9A425424-645E-4337-8730-8A080DF086F4/Documents
    return documentPath;
}

/// 获取软件沙盒cache路径
+ (nullable NSString *)clPath_getCachePath {
    // such as : ../Applications/9A425424-645E-4337-8730-8A080DF086F4/Library/Caches
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return cachePath;
}

/// 获取软件沙盒cachesDic路径
+ (nullable NSString *)clPath_getTemPath {
    NSString *cachesDic = NSTemporaryDirectory();
    return cachesDic;
}

/// 在软件沙盒指定的路径创建一个目录
/// @param newPath 目录名称
+ (BOOL)clPath_createDirectory:(nullable NSString *)newPath {
    if( [self clPath_fileExist:newPath] )
        return YES;

    NSError *error    = nil;
    BOOL     finished = [[NSFileManager defaultManager] createDirectoryAtPath:newPath withIntermediateDirectories:YES attributes:nil error:&error];
    return finished;
}

/// 在软件沙盒指定的路径删除一个目录
/// @param strItem 目录名称
+ (BOOL)clPath_deleteFilesysItem:(nullable NSString *)strItem{
    if ([strItem length] == 0) {
        return YES;
    }

    NSError * error = nil;

    BOOL finished = [[NSFileManager defaultManager] removeItemAtPath:strItem error:&error];
    return finished;
}

/// 在软件沙盒路径移动一个目录到另一个目录中
/// @param currentPath 当前目录
/// @param newPath 新目录
+ (BOOL)clPath_moveFilesysItem:(nullable NSString *)currentPath toPath:(nullable NSString *)newPath{
    if (![self clPath_fileExist:currentPath]) return NO;

    NSError * error = nil;
    return [[NSFileManager defaultManager] moveItemAtPath:currentPath
                                                   toPath:newPath
                                                    error:&error];
}

/*! 在软件沙盒路径中查看有没有这个路径 */

/// 在软件沙盒路径中查看有没有这个路径
/// @param path 路径字符串
+ (BOOL)clPath_fileExist:(nullable NSString *)path{
    NSFileManager *file_manager = [NSFileManager defaultManager];
    BOOL finded = [file_manager fileExistsAtPath:path];
    return finded;
}

/// 在软件沙盒路径中获取指定userPath路径
/// @param userPath 指定路径
- (nullable NSString *)clPath_getUserInfoStorePath:(nullable NSString *)userPath{
    NSString *destPath = [NSString clPath_getDocumentsPath];
    NSString *userInfoPath = [destPath stringByAppendingString:[NSString stringWithFormat:@"/%@", userPath]];
    return userInfoPath;
}

@end
