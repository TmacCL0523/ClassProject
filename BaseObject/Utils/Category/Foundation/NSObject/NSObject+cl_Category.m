/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     NSObject+cl_Category.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "NSObject+cl_Category.h"
#import <sys/utsname.h>
#import <objc/runtime.h>

@implementation NSObject (cl_Category)

/** 版本号 */
+ (NSString *)cl_Version {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *    app_Version    = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

/** build号 */
+ (NSInteger)cl_Build {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *    app_build      = [infoDictionary objectForKey:@"CFBundleVersion"];
    return [app_build integerValue];
}

/** Bundle id */
+ (NSString *)cl_BundleIdentifier {
    NSDictionary *infoDictionary   = [[NSBundle mainBundle] infoDictionary];
    NSString *    bundleIdentifier = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    return bundleIdentifier;
}

/** 语言 */
+ (NSString *)cl_CurrentLanguage {
    NSArray * languages       = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages firstObject];
    return [NSString stringWithString:currentLanguage];
}

/// 获取机型名称
+ (NSString *)cl_getCurrentDeviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    NSLog(@"deviceModel ==> %@", deviceModel);
    if( [deviceModel isEqualToString:@"iPhone3,1"] )
        return @"iPhone 4";
    if( [deviceModel isEqualToString:@"iPhone3,2"] )
        return @"iPhone 4";
    if( [deviceModel isEqualToString:@"iPhone3,3"] )
        return @"iPhone 4";
    if( [deviceModel isEqualToString:@"iPhone4,1"] )
        return @"iPhone 4S";
    if( [deviceModel isEqualToString:@"iPhone5,1"] )
        return @"iPhone 5";
    if( [deviceModel isEqualToString:@"iPhone5,2"] )
        return @"iPhone 5 (GSM+CDMA)";
    if( [deviceModel isEqualToString:@"iPhone5,3"] )
        return @"iPhone 5c (GSM)";
    if( [deviceModel isEqualToString:@"iPhone5,4"] )
        return @"iPhone 5c (GSM+CDMA)";
    if( [deviceModel isEqualToString:@"iPhone6,1"] )
        return @"iPhone 5s (GSM)";
    if( [deviceModel isEqualToString:@"iPhone6,2"] )
        return @"iPhone 5s (GSM+CDMA)";
    if( [deviceModel isEqualToString:@"iPhone7,1"] )
        return @"iPhone 6 Plus";
    if( [deviceModel isEqualToString:@"iPhone7,2"] )
        return @"iPhone 6";
    if( [deviceModel isEqualToString:@"iPhone8,1"] )
        return @"iPhone 6s";
    if( [deviceModel isEqualToString:@"iPhone8,2"] )
        return @"iPhone 6s Plus";
    if( [deviceModel isEqualToString:@"iPhone8,4"] )
        return @"iPhone SE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if( [deviceModel isEqualToString:@"iPhone9,1"] )
        return @"iPhone 7";
    if( [deviceModel isEqualToString:@"iPhone9,2"] )
        return @"iPhone 7 Plus";
    if( [deviceModel isEqualToString:@"iPhone9,3"] )
        return @"iPhone 7";
    if( [deviceModel isEqualToString:@"iPhone9,4"] )
        return @"iPhone 7 Plus";
    if( [deviceModel isEqualToString:@"iPhone10,1"] )
        return @"iPhone_8";
    if( [deviceModel isEqualToString:@"iPhone10,4"] )
        return @"iPhone_8";
    if( [deviceModel isEqualToString:@"iPhone10,2"] )
        return @"iPhone_8_Plus";
    if( [deviceModel isEqualToString:@"iPhone10,5"] )
        return @"iPhone_8_Plus";
    if( [deviceModel isEqualToString:@"iPhone10,3"] )
        return @"iPhone X";
    if( [deviceModel isEqualToString:@"iPhone10,6"] )
        return @"iPhone X";
    if( [deviceModel isEqualToString:@"iPhone11,8"] )
        return @"iPhone XR";
    if( [deviceModel isEqualToString:@"iPhone11,2"] )
        return @"iPhone XS";
    if( [deviceModel isEqualToString:@"iPhone11,6"] )
        return @"iPhone XS Max";
    if( [deviceModel isEqualToString:@"iPhone11,4"] )
        return @"iPhone XS Max";
    if( [deviceModel isEqualToString:@"iPod1,1"] )
        return @"iPod Touch 1G";
    if( [deviceModel isEqualToString:@"iPod2,1"] )
        return @"iPod Touch 2G";
    if( [deviceModel isEqualToString:@"iPod3,1"] )
        return @"iPod Touch 3G";
    if( [deviceModel isEqualToString:@"iPod4,1"] )
        return @"iPod Touch 4G";
    if( [deviceModel isEqualToString:@"iPod5,1"] )
        return @"iPod Touch (5 Gen)";
    if( [deviceModel isEqualToString:@"iPad1,1"] )
        return @"iPad";
    if( [deviceModel isEqualToString:@"iPad1,2"] )
        return @"iPad 3G";
    if( [deviceModel isEqualToString:@"iPad2,1"] )
        return @"iPad 2 (WiFi)";
    if( [deviceModel isEqualToString:@"iPad2,2"] )
        return @"iPad 2";
    if( [deviceModel isEqualToString:@"iPad2,3"] )
        return @"iPad 2 (CDMA)";
    if( [deviceModel isEqualToString:@"iPad2,4"] )
        return @"iPad 2";
    if( [deviceModel isEqualToString:@"iPad2,5"] )
        return @"iPad Mini (WiFi)";
    if( [deviceModel isEqualToString:@"iPad2,6"] )
        return @"iPad Mini";
    if( [deviceModel isEqualToString:@"iPad2,7"] )
        return @"iPad Mini (GSM+CDMA)";
    if( [deviceModel isEqualToString:@"iPad3,1"] )
        return @"iPad 3 (WiFi)";
    if( [deviceModel isEqualToString:@"iPad3,2"] )
        return @"iPad 3 (GSM+CDMA)";
    if( [deviceModel isEqualToString:@"iPad3,3"] )
        return @"iPad 3";
    if( [deviceModel isEqualToString:@"iPad3,4"] )
        return @"iPad 4 (WiFi)";
    if( [deviceModel isEqualToString:@"iPad3,5"] )
        return @"iPad 4";
    if( [deviceModel isEqualToString:@"iPad3,6"] )
        return @"iPad 4 (GSM+CDMA)";
    if( [deviceModel isEqualToString:@"iPad4,1"] )
        return @"iPad Air (WiFi)";
    if( [deviceModel isEqualToString:@"iPad4,2"] )
        return @"iPad Air (Cellular)";
    if( [deviceModel isEqualToString:@"iPad4,4"] )
        return @"iPad Mini 2 (WiFi)";
    if( [deviceModel isEqualToString:@"iPad4,5"] )
        return @"iPad Mini 2 (Cellular)";
    if( [deviceModel isEqualToString:@"iPad4,6"] )
        return @"iPad Mini 2";
    if( [deviceModel isEqualToString:@"iPad4,7"] )
        return @"iPad Mini 3";
    if( [deviceModel isEqualToString:@"iPad4,8"] )
        return @"iPad Mini 3";
    if( [deviceModel isEqualToString:@"iPad4,9"] )
        return @"iPad Mini 3";
    if( [deviceModel isEqualToString:@"iPad5,1"] )
        return @"iPad Mini 4 (WiFi)";
    if( [deviceModel isEqualToString:@"iPad5,2"] )
        return @"iPad Mini 4 (LTE)";
    if( [deviceModel isEqualToString:@"iPad5,3"] )
        return @"iPad Air 2";
    if( [deviceModel isEqualToString:@"iPad5,4"] )
        return @"iPad Air 2";
    if( [deviceModel isEqualToString:@"iPad6,3"] )
        return @"iPad Pro 9.7";
    if( [deviceModel isEqualToString:@"iPad6,4"] )
        return @"iPad Pro 9.7";
    if( [deviceModel isEqualToString:@"iPad6,7"] )
        return @"iPad Pro 12.9";
    if( [deviceModel isEqualToString:@"iPad6,8"] )
        return @"iPad Pro 12.9";

    if( [deviceModel isEqualToString:@"AppleTV2,1"] )
        return @"Apple TV 2";
    if( [deviceModel isEqualToString:@"AppleTV3,1"] )
        return @"Apple TV 3";
    if( [deviceModel isEqualToString:@"AppleTV3,2"] )
        return @"Apple TV 3";
    if( [deviceModel isEqualToString:@"AppleTV5,3"] )
        return @"Apple TV 4";

    if( [deviceModel isEqualToString:@"i386"] )
        return @"Simulator";
    if( [deviceModel isEqualToString:@"x86_64"] )
        return @"Simulator";
    return deviceModel;
}

