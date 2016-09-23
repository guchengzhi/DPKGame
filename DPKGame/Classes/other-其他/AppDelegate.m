//
//  AppDelegate.m
//  DPKGame
//
//  Created by 王征 on 16/9/8.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "AppDelegate.h"
#import "DPKTabBarViewController.h"
#import "DPKLoginViewController.h"
#import "DPK_NW_Application.h"

#import "message_command_common.h"
#import "message_defines_command.h"
#import "message_command_dpkgame.h"
#import "message_defines_dpkgame.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    _logonSocketHandler = [[DPKLogonSocketHandler alloc] init];
    
    //test code
    //清零用户信息
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:NO forKey:@"isLogin"];
    [userDefaults synchronize];

    [self appNewSetup];
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

-(void) appNewSetup {
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isLogin = [userDefaults boolForKey:@"isLogin"];
    
    NSLog(@"application:appNewSetup() isLogin=%d", isLogin);
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    //内核数据对象
    DPK_NW_Application* dpkApp =[DPK_NW_Application sharedInstance];
    LocalUserModel* localUserModel =dpkApp.localUserModel;
    [localUserModel reset];
    
    //是否已经登录
    if(!isLogin) {
        DPKLoginViewController *loginVc = [[DPKLoginViewController alloc]init];
        // 设置窗口的根控制器
        self.window.rootViewController = loginVc;
    }
    else {
        DPKTabBarViewController *tabBar = [[DPKTabBarViewController alloc] init];
        // 设置窗口的根控制器
        self.window.rootViewController = tabBar;
        
    }
}

-(void)do_userLogon:(int)isOpenLogonWnd
      UserLogonName:(const char*)userLogonName
       UserLogonPwd:(const char*)userLogonPwd
{
    DPK_NW_Application* dpkApp =[DPK_NW_Application sharedInstance];
    dpkApp.isOpenLogonWnd =isOpenLogonWnd;
    [dpkApp SetLogonEventSink:_logonSocketHandler];
    
    //设置临时登录信息
    TempUserLogonInfo_t* tempUserLogonInfo = [dpkApp GetTempUserLogonInfo];
    memset(tempUserLogonInfo, 0, sizeof(TempUserLogonInfo_t));
    tempUserLogonInfo->userId = 0;
    strcpy(tempUserLogonInfo->userLogonName,userLogonName);
    strcpy(tempUserLogonInfo->userLogonPwd, userLogonPwd);
    tempUserLogonInfo->bIsForceLogon = 1;
    tempUserLogonInfo->bIsMobile = 1;
    tempUserLogonInfo->maskCode = time(0);
    //连接登录服务器
    [dpkApp.logonSocket CloseSocket:0];
    [dpkApp.logonSocket ConnectServer:@"127.0.0.1" ServerPort:3301];
    
}

@end
