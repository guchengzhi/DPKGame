//
//  DPK_NW_Application.h
//  JInShiDPK
//
//  Created by gu  on 16/8/4.
//  Copyright © 2016年 gu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocalUserModel.h"
#import "DPKTCPSocket.h"


typedef struct _tag_TempUserLogonInfo
{
    uint32  userId;
    uint32  maskCode;
    char    userLogonName[NAMELEN];
    char    userLogonPwd[PWDLEN];
    int8    bIsMobile;
    int8    bIsForceLogon;
}TempUserLogonInfo_t;

//////////////////////////////////////////////////////////////////////
@interface DPK_NW_Application : NSObject<DPKTCPSocketSink>
{
    TempUserLogonInfo_t tempLogonInfo;   //临时登录信息
}

@property(nonatomic, strong)LocalUserModel* localUserModel;  //本地用户信息
@property(nonatomic, strong)DPKTCPSocket* hallSocket;  //大厅连接socket
@property(nonatomic, strong)DPKTCPSocket* logonSocket;  //登录连接socket
@property(nonatomic, assign)int isOpenLogonWnd;         //是否打开了登录窗口


+(DPK_NW_Application*) sharedInstance;
+(void) destoryInstance;

-(int) SetHallEventSink:(id)delegate;
-(int) SetLogonEventSink:(id)delegate;
-(TempUserLogonInfo_t*) GetTempUserLogonInfo;


@end