/** 类名 */
- (NSString *)cl_ClassName {
    return NSStringFromClass([self class]);
}

/** 类名 */
+ (NSString *)cl_ClassName {
    return NSStringFromClass([self class]);
}

/** 父类名 */
- (NSString *)cl_SuperClassName {
    return NSStringFromClass([self superclass]);
}

/** 父类名 */
+ (NSString *)cl_SuperClassName {
    return NSStringFromClass([self superclass]);
}

/** 实例属性字典 */
- (NSDictionary *)cl_PropertyDictionary {
    //创建可变字典
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    unsigned int         outCount;
    objc_property_t *    props = class_copyPropertyList([self class], &outCount);
    for( int i = 0; i < outCount; i++ ) {
        objc_property_t prop      = props[i];
        NSString *      propName  = [[NSString alloc] initWithCString:property_getName(prop) encoding:NSUTF8StringEncoding];
        id              propValue = [self valueForKey:propName];
        [dict setObject:propValue ?: [NSNull null] forKey:propName];
    }
    free(props);
    return dict;
}

/** 属性名称列表 */
- (NSArray *)cl_PropertyKeys {
    return [[self class] cl_PropertyKeys];
}

/** 属性名称列表 */
+ (NSArray *)cl_PropertyKeys {
    unsigned int     propertyCount = 0;
    objc_property_t *properties    = class_copyPropertyList(self, &propertyCount);
    NSMutableArray * propertyNames = [NSMutableArray array];
    for( unsigned int i = 0; i < propertyCount; ++i ) {
        objc_property_t property = properties[i];
        const char *    name     = property_getName(property);
        [propertyNames addObject:[NSString stringWithUTF8String:name]];
    }
    free(properties);
    return propertyNames;
}

