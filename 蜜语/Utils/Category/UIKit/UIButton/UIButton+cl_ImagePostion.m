/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIButton+cl_ImagePostion.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "UIButton+cl_ImagePostion.h"
#import <objc/runtime.h>

@implementation UIButton (cl_ImagePostion)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod    = class_getInstanceMethod([self class], NSSelectorFromString(@"layoutSubviews"));
        Method replacementMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"clKit_layoutSubviews"));
        method_exchangeImplementations(originalMethod, replacementMethod);
    });
}

- (void)clKit_layoutSubviews {
    [self clKit_layoutSubviews];

    id position = [self clKit_position];
    if( position ) {
        [self clKit_updateFrameWithLocation:[position integerValue] padding:[[self clKit_padding] floatValue]];
    }
}

- (void)cl_setImagePoint:(ButtonImageLocation)location andPadding:(CGFloat)padding {
    objc_setAssociatedObject(self, @selector(clKit_position), @(location), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, @selector(clKit_padding), @(padding), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)clKit_position {
    return objc_getAssociatedObject(self, _cmd);
}

- (id)clKit_padding {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)clKit_updateFrameWithLocation:(ButtonImageLocation)position padding:(CGFloat)padding {
    if( position == ButtonImageLocationTop ) {
        self.titleEdgeInsets = UIEdgeInsetsMake(CGRectGetHeight(self.imageView.bounds) + CGRectGetHeight(self.titleLabel.bounds) + padding, -CGRectGetWidth(self.imageView.bounds), 0, 0);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -CGRectGetWidth(self.titleLabel.bounds));

        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, CGRectGetHeight(self.titleLabel.bounds) + padding / 2, 0);
    } else if( position == ButtonImageLocationLeft ) {
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -padding);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);

        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, padding / 2);
    } else if( position == ButtonImageLocationBottom ) {
        self.titleEdgeInsets = UIEdgeInsetsMake(0, -CGRectGetWidth(self.imageView.bounds), CGRectGetHeight(self.imageView.bounds) + CGRectGetHeight(self.titleLabel.bounds) + padding, 0);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -CGRectGetWidth(self.titleLabel.bounds));

        self.contentEdgeInsets = UIEdgeInsetsMake(CGRectGetHeight(self.titleLabel.bounds) + padding / 2, 0, 0, 0);
    } else if( position == ButtonImageLocationRight ) {
        self.titleEdgeInsets = UIEdgeInsetsMake(0, -(CGRectGetWidth(self.imageView.bounds) * 2), 0, 0);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -(CGRectGetWidth(self.titleLabel.bounds) * 2 + padding));

        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, padding / 2);
    }
}

@end
