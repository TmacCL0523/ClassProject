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

    NSMutableString *deviceTokenString1 = [NSMutableString string];
       const char *bytes = self.bytes;
       int iCount = self.length;
       for (int i = 0; i < iCount; i++) {
           [deviceTokenString1 appendFormat:@"%02x", bytes[i]&0x000000FF];
       }

    return deviceTokenString1;
}
@end
