/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIButton+cl_Action.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "UIButton+cl_Action.h"
#import <objc/runtime.h>

static const void *UIButtonBlockKey = &UIButtonBlockKey;

@implementation UIButton (cl_Action)
/// 添加点击事件
/// @param actionBlock 回调
- (void)cl_addTargerWithAction:(ActionBlock)actionBlock {
    objc_setAssociatedObject(self, UIButtonBlockKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)actionTouched:(UIButton *)btn {
    ActionBlock block = objc_getAssociatedObject(self, UIButtonBlockKey);
    if( block ) {
        block(btn);
    }
}
@end
