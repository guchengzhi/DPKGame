//
//  DPK_NW_Application.m
//  JInShiDPK
//
//  Created by gu  on 16/8/4.
//  Copyright © 2016年 gu . All rights reserved.
//

#import "DPK_NW_Application.h"


static DPK_NW_Application* DPKApp_ShareObj =nil;

@implementation DPK_NW_Application


+(DPK_NW_Application*) sharedInstance
{
    NSLog(@"DPK_NW_Application:sharedInstance");
    @synchronized(self) {
        if(DPKApp_ShareObj ==nil) {
            DPKApp_ShareObj =[[self alloc] init];
            [DPKApp_ShareObj myInit];
        }
    }
    return DPKApp_ShareObj;
}

+(void) destoryInstance {
    //nothing abcd
}

-(void)myInit {
    self.localUserModel =[[LocalUserModel alloc]init];
    self.hallSocket =[[DPKTCPSocket alloc]init];
    [self.hallSocket SetSocketSink:self];
    self.logonSocket =[[DPKTCPSocket alloc]init];
    [self.logonSocket SetSocketSink:self];
    
    memset(&tempLogonInfo, 0, sizeof(tempLogonInfo));
    _isOpenLogonWnd =0;
    
}

-(int) SetHallEventSink:(id)delegate
{
    if(self.hallSocket == nil)
        return -1;
    [self.hallSocket SetGameEventSink:delegate];
    return 0;
}

-(int) SetLogonEventSink:(id)delegate
{
    if(self.logonSocket == nil)
        return -1;
    [self.logonSocket SetGameEventSink:delegate];
    return 0;
}

-(TempUserLogonInfo_t*) GetTempUserLogonInfo
{
    return &tempLogonInfo;
}


-(void)OnEventTCPSocketLink:(DPKTCPSocket*)sock ErrorID:(int)error_code
{
    if(error_code == 0) {
        //发送握手数据
        HBCMD_COMMON_ClientHello_t clientHello;
        memset(&clientHello, 0, sizeof(HBCMD_COMMON_ClientHello_t));
        clientHello.a = 101;
        clientHello.b = 202;
        clientHello.c = 303;
        clientHello.d = 404;
        [sock SendData:MXP_MAINCMD_COMMON
            SubCommand:MXP_SUBCMD_COMMON_CLIENT_HELLO
                  Data:(char*)&clientHello
            DataLength:sizeof(HBCMD_COMMON_ClientHello_t)];
    
        NSLog(@"服务器连接成功,发送握手数据");
    }
    //通知GameEvent处理
    __strong id delegate =[sock GetGameEventSink];
    if(delegate != nil) {
        [delegate OnEventTCpSocketLink:error_code];
    }
}

-(void)OnEventTcpSocketShut:(DPKTCPSocket*)sock ReasonCode:(int)reason_code
{
    NSLog(@"服务器断开！");
    //通知GameEvent处理
    __strong id delegate =[sock GetGameEventSink];
    if(delegate !=nil) {
        [delegate OnEventTcpSocketShut:reason_code];
    }
}

-(void)OnEventTCPSocketRead:(DPKTCPSocket*)sock
                MainCommand:(int)main_cmd
                 SubCommand:(int)sub_cmd
                       Data:(char*)data
                    DataLen:(int)data_len
{
    NSLog(@"收到网络消息");
    if(main_cmd == MXP_MAINCMD_DPKGAME)
    {
        switch (sub_cmd) {
            case MXP_SUBCMD_DPKGAME_USERLOGON_RESP:
            {
                HBCMD_DPKGame_UserLogon_Resp_t* pResp =(HBCMD_DPKGame_UserLogon_Resp_t*)data;
                //通知GameEvent处理
                __strong id delegate =[sock GetGameEventSink];
                if(delegate != nil) {
                    [delegate OnEventGame_UserLogonResp:pResp->userId Data:pResp];
                }
                
            }
                break;
                
            default:
                NSLog(@"收到未处理的 sub_cmd 消息");
                break;
        }
    }
    else {
        NSLog(@"收到未处理的 main_cmd 消息");
    }
    
}


@end