/** 方法列表 */
- (NSArray *)cl_MethodList {
    u_int           count;
    NSMutableArray *methodList = [NSMutableArray array];
    Method *        methods    = class_copyMethodList([self class], &count);
    for( int i = 0; i < count; i++ ) {
        SEL       name    = method_getName(methods[i]);
        NSString *strName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        [methodList addObject:strName];
    }
    free(methods);
    return methodList;
}

/** 方法列表 */
+ (NSArray *)cl_MethodList {
    u_int           count;
    NSMutableArray *methodList = [NSMutableArray array];
    Method *        methods    = class_copyMethodList([self class], &count);
    for( int i = 0; i < count; i++ ) {
        SEL       name    = method_getName(methods[i]);
        NSString *strName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        [methodList addObject:strName];
    }
    free(methods);

    return methodList;
}

/** 格式化方法列表 */
- (NSArray *)cl_MethodListInfo {
    u_int           count;
    NSMutableArray *methodList = [NSMutableArray array];
    Method *        methods    = class_copyMethodList([self class], &count);
    for( int i = 0; i < count; i++ ) {
        NSMutableDictionary *info = [NSMutableDictionary dictionary];

        Method method = methods[i];
        //        IMP imp = method_getImplementation(method);
        SEL name = method_getName(method);
        // 返回方法的参数的个数
        int argumentsCount = method_getNumberOfArguments(method);
        //获取描述方法参数和返回值类型的字符串
        const char *encoding = method_getTypeEncoding(method);
        //取方法的返回值类型的字符串
        const char *returnType = method_copyReturnType(method);

        NSMutableArray *arguments = [NSMutableArray array];
        for( int index = 0; index < argumentsCount; index++ ) {
            // 获取方法的指定位置参数的类型字符串
            char *arg = method_copyArgumentType(method, index);
            //            NSString *argString = [NSString stringWithCString:arg encoding:NSUTF8StringEncoding];
            [arguments addObject:[[self class] decodeType:arg]];
        }

        NSString *returnTypeString = [[self class] decodeType:returnType];
        NSString *encodeString     = [[self class] decodeType:encoding];
        NSString *nameString       = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];

        [info setObject:arguments forKey:@"arguments"];
        [info setObject:[NSString stringWithFormat:@"%d", argumentsCount] forKey:@"argumentsCount"];
        [info setObject:returnTypeString forKey:@"returnType"];
        [info setObject:encodeString forKey:@"encode"];
        [info setObject:nameString forKey:@"name"];
        //        [info setObject:imp_f forKey:@"imp"];
        [methodList addObject:info];
    }
    free(methods);
    return methodList;
}

