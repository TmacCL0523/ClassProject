//
//  MYNavigationController.m
//  MiYu
//
//  Created by QiYue on 2021/1/14.
//

#import "MYNavigationController.h"

@interface
    MYNavigationController ()

@end

@implementation MYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    CLLogString(@"重写");
    if( self.viewControllers.count > 0 ) {
        //第二级则隐藏底部Tab
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
