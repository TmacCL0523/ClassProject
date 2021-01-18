//
//  MYFindViewController.m
//  MiYu
//
//  Created by QiYue on 2021/1/14.
//

#import "MYFindViewController.h"

@interface
    MYFindViewController ()

@end

@implementation MYFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发现";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.view.backgroundColor = UIColor.redColor;
}

- (void)viewWillAppear:(BOOL)animated {
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
}

@end
