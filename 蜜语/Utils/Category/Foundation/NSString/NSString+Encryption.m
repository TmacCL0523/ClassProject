/**
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSString+Encryption.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 **/

#import "NSString+Encryption.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Encryption)

/// 字符串 - MD5
- (NSString *)cl_MD5String {
    if( self == nil || [self length] == 0 ) {
        return nil;
    }

    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5([self UTF8String], (int) [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for( i = 0; i < CC_MD5_DIGEST_LENGTH; i++ ) {
        [ms appendFormat:@"%02x", (int) (digest[i])];
    }
    return [ms copy];
}

/// 字符串 - SHA1
- (NSString *)cl_SHA1string {
    if( self == nil || [self length] == 0 ) {
        return nil;
    }
    unsigned char digest[CC_SHA1_DIGEST_LENGTH], i;
    CC_SHA1([self UTF8String], (int) [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for( i = 0; i < CC_SHA1_DIGEST_LENGTH; i++ ) {
        [ms appendFormat:@"%02x", (int) (digest[i])];
    }
    return [ms copy];
}

/// 字符串 - SHA256
- (NSString *)cl_SHA256string {
    if( self == nil || [self length] == 0 ) {
        return nil;
    }
    unsigned char digest[CC_SHA256_DIGEST_LENGTH], i;
    CC_SHA256([self UTF8String], (int) [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for( i = 0; i < CC_SHA256_DIGEST_LENGTH; i++ ) {
        [ms appendFormat:@"%02x", (int) (digest[i])];
    }
    return [ms copy];
}

/// 字符串 - SHA512
- (NSString *)cl_SHA512string {
    if( self == nil || [self length] == 0 ) {
        return nil;
    }
    unsigned char digest[CC_SHA512_DIGEST_LENGTH], i;
    CC_SHA512([self UTF8String], (int) [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for( i = 0; i < CC_SHA512_DIGEST_LENGTH; i++ ) {
        [ms appendFormat:@"%02x", (int) (digest[i])];
    }
    return [ms copy];
}

/// 检查自身是否追加字符串
/// @param substring 追加字符串
- (BOOL)cl_stringIsHasString:(NSString *)substring {
    return ! ([self rangeOfString:substring].location == NSNotFound);
}

/// 创建 - Base64编码字符串
/// @param string 需要编码的字符串
+ (NSString *)cl_stringEncodeToBase64:(NSString *)string {
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

/// 字符串 - Base64编码字符串
- (NSString *)cl_stringEncodeToBase64 {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

/// 创建 - Base64解码字符串
/// @param string 需要解码字符串
+ (NSString *)cl_stringDecodeBase64:(NSString *)string {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

/// 字符串 - Base64解码字符串
- (NSString *)cl_stringDecodeBase64 {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

/// 字符串 - 转换为UTF8字符串
/// @param string 出入字符串
+ (NSString *)cl_convertToUTF8Entities:(NSString *)string {
    NSString *isoEncodedString =
        [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[string stringByReplacingOccurrencesOfString:@"%27" withString:@"'"] stringByReplacingOccurrencesOfString:[@"%e2%80%99" capitalizedString] withString:@"’"]
            stringByReplacingOccurrencesOfString:[@"%2d" capitalizedString]
                                      withString:@"-"] stringByReplacingOccurrencesOfString:[@"%c2%ab" capitalizedString] withString:@"«"]
            stringByReplacingOccurrencesOfString:[@"%c2%bb" capitalizedString]
                                      withString:@"»"] stringByReplacingOccurrencesOfString:[@"%c3%80" capitalizedString] withString:@"À"]
            stringByReplacingOccurrencesOfString:[@"%c3%82" capitalizedString]
                                      withString:@"Â"] stringByReplacingOccurrencesOfString:[@"%c3%84" capitalizedString] withString:@"Ä"]
            stringByReplacingOccurrencesOfString:[@"%c3%86" capitalizedString]
                                      withString:@"Æ"] stringByReplacingOccurrencesOfString:[@"%c3%87" capitalizedString] withString:@"Ç"]
            stringByReplacingOccurrencesOfString:[@"%c3%88" capitalizedString]
                                      withString:@"È"] stringByReplacingOccurrencesOfString:[@"%c3%89" capitalizedString] withString:@"É"]
            stringByReplacingOccurrencesOfString:[@"%c3%8a" capitalizedString]
                                      withString:@"Ê"] stringByReplacingOccurrencesOfString:[@"%c3%8b" capitalizedString] withString:@"Ë"]
            stringByReplacingOccurrencesOfString:[@"%c3%8f" capitalizedString]
                                      withString:@"Ï"] stringByReplacingOccurrencesOfString:[@"%c3%91" capitalizedString] withString:@"Ñ"]
            stringByReplacingOccurrencesOfString:[@"%c3%94" capitalizedString]
                                      withString:@"Ô"] stringByReplacingOccurrencesOfString:[@"%c3%96" capitalizedString] withString:@"Ö"]
            stringByReplacingOccurrencesOfString:[@"%c3%9b" capitalizedString]
                                      withString:@"Û"] stringByReplacingOccurrencesOfString:[@"%c3%9c" capitalizedString] withString:@"Ü"]
            stringByReplacingOccurrencesOfString:[@"%c3%a0" capitalizedString]
                                      withString:@"à"] stringByReplacingOccurrencesOfString:[@"%c3%a2" capitalizedString] withString:@"â"]
            stringByReplacingOccurrencesOfString:[@"%c3%a4" capitalizedString]
                                      withString:@"ä"] stringByReplacingOccurrencesOfString:[@"%c3%a6" capitalizedString] withString:@"æ"]
            stringByReplacingOccurrencesOfString:[@"%c3%a7" capitalizedString]
                                      withString:@"ç"] stringByReplacingOccurrencesOfString:[@"%c3%a8" capitalizedString] withString:@"è"]
            stringByReplacingOccurrencesOfString:[@"%c3%a9" capitalizedString]
                                      withString:@"é"] stringByReplacingOccurrencesOfString:[@"%c3%af" capitalizedString] withString:@"ï"]
            stringByReplacingOccurrencesOfString:[@"%c3%b4" capitalizedString]
                                      withString:@"ô"] stringByReplacingOccurrencesOfString:[@"%c3%b6" capitalizedString]
                                                                                 withString:@"ö"] stringByReplacingOccurrencesOfString:[@"%c3%bb" capitalizedString] withString:@"û"]
            stringByReplacingOccurrencesOfString:[@"%c3%bc" capitalizedString]
                                      withString:@"ü"] stringByReplacingOccurrencesOfString:[@"%c3%bf" capitalizedString] withString:@"ÿ"] stringByReplacingOccurrencesOfString:@"%20" withString:@" "];

    return isoEncodedString;
}

@end
