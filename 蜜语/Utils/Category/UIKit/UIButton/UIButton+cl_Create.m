/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIButton+cl_Create.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "UIButton+cl_Create.h"

@implementation UIButton (cl_Create)

/// 创建 - 文本、图片button
/// @param title 文本
/// @param color 文字颜色
/// @param font 文字字体
/// @param nonalImage 正常图片
/// @param selectImage 点击后的图片
+ (instancetype)cl_createWithTitle:(NSString *)title titleColor:(UIColor *)color titleFont:(UIFont *)font nonalImage:(UIImage *)nonalImage selectImage:(UIImage *)selectImage {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:nonalImage forState:UIControlStateNormal];
    [button setImage:selectImage forState:UIControlStateHighlighted];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button.titleLabel setFont:font];
    [button sizeToFit];
    return button;
}

/// 创建 - 文本button
/// @param title 文本
/// @param color 文本颜色
/// @param font 文本字体
+ (instancetype)cl_createWithTitle:(NSString *)title titleColor:(UIColor *)color titleFont:(UIFont *)font {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button.titleLabel setFont:font];
    [button sizeToFit];
    return button;
}

/// 创建 - 图片button
/// @param nonalImage 默认图片
/// @param selectImage 选中图片
+ (instancetype)clcreateWithNonalImage:(UIImage *)nonalImage selectImage:(UIImage *)selectImage {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:nonalImage forState:UIControlStateNormal];
    [button setImage:selectImage forState:UIControlStateHighlighted];
    [button sizeToFit];
    return button;
}

/// 设置背景颜色
/// @param backgroundColor 背景颜色
/// @param state 状态
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[self imageWithColor:backgroundColor] forState:state];
}

/// 颜色转图片
/// @param color 颜色
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}
/// 多久之后开始执行
/// @param timeout 多少秒
/// @param waitBlock 倒计时
/// @param finishBlock 倒计时结束时回调
- (void)clKitStartTime:(NSInteger)timeout waitBlock:(void (^)(NSInteger remainTime))waitBlock finishBlock:(void (^)(void))finishBlock {
    __block NSInteger timeOut = timeout;

    dispatch_queue_t  queue  = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行

    dispatch_source_set_event_handler(_timer, ^{
        if( timeOut <= 0 ) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                if( finishBlock ) {
                    finishBlock();
                }
                self.userInteractionEnabled = YES;
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                if( waitBlock ) {
                    waitBlock(timeOut);
                }
                self.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}

@end
