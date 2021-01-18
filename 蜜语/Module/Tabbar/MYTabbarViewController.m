//
//  MYTabbarViewController.m
//  MiYu
//
//  Created by QiYue on 2021/1/14.
//

#import "MYTabbarViewController.h"
#import "MYNavigationController.h"

#import "MYHomePageViewController.h"
#import "MYLiveViewController.h"
#import "MYFindViewController.h"
#import "MYMessageViewController.h"
#import "MYMeViewController.h"

@interface
    MYTabbarViewController () <UITabBarControllerDelegate>

@end

@implementation MYTabbarViewController

- (instancetype)init {
    self = [super init];
    if( self ) {
        [self customizeInterface];
        [self customizeNavBarInterface];
        [self setupTabBarController];
    }
    return self;
}

- (void)setupTabBarController {
    /// 设置TabBar属性数组
    self.tabBarItemsAttributes = [self tabBarItemsAttributesForController];
    /// 设置控制器数组
    self.viewControllers = [self mpViewControllers];
    self.delegate        = self;
}

//控制器设置
- (NSArray *)mpViewControllers {
    MYHomePageViewController *firstViewController       = [[MYHomePageViewController alloc] init];
    MYNavigationController *  firstNavigationController = [[MYNavigationController alloc] initWithRootViewController:firstViewController];

    MYLiveViewController *  secondViewController       = [[MYLiveViewController alloc] init];
    MYNavigationController *secondNavigationController = [[MYNavigationController alloc] initWithRootViewController:secondViewController];

    MYFindViewController *  thirdViewController       = [[MYFindViewController alloc] init];
    MYNavigationController *thirdNavigationController = [[MYNavigationController alloc] initWithRootViewController:thirdViewController];

    MYMessageViewController *fourthViewController       = [[MYMessageViewController alloc] init];
    MYNavigationController * fourthNavigationController = [[MYNavigationController alloc] initWithRootViewController:fourthViewController];

    MYMeViewController *    fiveViewController       = [[MYMeViewController alloc] init];
    MYNavigationController *fiveNavigationController = [[MYNavigationController alloc] initWithRootViewController:fiveViewController];

    NSArray *viewControllers = @[ firstNavigationController, secondNavigationController, thirdNavigationController, fourthNavigationController, fiveNavigationController ];
    return viewControllers;
}

// TabBar文字跟图标设置
- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
        CYLTabBarItemTitle : @"交友",
        CYLTabBarItemImage : @"Tabbar_HomePage_UnSelect",
        CYLTabBarItemSelectedImage : @"Tabbar_HomePage",
    };
    NSDictionary *secondTabBarItemsAttributes = @{
        CYLTabBarItemTitle : @"直播",
        CYLTabBarItemImage : @"Tabbar_Live_UnSelect",
        CYLTabBarItemSelectedImage : @"Tabbar_Live",
    };
    NSDictionary *thirdTabBarItemsAttributes = @{
        CYLTabBarItemTitle : @"发现",
        CYLTabBarItemImage : @"Tabbar_Find_UnSelect",
        CYLTabBarItemSelectedImage : @"Tabbar_Find",
    };
    NSDictionary *fourthTabBarItemsAttributes = @{
        CYLTabBarItemTitle : @"消息",
        CYLTabBarItemImage : @"Tabbar_Message_UnSelect",
        CYLTabBarItemSelectedImage : @"Tabbar_Message",
    };

    NSDictionary *fiveTabBarItemsAttributes = @{
        CYLTabBarItemTitle : @"我的",
        CYLTabBarItemImage : @"Tabbar_Me_UnSelect",
        CYLTabBarItemSelectedImage : @"Tabbar_Me",
    };

    NSArray *tabBarItemsAttributes = @[ firstTabBarItemsAttributes, secondTabBarItemsAttributes, thirdTabBarItemsAttributes, fourthTabBarItemsAttributes, fiveTabBarItemsAttributes ];
    return tabBarItemsAttributes;
}
- (void)customizeInterface {
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs            = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];

    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs            = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = CLKit_RGBAColor(246, 76, 113, 1);

    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];

    // 设置背景图片
    UITabBar *tabBarAppearance = [UITabBar appearance];
    [tabBarAppearance setBackgroundImage:[UIImage cl_imageWithColor:UIColor.whiteColor]];
    //    [tabBarAppearance setShadowImage:[[UIImage alloc] init]];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)customizeNavBarInterface {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];

    UIImage *     backgroundImage = nil;
    NSDictionary *textAttributes  = nil;

    if( NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1 ) {
        backgroundImage = [UIImage cl_imageWithColor:UIColor.whiteColor];

        textAttributes = @{
            NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
            NSForegroundColorAttributeName : [UIColor blackColor],
        };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage cl_imageWithColor:UIColor.whiteColor];

        textAttributes = @{
            UITextAttributeFont : [UIFont boldSystemFontOfSize:18],
            UITextAttributeTextColor : [UIColor blackColor],
            UITextAttributeTextShadowColor : [UIColor clearColor],
            UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero],
        };
#endif
    }
    //    [navigationBarAppearance setShadowImage:[[UIImage alloc] init]];
    [navigationBarAppearance setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}

#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UINavigationController *)viewController {
    return YES;
}

@end
