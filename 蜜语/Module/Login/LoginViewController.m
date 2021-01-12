/**
 *********************************************************************************
 *
 * 用户名:     QiYue
 * 文件名:     LoginViewController.m
 * 工程名:     BaseObject
 * 父类:       UIViewController
 * 创建时间:    2020/12/14
 *
 *********************************************************************************
 **/

#import "LoginViewController.h"
#import "LoginView.h"

@interface
                                         LoginViewController ()
@property (nonatomic, strong) LoginView *bgView;
@end

@implementation LoginViewController
#pragma mark ===================    LifeCycle   ===================

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title                = @"登录";
    self.view.backgroundColor = UIColor.whiteColor;
    [self createViews];
}
- (void)createViews {
    [self.view addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
//    CLLogBool([CLPermissionsTools cl_permissionsLocation]);
//    CLLogString(self.cl_GetCacheValue);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
#pragma mark ===================    Methods   ===================

#pragma mark ===================    Delegate   ===================

#pragma mark ===================    Private   ===================

#pragma mark ===================    Setter/Getter   ===================
- (LoginView *)bgView {
    if( ! _bgView ) {
        _bgView = [LoginView new];
    }
    return _bgView;
}

@end
