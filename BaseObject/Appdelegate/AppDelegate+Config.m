

#import "AppDelegate+Config.h"
#import "LoginViewController.h"

@implementation AppDelegate (Config)

-(void)rootViewController
{
    self.customWindos = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.customWindos.rootViewController =  [[UINavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
    [self.customWindos makeKeyAndVisible];
}


@end
