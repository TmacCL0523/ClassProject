/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSData+CL_APNSToken.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <Foundation/Foundation.h>

@interface NSData (CL_APNSToken)
/**
 * Function: 将APNS NSData类型token 格式化成字符串
 */
- (NSString *)cl_APNSToken;

@end
