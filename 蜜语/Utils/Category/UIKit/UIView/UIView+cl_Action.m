/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIView+cl_Action.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "UIView+cl_Action.h"
#import <objc/runtime.h>
static char kActionHandlerTapBlockKey;
static char kActionHandlerTapGestureKey;
static char kActionHandlerLongPressBlockKey;
static char kActionHandlerLongPressGestureKey;

@implementation UIView (cl_Action)

/// 点击事件
/// @param actionBlock 回调
- (void)cl_addAcitonWith:(GestureActionBlock)actionBlock {
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerTapGestureKey);
    if( ! gesture ) {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerTapBlockKey, actionBlock, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForTapGesture:(UITapGestureRecognizer *)gesture {
    if( gesture.state == UIGestureRecognizerStateRecognized ) {
        GestureActionBlock block = objc_getAssociatedObject(self, &kActionHandlerTapBlockKey);
        if( block ) {
            block(gesture);
        }
    }
}

/// 长按事件
/// @param actionBlock 回调
- (void)cl_addLongActionWith:(GestureActionBlock)actionBlock {
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerLongPressGestureKey);
    if( ! gesture ) {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerLongPressBlockKey, actionBlock, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForLongPressGesture:(UITapGestureRecognizer *)gesture {
    if( gesture.state == UIGestureRecognizerStateRecognized ) {
        GestureActionBlock block = objc_getAssociatedObject(self, &kActionHandlerLongPressBlockKey);
        if( block ) {
            block(gesture);
        }
    }
}
@end
