/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSString+MimeType.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <Foundation/Foundation.h>



@interface NSString (MimeType)


/**
 * Function: 根据文件url 返回对应的MIMEType
 */
- (NSString *)MIMEType;

/**
 * Function: 根据文件url后缀 返回对应的MIMEType
 */
+ (NSString *)MIMETypeForExtension:(NSString *)extension;

/**
 * Function: 常见MIME集合
 */
+ (NSDictionary *)MIMEDict;

/**
 * Function: 获取随机 UUID 例如 E621E1F8-C36C-495A-93FC-0C247A3E6E5F
 */
+ (NSString *)UUID;

/**
 * Function: 毫秒时间戳 例如 1443066826371
 */
+ (NSString *)timesTampString;
@end


