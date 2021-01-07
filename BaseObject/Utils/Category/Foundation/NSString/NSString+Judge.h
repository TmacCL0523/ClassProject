/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSString+Judge.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <Foundation/Foundation.h>

@interface NSString (Judge)

/// 获得汉字的拼音
/// @param chinese 中文字符串
+ (NSString *)cl_CheckPinYinWithStr:(NSString *)chinese;

/// 判断是否URL
- (BOOL)cl_regularIsUrl;

/**
 *  判断是否包含中文
 */
- (BOOL)cl_CheckContainChinese;

/**
 *  获取字符数量
 */
- (int)cl_CheckWordsCount;

/**
 *  字符串转字典
 */
- (NSDictionary *)cl_FormatterToDictionary;

/**
 *  手机号分服务商
 */
- (BOOL)cl_CheckMobileNumberClassification;

/**
 *  手机号有效性
 */
- (BOOL)cl_CheckMobileNumber;

/**
 *  邮箱地址
 */
- (BOOL)cl_CheckEmailAddress;

/**
 *  身份证号码
 */
- (BOOL)cl_CheckIdentityCardNum;

/**
 *  验证身份证（算法验证）
 */
+ (BOOL)cl_CheckSafeIDCardNumber:(NSString *)value;

/**
 *  车牌号码
 */
- (BOOL)cl_CheckCarNumber;

/**
 *  银行卡号验证（Luhn算法）
 */
- (BOOL)cl_CheckBankCardluhmCheck;

/**
 *  IP地址验证
 */
- (BOOL)cl_CheckIPAddress;

/**
 *  MAC地址验证
 */
- (BOOL)cl_CheckMacAddress;

/**
 *  网站验证
 */
- (BOOL)cl_CheckValidUrl;

/**
 *  纯中文验证
 */
- (BOOL)cl_CheckValidChinese;

/**
 *  邮编验证
 */
- (BOOL)cl_CheckValidPostalcode;

/**
 *  工商税号验证
 */
- (BOOL)cl_CheckValidTaxNo;

/// 是否符合最小长度、最长长度，是否包含中文,首字母是否可以为数字
/// @param minLenth 账号最小长度
/// @param maxLenth 账号最长长度
/// @param containChinese 是否包含中文
/// @param firstCannotBeDigtal 首字母不能为数字
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth maxLenth:(NSInteger)maxLenth containChinese:(BOOL)containChinese firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/// 是否符合最小长度、最长长度，是否包含中文,数字，字母，其他字符，首字母是否可以为数字
/// @param minLenth 账号最小长度
/// @param maxLenth 账号最长长度
/// @param containChinese 是否包含中文
/// @param containDigtal 包含数字
/// @param containLetter 包含字母
/// @param containOtherCharacter 其他字符
/// @param firstCannotBeDigtal 首字母不能为数字
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
              containDigtal:(BOOL)containDigtal
              containLetter:(BOOL)containLetter
      containOtherCharacter:(NSString *)containOtherCharacter
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

@end
