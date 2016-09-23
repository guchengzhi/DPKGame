//
//  AppDelegate.h
//  DPKGame
//
//  Created by 王征 on 16/9/8.
//  Copyright © 2016年 王征. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPKLoginViewController.h"
#import "DPKLogonSocketHandler.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) DPKLogonSocketHandler* logonSocketHandler;

-(void)appNewSetup;
-(void)do_userLogon:(int)isOpenLogonWnd
      UserLogonName:(const char*)userLogonName
       UserLogonPwd:(const char*)userLogonPwd;

@end

