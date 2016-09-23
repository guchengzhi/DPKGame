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
    uint32 userId;
    uint32 maskCode;
    char   userLogonName[NAMELEN];
    char   userHeadPic[URLLEN];
    char   isMobile;
    char   ngender;
    uint8   gameviplevel;
    int32  nGlodMoney;
    int32  nDiamondMoney;
    
}HBCMD_DPKGame_UserLogon_Resp_t;

typedef struct _tag_HBCMD_DPKGame_ClubInfo
{
    uint32  clubId;
    uint32  ownerId;
    char    clubName[NAMELEN];
    char    clubHeadPic[URLLEN];
    int8    clubType;
    int16   regionId;
    int16   nseats;
    int16   nUserCount;
    uint32  createTime;
    
}HBCMD_DPKGame_ClubInfo_t;

typedef struct _tag_HBCMD_DPKGame_GameInfo
{
    uint32   gameId;
    uint32   clubId;
    uint32   ownerId;
    uint32   createTime;
    uint32   leftTime;
    uint16   sb;
    uint16   bb;
    uint16   buylimit;
    uint16   timelimit;
    int8     userLimit;
    int8     gameStatus;
    int8     GameType;
    int8     insuranceMode;
}HBCMD_DPKGame_GameInfo_t;

typedef struct _tag_HBCMD_DPKGame_ClubUserInfo
{
    uint32 userId;
    uint32 clubId;
    char   userLogonName[NAMELEN];
    char   userHeadPic[URLLEN];
    char   ngender;
    uint8  gameviplevel;
    uint8  clubmgrlevel;
}HBCMD_DPKGame_ClubUserInfo_t;

typedef struct _tag_HBCMD_DPKGame_GameUserInfo
{
    
}HBCMD_DPKGame_GameUserInfo_t;

typedef struct _tag_HBCMD_DPKGame_CreateClub_Req
{
    uint32  ownerId;
    char    clubName[NAMELEN];
    char    clubHeadPic[URLLEN];
    int8    clubType;
    int16   regionId;
    int16   nseats;
}HBCMD_DPKGame_CreateClub_Req_t;

typedef struct _tag_HBCMD_DPKGame_CreateClub_Resp
{
    int32   errorCode;
    uint32  clubId;
    uint32  ownerId;
    char    clubName[NAMELEN];
    char    clubHeadPic[URLLEN];
    int8    clubType;
    int16   regionId;
    int16   nseats;
    int16   nUserCount;
    uint32  createTime;
}HBCMD_DPKGame_CreateClub_Resp_t;

typedef struct _tag_HBCMD_DPKGame_DelClub_Req
{
    uint32  clubId;
    uint32  runnerId;
}HBCMD_DPKGame_DelClub_Req_t;

typedef struct _tag_HBCMD_DPKGame_DelClub_Resp
{
    int errorCode;
    uint32  clubId;
    uint32  runnerId;
}HBCMD_DPKGame_DelClub_Resp_t;

typedef struct _tag_HBCMD_DPKGame_CreateGame_Req
{
    uint32   clubId;
    uint32   ownerId;
    uint32   leftTime;
    uint16   sb;
    uint16   bb;
    uint16   buylimit;
    uint16   timelimit;
    int8     userLimit;
    int8     insuranceMode;
}HBCMD_DPKGame_CreateGame_Req_t;

typedef struct _tag_HBCMD_DPKGame_CreateGame_Resp
{
    int errorCode;
    uint32   gameId;
    uint32   UUID;
    uint32   clubId;
    uint32   ownerId;
    uint32   createTime;
    uint32   leftTime;
    uint16   sb;
    uint16   bb;
    uint16   buylimit;
    uint16   timelimit;
    int8     userLimit;
    int8     gameStatus;
    int8     GameType;
    int8     insuranceMode;
}HBCMD_DPKGame_CreateGame_Resp_t;








#pragma pack()
//////////////////////////////////////////////////////////////////////////

#endif /* message_command_dpkgame_h */
