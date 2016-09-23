//
//  DPKTCPSocket.m
//  JInShiDPK
//
//  Created by gu  on 16/8/5.
//  Copyright © 2016年 gu . All rights reserved.
//

#import "DPKTCPSocket.h"

@implementation DPKTCPSocket
@synthesize isConnecting;
@synthesize isConnected;

-(id)init
{
    if((self=[super init])) {
        m_nRecvSize =0;
        _socketSink = 0;
        _gameEventSink = 0;
    }
    return self;
}

-(void)SetSocketSink:(id)delegate
{
    _socketSink =delegate;
}

-(void)ConnectServer:(NSString *)ipAddr ServerPort:(int)port
{
    if(_ayncSocket == nil)
    {
        _ayncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    }
    if(self.isConnecting == 1)
        return;
    if(self.isConnected == 1)
        return;
    
    NSError* error= nil;
    [_ayncSocket connectToHost:ipAddr onPort:port withTimeout:2 error:&error];
    NSLog(@"%@", error);
    
    isConnecting =1;
}

-(void)CloseSocket:(int)reasonId
{
    //TODO:
    if(_ayncSocket)
    {
        [_ayncSocket disconnect];
    }
    self.isConnected = 0;
    self.isConnecting = 0;
}

-(void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    NSLog(@"INFO__didConnectToHost");
    
    self.isConnected = 1;
    self.isConnecting = 0;
    //开始接受数据
    [sock readDataWithTimeout:-1 tag: 0];
    
    if(_socketSink)
    {
        [_socketSink OnEventTCPSocketLink:self ErrorID:0];
    }
}

-(void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    //NSLog(@"INFO__didReadData");
    int nRecvLen = [data length];
    if(nRecvLen >0)
    {
        char* pWriteData = m_szRecvBuf + m_nRecvSize;
        [data getBytes:pWriteData length:nRecvLen];
        m_nRecvSize += nRecvLen;
        
        char* p = m_szRecvBuf;
        while(m_nRecvSize >4)
        {
            int msglen =*((int*)p);
            if(msglen <0 || msglen >SOCKET_TCP_BUFFER)
            {
                m_nRecvSize = 0;
                //[sock disconnect];
                return;
            }
            else if(m_nRecvSize < msglen)
                break;
            else{
                if([self HandleMessage:p MessageLength:msglen] == -1)
                {
                    return ;
                }
                m_nRecvSize -= msglen;
                p += msglen;
            }
        }
        if(m_nRecvSize >= SOCKET_TCP_BUFFER)
        {
            m_nRecvSize = 0;
            //[sock disconnect];
            return;
        }
        if( p!= m_szRecvBuf && m_nRecvSize >0)
        {
            memmove(m_szRecvBuf, p, m_nRecvSize);
        }
    }
    
    //继续接受数据
    [sock readDataWithTimeout:-1 tag:0];
}

-(void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    //NSLog(@"发送数据的tag");
}

-(void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err
{
    NSLog(@"INFO__onSocketDidDisconnect, errcode=%i", err.code);
    NSLog(@"%@", err);
    
    if(isConnecting ==1)
    {
        self.isConnecting = 0;
        if(_socketSink)
        {
            [_socketSink OnEventTCPSocketLink:self ErrorID:err.code];
        }
    }
    //
    if(isConnected == 1)
    {
        self.isConnected = 0;
        if(_socketSink)
        {
            [_socketSink OnEventTcpSocketShut:self ReasonCode:err.code];
        }
    }
    
    //断线重连
    //_ayncSocket =nil;
}

-(int)SendData:(int)mainCmd SubCommand:(int)subCmd
{
    char szBuf[128];
    HBNetHead_t* out_msg = (HBNetHead_t *)szBuf;
    out_msg->mainCmd = mainCmd;
    out_msg->subCmd = subCmd;
    out_msg->xcode = 0;
    out_msg->length = sizeof(HBNetHead_t);
    
    if(_ayncSocket != nil)
    {
        NSData* nsData = [[NSData alloc]initWithBytes:szBuf length:out_msg->length];
        [_ayncSocket writeData:nsData withTimeout:0 tag:0];
    }
    
    //[outputStream_ write:(uint8_t*)szBuf maxLength:out_msg->msg_len];
    return 0;
}

-(int)SendData:(int)mainCmd SubCommand:(int)subCmd Data:(char *)pdata DataLength:(int)datalen
{
    char szBuf[SOCKET_TCP_BUFFER];
    HBNetHead_t* out_msg = (HBNetHead_t *)szBuf;
    out_msg->mainCmd = mainCmd;
    out_msg->subCmd = subCmd;
    out_msg->xcode = 0;
    out_msg->length = sizeof(HBNetHead_t) +datalen ;
    if(_ayncSocket != nil)
    {
        NSData* nsData = [[NSData alloc]initWithBytes:szBuf length:out_msg->length];
        [_ayncSocket writeData:nsData withTimeout:0 tag:0];
    }
    
    //[outputStream_ write:(uint8_t*)szBuf maxLength:out_msg->msg_len];
    return 0;
    
}

-(int)HandleMessage:(char *)pdata MessageLength:(int)length
{
    HBNetHead_t* in_msg =(HBNetHead_t*)pdata;
    if(in_msg->length != length || length<sizeof(HBNetHead_t))
    {
        return -1;
    }
    if(in_msg->mainCmd == MXP_MAINCMD_COMMON && in_msg->subCmd == MXP_SUBCMD_COMMON_SERVERPING)
    {
        [self SendData:MXP_MAINCMD_COMMON SubCommand:MXP_SUBCMD_COMMON_CLIENTPING];
    }
    //other message process
    if(_socketSink)
    {
        [_socketSink OnEventTCPSocketRead:self
                              MainCommand:in_msg->mainCmd
                               SubCommand:in_msg->subCmd
                                     Data:in_msg->content
                                  DataLen:in_msg->length
         ];
    }
    return 0;
}

-(void)SetGameEventSink:(id)delegate
{
    _gameEventSink =delegate;
}

-(id)GetGameEventSink
{
    return _gameEventSink;
}

-(int)SendUserLogonReq:(HBCMD_DPKGame_UserLogon_Req_t*)req
{
    if(self.isConnected == 1)
    {
        int nret = [self SendData:MXP_MAINCMD_DPKGAME
                       SubCommand:MXP_SUBCMD_DPKGAME_USERLOGON_REQ
                             Data:(char*)req
                       DataLength:sizeof(HBCMD_DPKGame_UserLogon_Req_t)];
        return 0;
    }
    if(self.isConnecting ==1)
    {
        return -1;
    }
    return -2;
}



@end
