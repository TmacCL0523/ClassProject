/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     UIView+Find.m
 * 创建时间:    2020-12-29
 *
 *********************************************************************************
 */

#import "UIView+Find.h"

@implementation UIView (Find)

/// 找到指定类名的SubVie对象
/// @param clazz SubVie类名
- (id)cl_findSubViewWithSubViewClass:(Class)clazz {
    for( id subView in self.subviews ) {
        if( [subView isKindOfClass:clazz] ) {
            return subView;
        }
    }

    return nil;
}

/// 找到指定类名的SuperView对象
/// @param clazz SuperView类名
- (id)cl_findSuperViewWithSuperViewClass:(Class)clazz {
    if( self == nil ) {
        return nil;
    } else if( self.superview == nil ) {
        return nil;
    } else if( [self.superview isKindOfClass:clazz] ) {
        return self.superview;
    } else {
        return [self.superview cl_findSuperViewWithSuperViewClass:clazz];
    }
}

/**
 * Function: 找到并且resign第一响应者
 */
- (BOOL)cl_findAndResignFirstResponder {
    if( self.isFirstResponder ) {
        [self resignFirstResponder];
        return YES;
    }

    for( UIView *v in self.subviews ) {
        if( [v cl_findAndResignFirstResponder] ) {
            return YES;
        }
    }

    return NO;
}

/**
 * Function: 找到第一响应者
 */
- (UIView *)cl_findFirstResponder {
    if( ([self isKindOfClass:[UITextField class]] || [self isKindOfClass:[UITextView class]]) && (self.isFirstResponder) ) {
        return self;
    }

    for( UIView *v in self.subviews ) {
        UIView *fv = [v cl_findFirstResponder];
        if( fv ) {
            return fv;
        }
    }

    return nil;
}

@end
