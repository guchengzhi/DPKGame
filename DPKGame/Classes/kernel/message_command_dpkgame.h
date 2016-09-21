//
//  message_command_dpkgame.h
//  DPKGame
//
//  Created by gu  on 16/9/21.
//  Copyright © 2016年 王征. All rights reserved.
//

#ifndef message_command_dpkgame_h
#define message_command_dpkgame_h

#include "yc_datatypes.h"
#include "yc_defines.h"

//////////////////////////////////////////////////////////////////////////
#pragma pack(1)

typedef struct _tag_HBCMD_DPKGame_UserLogon_Req
{
    uint32 userId;
    uint32 maskCode;
    char   userLogonNam[NAMELEN];
    char   userPwd[PWDLEN];
    uint8  isMobile;
    
}HBCMD_DPKGame_UserLogon_Req_t;

typedef  struct _tag_HBCMD_DPKGame_UserLogon_Resp
{
    int32 errorCode;
    
}HBCMD_DPKGame_UserLogon_Resp_t;


#pragma pack()
//////////////////////////////////////////////////////////////////////////

#endif /* message_command_dpkgame_h */
