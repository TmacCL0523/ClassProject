/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSData+CL_APNSToken.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "NSData+CL_APNSToken.h"

@implementation NSData (CL_APNSToken)
/**
 * Function: 将APNS NSData类型token 格式化成字符串
 */
- (NSString *)cl_APNSToken {
    return [[[[self description] stringByReplacingOccurrencesOfString:@"<" withString:@""] stringByReplacingOccurrencesOfString:@">" withString:@""] stringByReplacingOccurrencesOfString:@" "
                                                                                                                                                                               withString:@""];
}
@end
