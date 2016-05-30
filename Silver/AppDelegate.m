//
//  AppDelegate.m
//  Silver
//
//  Created by Kai on 16/5/28.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    HomeViewController*home=[[HomeViewController alloc]init];
    ExploreViewController*explore=[[ExploreViewController alloc]init];
    MeViewController*me=[[MeViewController alloc]init];
    
    UINavigationController*homeNavi=[[UINavigationController alloc]initWithRootViewController:home];
    UINavigationController*exploreNavi=[[UINavigationController alloc]initWithRootViewController:explore];
    UINavigationController*meNavi=[[UINavigationController alloc]initWithRootViewController:me];
    homeNavi.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"Tab_Home_N"] selectedImage:[UIImage imageNamed:@"Tab_Home_P"]];
    
    exploreNavi.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"Tab_Product_N"] selectedImage:[UIImage imageNamed:@"Tab_Product_P"]];
    
    meNavi.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"我" image:[UIImage imageNamed:@"Tab_User_N"] selectedImage:[UIImage imageNamed:@"Tab_User_P"]];
    UITabBarController*tab=[[UITabBarController alloc]init];
    tab.viewControllers=@[homeNavi,exploreNavi,meNavi];
     tab.tabBar.tintColor=[UIColor colorWithRed:255.0/255.0 green:124.0/255.0 blue:56.0/255.0 alpha:1.0];
    tab.selectedIndex=0;
    self.window.rootViewController=tab;
    [self.window makeKeyAndVisible];
    [UIApplication sharedApplication].statusBarHidden=YES;
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
    
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
