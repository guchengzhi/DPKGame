//
//  DPKTCPSocket.h
//  JInShiDPK
//
//  Created by gu  on 16/8/5.
//  Copyright © 2016年 gu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"
#import "message_command_common.h"
#import "message_defines_command.h"
#import "message_command_dpkgame.h"
#import "message_defines_dpkgame.h"


#define SOCKET_TCP_BUFFER 16384
#define SOCKET_TCP_BUFFER_MAXSIZE SOCKET_TCP_BUFFER*10

@class DPKTCPSocket;

//protocal
@protocol DPKTCPSocketSink <NSObject>
-(void)OnEventTCPSocketLink:(DPKTCPSocket*)sock ErrorID:(int)error_code;
-(void)OnEventTcpSocketShut:(DPKTCPSocket*)sock ReasonCode:(int)reason_code;
-(void)OnEventTCPSocketRead:(DPKTCPSocket*)sock MainCommand:(int)main_cmd SubCommand:(int)sub_cmd Data:(char*)data DataLen:(int)data_len;

@end

//////////////////////////////////////////////////////////////////////////
@protocol DPKGameEventSink <NSObject>

@required
-(void)OnEventTCpSocketLink:(int)error_id;
-(void)OnEventTcpSocketShut:(int)reason_id;

@optional
-(void)OnEventGame_UserLogonResp:(int)user_id Data:(void*) data;

@end


//////////////////////////////////////////////////////////////////////////
@interface DPKTCPSocket : NSObject
{
    GCDAsyncSocket* _ayncSocket;
    __weak id<DPKTCPSocketSink> _socketSink;
    __weak id<DPKGameEventSink> _gameEventSink;
    int m_nRecvSize;
    char m_szRecvBuf[SOCKET_TCP_BUFFER_MAXSIZE];
}
@property(nonatomic, assign) int isConnecting;
@property(nonatomic,assign) int isConnected;

-(void)ConnectServer:(NSString*)ipAddr ServerPort:(int)port;
-(int)HandleMessage:(char*)pdata MessageLength:(int)length;
-(int)SendData:(int)mainCmd SubCommand:(int)subCmd;
-(int)SendData:(int)mainCmd SubCommand:(int)subCmd Data:(char*)pdata DataLength:(int)datalen;
-(void)SetSocketSink:(id)delegate;
-(void)CloseSocket:(int)reasonId;
-(void)SetGameEventSink:(id)delegate;
-(id)GetGameEventSink;

//发送登陆请求
-(int)SendUserLogonReq:(HBCMD_DPKGame_UserLogon_Req_t*)req;


@end
