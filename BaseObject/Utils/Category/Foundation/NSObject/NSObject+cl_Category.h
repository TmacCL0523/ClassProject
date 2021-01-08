/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSObject+cl_Category.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <Foundation/Foundation.h>

@interface NSObject (cl_Category)

/**
 * Function: 版本号
 */
+ (NSString *)cl_Version;

/**
 * Function: build号
 */
+ (NSInteger)cl_Build;

/**
 * Function: Bundle id
 */
+ (NSString *)cl_BundleIdentifier;

/**
 * Function: 语言
 */
+ (NSString *)cl_CurrentLanguage;

/**
 * Function: 获取机型名称
 */
+ (NSString *)cl_getCurrentDeviceModel;

/**
 * Function: 类名
 */
- (NSString *)cl_ClassName;

/**
 * Function: 类名
 */
+ (NSString *)cl_ClassName;

/**
 * Function: 父类名
 */
- (NSString *)cl_SuperClassName;

/**
 * Function: 父类名
 */
+ (NSString *)cl_SuperClassName;

/**
 * Function: 实例属性字典
 */
- (NSDictionary *)cl_PropertyDictionary;

/**
 * Function: 属性名称列表
 */
- (NSArray *)cl_PropertyKeys;

/**
 * Function: 属性名称列表
 */
+ (NSArray *)cl_PropertyKeys;

/**
 * Function: 方法列表
 */
- (NSArray *)cl_MethodList;

/**
 * Function: 方法列表
 */
+ (NSArray *)cl_MethodList;

/**
 * Function: 格式化方法列表
 */
- (NSArray *)cl_MethodListInfo;

/**
 * Function: 创建并返回一个指向所有已注册类的指针列表
 */
+ (NSArray *)cl_RegistedClassList;

/**
 * Function: 实例变量
 */
+ (NSArray *)cl_InstanceVariable;

/**
 * Function: 是否包含某个属性
 */
- (BOOL)cl_HasPropertyForKey:(NSString *)key;

/**
 * Function: 是否包含某个实例变量
 */
- (BOOL)cl_HasIvarForKey:(NSString *)key;

/**
 * Function: 获取所有字体名称
 */
- (NSArray *)cl_GetFamilyNames;

/**
 * Function: 获取所有字体代号
 */
- (NSArray *)cl_GetFontNames;

/**
 * Function: 获取项目大小
 */
- (NSString *)cl_GetCacheValue;

/**
 * Function: 清楚缓存
 */
- (void)cl_CleanCache;

@end
