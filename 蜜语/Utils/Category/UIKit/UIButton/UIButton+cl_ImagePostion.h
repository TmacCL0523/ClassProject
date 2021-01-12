/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIButton+cl_ImagePostion.h
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ButtonImageLocationTop,    //图片在上面
    ButtonImageLocationLeft,   //图片在左边
    ButtonImageLocationBottom, //图片在底部
    ButtonImageLocationRight   //图片在右边
} ButtonImageLocation;

@interface UIButton (cl_ImagePostion)

/// 设置图片所在位置
/// @param location 图片位置
/// @param padding 边距
- (void)cl_setImagePoint:(ButtonImageLocation)location andPadding:(CGFloat)padding;

@end
