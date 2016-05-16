//
//  AppDelegate.m
//  VendingMachine
//
//  Created by David June Kang on 2016. 5. 13..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL) application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    NSLog(@"willFinishLaunchingWithOptions %@ application %@\n", launchOptions, application);
    
    return NO;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //윈도우 객체 생성(UIScreen에서 자동으로 화면사이즈를 가져와서 제한을 한다)
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    //메인VC객체 생성
    MainViewController *mainVC = [[MainViewController alloc] init];
    
    //메인VC배경 색상
    [mainVC.view setBackgroundColor:[UIColor whiteColor]];
    
    //window root로 mainVC설정
    self.window.rootViewController = mainVC;
    
    
    //화면갱신
    [self.window makeKeyAndVisible];
    
    
    NSLog(@"didFinishLaunchingWithOptions%@ application %@\n", launchOptions,application);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"applicationDidEnterBackground : %@\n",application);
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"applicationWillEnterForeground : %@\n",application);
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"applicationDidBecomeActive : %@\n",application);
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"applicationWillTerminate : %@\n",application);
}

@end
