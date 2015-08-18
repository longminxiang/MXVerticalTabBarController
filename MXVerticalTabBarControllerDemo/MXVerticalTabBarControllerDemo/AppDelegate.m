//
//  AppDelegate.m
//  MXVerticalTabBarControllerDemo
//
//  Created by longminxiang on 15/8/18.
//  Copyright (c) 2015年 eric. All rights reserved.
//

#import "AppDelegate.h"
#import "MXVerticalTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) MXVerticalTabBarController *tabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self createTabBarController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)createTabBarController
{
    FirstViewController *vc1 = [FirstViewController new];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    nav1.title = @"vc1";
    
    SecondViewController *vc2 = [SecondViewController new];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    nav2.title = @"vc2";
    
    MXVerticalTabBarController *tbc = [MXVerticalTabBarController new];
    tbc.viewControllers = @[nav1, nav2];
    tbc.tabBar.contentEdgeInsets = UIEdgeInsetsMake(64, 0, 0, 0);
    tbc.tabBar.backgroundView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1];
    self.window.rootViewController = tbc;
    self.tabBarController = tbc;
    
    [tbc.tabBar.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        MXTabBarItem *item = obj;
        NSString *nstr = [NSString stringWithFormat:@"tabbar%ld", (long)idx + 1];
        [item setFinishedSelectedImage:[UIImage imageNamed:nstr] withFinishedUnselectedImage:[UIImage imageNamed:nstr]];
        item.selectedTitleAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:71.0f/255.0f green:185.0f/255.0f blue:250.0f/255.0f alpha:1]};
        item.unselectedTitleAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    }];
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
