/*
 *********************************************************************************
 *
 * 用户名:     hcl
 * 文件名:     MYHomePageViewController.m
 * 创建时间:    2020-12-29
 * 作用:       首页
 *********************************************************************************
 */

#import "MYHomePageViewController.h"

@interface
    MYHomePageViewController ()

@end

@implementation MYHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self addRigthButton];
    self.view.backgroundColor = UIColor.redColor;

    //    self.navigationItem.titleView = vc.searchBar;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)addRigthButton {
    CLKit_WeakSelf(self);

    UIBarButtonItem *right = [UIBarButtonItem cl_buttonWithImage:@"Tabbar_HomePage"
                                                          method:^ {

                                                          }];

    self.navigationItem.rightBarButtonItem = right;
}

@end
