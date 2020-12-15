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

@property (nonatomic , strong) CLTextField *userTextField;

@property (nonatomic , strong) CLTextField *pswTextField;

@end

@implementation LoginView

#pragma mark ===================    LifeCycle   ===================

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self clKitAddSubViews:@[self.userTextField,self.pswTextField]];
        
        [self.userTextField makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.centerY).offset(-10);
            make.left.equalTo(self).offset(60);
            make.right.equalTo(self).offset(-60);
            make.height.equalTo(40);
        }];

        [self.pswTextField makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userTextField.bottom).offset(10);
            make.left.right.height.equalTo(self.userTextField);
        }];

    }
    return self;
}

#pragma mark ===================    Methods   ===================


#pragma mark ===================    Delegate   ===================


#pragma mark ===================    Private   ===================


#pragma mark ===================    Setter/Getter   ===================
- (CLTextField *)userTextField
{
    if (!_userTextField) {
        _userTextField = [CLTextField new];
        _userTextField.placeholder = @"  请输入用户名";
        [_userTextField clKitSetBordersWithColor:UIColor.lightGrayColor andCornerRadius:20 andWidth:1];
    }
    return _userTextField;
}
- (CLTextField *)pswTextField
{
    if (!_pswTextField) {
        _pswTextField = [CLTextField new];
        _pswTextField.placeholder = @"  请输入密码";
        _pswTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        [_pswTextField clKitSetBordersWithColor:UIColor.lightGrayColor andCornerRadius:20 andWidth:1];
    }
    return _pswTextField;
}

@end
