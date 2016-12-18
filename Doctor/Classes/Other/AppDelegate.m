//
//  AppDelegate.m
//  Doctor
//
//  Created by 范超 on 16/12/17.
//
//

#import "AppDelegate.h"
#import "IWUserLoginViewController.h"
#import "IWUserTool.h"
#import "IWUser.h"
#import "IWTabBarViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) IWTabBarViewController *tabBar;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    IWUserLoginViewController *login = [[IWUserLoginViewController alloc] init];
    IWUser *user = [IWUserTool user];
    if (user) {
        self.tabBar = [[IWTabBarViewController alloc] init];
        self.tabBar.user = user;
        self.window.rootViewController = self.tabBar;
    } else {
        self.window.rootViewController = login;
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end