/** 创建并返回一个指向所有已注册类的指针列表 */
+ (NSArray *)cl_RegistedClassList {
    NSMutableArray *result = [NSMutableArray array];

    unsigned int count;
    Class *      classes = objc_copyClassList(&count);
    for( int i = 0; i < count; i++ ) {
        [result addObject:NSStringFromClass(classes[i])];
    }
    free(classes);
    [result sortedArrayUsingSelector:@selector(compare:)];

    return result;
}

/** 实例变量 */
+ (NSArray *)cl_InstanceVariable {
    unsigned int    outCount;
    Ivar *          ivars  = class_copyIvarList([self class], &outCount);
    NSMutableArray *result = [NSMutableArray array];
    for( int i = 0; i < outCount; i++ ) {
        NSString *type            = [[self class] decodeType:ivar_getTypeEncoding(ivars[i])];
        NSString *name            = [NSString stringWithCString:ivar_getName(ivars[i]) encoding:NSUTF8StringEncoding];
        NSString *ivarDescription = [NSString stringWithFormat:@"%@ %@", type, name];
        [result addObject:ivarDescription];
    }
    free(ivars);
    return result.count ? [result copy] : nil;
}

/** 是否包含某个属性 */
- (BOOL)cl_HasPropertyForKey:(NSString *)key {
    objc_property_t property = class_getProperty([self class], [key UTF8String]);
    return (BOOL) property;
}

/** 是否包含某个实例变量 */
- (BOOL)cl_HasIvarForKey:(NSString *)key {
    Ivar ivar = class_getInstanceVariable([self class], [key UTF8String]);
    return (BOOL) ivar;
}

- (void)cl_ModelWithDictionary:(NSDictionary *)dict __attribute__((deprecated(" "))) {
    //得到本模型的所有属性
    NSArray *propertyNameList = [self getPropertyNameList];
    //遍历字典中的所有属性
    [dict enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key, id _Nonnull obj, BOOL *_Nonnull stop) {
        //根据本类的属性有选择的拿字典中的key value
        //如果本类的属性包含字典的key,则把key的value赋值给这个属性
        if( [propertyNameList containsObject:key] ) {
            [self setValue:obj forKey:key];
        }
    }];
}

- (NSArray<NSString *> *)getPropertyNameList {
    NSMutableArray *mArray = [NSMutableArray array];
    unsigned int    count;
    /*
     本类中的属性列表
     1.哪个类
     2.输出参数 有几个属性
     返回一个数组 数组内的类型是objc_property_t, 代表了属性
     */
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);

    //循环所有属性,拿到属性名字
    for( int i = 0; i < count; i++ ) {
        objc_property_t properyt     = propertyList[i];
        const char *    propertyName = property_getName(properyt);
        //属性的名字
        NSString *nameString = [NSString stringWithUTF8String:propertyName];
        [mArray addObject:nameString];
    }
    return mArray.copy;
}

+ (NSString *)decodeType:(const char *)cString {
    if( ! strcmp(cString, @encode(char)) )
        return @"char";
    if( ! strcmp(cString, @encode(int)) )
        return @"int";
    if( ! strcmp(cString, @encode(short)) )
        return @"short";
    if( ! strcmp(cString, @encode(long)) )
        return @"long";
    if( ! strcmp(cString, @encode(long long)) )
        return @"long long";
    if( ! strcmp(cString, @encode(unsigned char)) )
        return @"unsigned char";
    if( ! strcmp(cString, @encode(unsigned int)) )
        return @"unsigned int";
    if( ! strcmp(cString, @encode(unsigned short)) )
        return @"unsigned short";
    if( ! strcmp(cString, @encode(unsigned long)) )
        return @"unsigned long";
    if( ! strcmp(cString, @encode(unsigned long long)) )
        return @"unsigned long long";
    if( ! strcmp(cString, @encode(float)) )
        return @"float";
    if( ! strcmp(cString, @encode(double)) )
        return @"double";
    if( ! strcmp(cString, @encode(bool)) )
        return @"bool";
    if( ! strcmp(cString, @encode(_Bool)) )
        return @"_Bool";
    if( ! strcmp(cString, @encode(void)) )
        return @"void";
    if( ! strcmp(cString, @encode(char *)) )
        return @"char *";
    if( ! strcmp(cString, @encode(id)) )
        return @"id";
    if( ! strcmp(cString, @encode(Class)) )
        return @"class";
    if( ! strcmp(cString, @encode(SEL)) )
        return @"SEL";
    if( ! strcmp(cString, @encode(BOOL)) )
        return @"BOOL";

    NSString *result = [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];

    if( [[result substringToIndex:1] isEqualToString:@"@"] && [result rangeOfString:@"?"].location == NSNotFound ) {
        result = [[result substringWithRange:NSMakeRange(2, result.length - 3)] stringByAppendingString:@"*"];
    } else {
        if( [[result substringToIndex:1] isEqualToString:@"^"] ) {
            result = [NSString stringWithFormat:@"%@ *", [NSString decodeType:[[result substringFromIndex:1] cStringUsingEncoding:NSUTF8StringEncoding]]];
        }
    }
    return result;
}

