//
//  DPKLogonSocketHandler.m
//  DPKGame
//
//  Created by gu  on 16/9/23.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKLogonSocketHandler.h"

@implementation DPKLogonSocketHandler


-(void)OnEventTCpSocketLink:(int)error_id
{
    NSLog(@"DPKLogonSocketHandler:OnEventTCpSocketLink() error_id=%d", error_id);
    NSLog(@"LogonSvr连接失败!");
}

-(void)OnEventTcpSocketShut:(int)reason_id
{
    NSLog(@"DPKLogonSocketHandler:OnEventTcpSocketShut() error_id=%d", reason_id);
    NSLog(@"LogonSvr连接断开!");
}

-(void)OnEventGame_UserLogonResp:(int)user_id Data:(void*) data
{
    NSLog(@"DPKLogonSocketHandler::OnEventGame_UserLogonResp()");
    
}

@end
