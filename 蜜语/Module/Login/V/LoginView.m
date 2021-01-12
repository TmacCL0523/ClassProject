/**
 *********************************************************************************
 *
 * 用户名:     QiYue
 * 文件名:     LoginView.m
 * 工程名:     BaseObject
 * 父类:       UIView
 * 创建时间:    2020/12/14
 *
 *********************************************************************************
 **/

#import "LoginView.h"

@interface LoginView ()



@end

@implementation LoginView

#pragma mark ===================    LifeCycle   ===================

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(100, 100, 100, 100);
        btn.backgroundColor = UIColor.redColor;
        CLKit_WeakSelf(self);
        [btn cl_addTargerWithAction:^(UIButton *btn) {
//            [weakself cl_openSettingView:SystemSetting_General];
        }];
        [self addSubview:btn];
    }
    return self;
}

#pragma mark ===================    Methods   ===================


#pragma mark ===================    Delegate   ===================


#pragma mark ===================    Private   ===================


#pragma mark ===================    Setter/Getter   ===================


@end