/// 获取所有字体名称
- (NSArray *)cl_GetFamilyNames {
    NSMutableArray *familyNamesArray = [NSMutableArray array];
    for( NSString *fontfamilyname in [UIFont familyNames] ) {
        [familyNamesArray addObject:fontfamilyname];
        for( NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname] ) {
            NSLog(@"\tfont:'%@'", fontName);
        }
    }
    return familyNamesArray;
}

/// 获取所有字体代号
- (NSArray *)cl_GetFontNames {
    NSMutableArray *fontNamesArray = [NSMutableArray array];
    for( NSString *fontfamilyname in [UIFont familyNames] ) {
        for( NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname] ) {
            [fontNamesArray addObject:fontName];
        }
    }
    return fontNamesArray;
}

/// 获取项目大小
- (NSString *)cl_GetCacheValue {
    //获取文件管理器对象
    NSFileManager *fileManger = [NSFileManager defaultManager];
    //获取缓存沙盒路径
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    //拼接缓存文件文件夹路径
    NSString *fileCachePath = [cachePath stringByAppendingPathComponent:@"缓存文件夹（非全路径）"];
    //获取到该缓存目录下的所有子文件（只是文件名并不是路径，后面要拼接）
    NSArray *subFilePath = [fileManger subpathsAtPath:fileCachePath];
    //先定义一个缓存目录总大小的变量
    NSInteger fileTotalSize = 0;
    for( NSString *fileName in subFilePath ) {
        //拼接文件全路径（注意：是文件）
        NSString *filePath = [fileCachePath stringByAppendingPathComponent:fileName];
        //获取文件属性
        NSDictionary *fileAttributes = [fileManger attributesOfItemAtPath:filePath error:nil];
        //根据文件属性判断是否是文件夹（如果是文件夹就跳过文件夹，不将文件夹大小累加到文件总大小）
        if( [fileAttributes[NSFileType] isEqualToString:NSFileTypeDirectory] )
            continue;
        //获取单个文件大小,并累加到总大小
        fileTotalSize += [fileAttributes[NSFileSize] integerValue];
    }
    //将字节大小转为MB，然后传出去
    return [self cl_GetCacheSizerWith:fileTotalSize];
}

/// 清楚缓存
- (void)cl_CleanCache {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //    //先清除内存中的图片缓存
    //    [[SDImageCache sharedImageCache] clearMemory];
    //    //清除磁盘的缓存
    //    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
    // 2.删除自己缓存
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

- (NSString *)cl_GetCacheSizerWith:(CGFloat)size {
    // 1k = 1024, 1m = 1024k
    if( size < 1024 ) { // 小于1k
        return [NSString stringWithFormat:@"%.1fB", size];
    } else if( size < 1024 * 1024 ) { // 小于1m
        CGFloat aFloat = size / 1024;
        return [NSString stringWithFormat:@"%.1fK", aFloat];
    } else if( size < 1024 * 1024 * 1024 ) { // 小于1G
        CGFloat aFloat = size / (1024 * 1024);
        return [NSString stringWithFormat:@"%.1fM", aFloat];
    } else {
        CGFloat aFloat = size / (10241024 * 1024);
        return [NSString stringWithFormat:@"%.1fG", aFloat];
    }
    return @"";
}

@end
