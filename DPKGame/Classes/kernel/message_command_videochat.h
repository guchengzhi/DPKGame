
#ifndef __MESSAGE_COMMAND_VIDEOCHAT_H__
#define __MESSAGE_COMMAND_VIDEOCHAT_H__

#include "yc_datatypes.h"
#include "yc_defines.h"

//////////////////////////////////////////////////////////////////////////
#pragma pack(1)

typedef struct _tag_HBCMD_VideoChat_UserLogon_Req
{
	uint32  userId;
	uint32  maskCode;
	char    userPwd[PWDLEN];
	uint8   isMobile;
}HBCMD_VideoChat_UserLogon_Req_t;

typedef struct _tag_HBCMD_VideoChat_UserLogon_Resp
{
	int32   errorCode;
	uint32  userId;
	uint32  maskCode;
	char    userName[NAMELEN];
	uint8   vipLevel;
	uint8   playerLevel;
	int64   user_nk;
	int64   user_nb;
}HBCMD_VideoChat_UserLogon_Resp_t;

typedef struct _tag_HBCMD_VideoChat_JoinRoom_Req
{
	uint32 versionId;
	uint32 userId;
	uint32 vcbId;
	char   userPwd[PWDLEN];
	char   vcbPwd[PWDLEN];
	uint8  isHide;
	uint8  isMobile;
}HBCMD_VideoChat_JoinRoom_Req_t;

typedef struct _tag_HBCMD_VideoChat_JoinRoom_Resp
{
	int32  errorCode;
	uint32 versionId;
	uint32 userId;
	uint32 vcbId;
	uint32 vcbCreatorId;
	uint32 opUser01;
	uint32 opUser02;
	uint32 opUser03;
	uint32 opUser04;
	uint32 opUser05;
	uint32 opUser06;
	uint32 roomState;
	char   vcbName[NAMELEN];
	uint8  vcbIsUsedPwd;

	uint8   vipLevel;
	uint8   playerLevel;
	uint8   roomLevel;
	uint32  userRoomState;
	int64   user_nk;
	int64   user_nb;
}HBCMD_VideoChat_JoinRoom_Resp_t;

typedef struct _tag_HBCMD_VideoChat_RoomInfo
{
	int errroCode;
	int runnerId;
    uint32 vcbId;
	uint32 vcbCreatorId;
	uint32 opUser01;
	uint32 opUser02;
	uint32 opUser03;
	uint32 opUser04;
	uint32 opUser05;
	uint32 opUser06;
	uint32 roomState;
	char   vcbName[NAMELEN];
	uint8  vcbIsUsedPwd;

}HBCMD_VideoChat_RoomInfo_t;

typedef struct _tag_HBCMD_VideoChat_RoomNotice
{
	int errorCode;
	int runnerId;
	uint32 vcbId;
	uint16 textLen;
	int8   textIndex;
	char   text[0];
}HBCMD_VideoChat_RoomNotice_t;

typedef struct _tag_HBCMD_VideoChat_GiftRecord
{
	int     errorCode;
	uint32  vcbId;
	uint32  srcId;
	uint32  toId;           //散花用户=0,根据sendType判断
	uint16  giftId;
	uint16  giftNum;
	int8    flyId;
	int8    castMode;
	int8    serverMode;
	uint8   hideMode;       //隐身模式,0-无,1-发送者隐身
	uint8	sendType;       //发送类型,0-普通,1-所有VIP,2-所有主播,3-所有用户
	uint8   textLen;
	char    srcName[NAMELEN];
	char    toName[NAMELEN];
	char    vcbName[NAMELEN];
	char    text[0];
}HBCMD_VideoChat_GiftRecord_t;


typedef struct _tag_HBCMD_VideoChat_RoomUserInfo
{
	uint32  vcbId;
	uint32  userId;
	uint32  userRoomState;    //含城主、城后
	char    userName[NAMELEN];
	uint8   vipLevel;
	uint8   playerLevel;
	uint8   roomLevel;   
	uint8   reserve_01;
	uint32  comeInTime;
	uint32  upMicTime;
	uint32  sealExpiredTime;
	uint16  sealId;
	uint16  carId;
    uint32  starFlag;
	uint16  param_01;     //pubMicIndex,MicGiftId
	uint16  param_02;     //pubMicRemainTime,MicGiftNum
}HBCMD_VideoChat_RoomUserInfo_t;

typedef struct _tag_HBCMD_VideoChat_RoomChatMsg
{
   int     errorCode;
   uint32  vcbId;
   uint32  srcId;
   uint32  toId;        //所有人=0
   int8    chatTypeId;  //消息模式,1-公聊,2-私聊,3-房间公告,4-系统公告,10-小喇叭
   uint16  textLen;
   char    srcName[NAMELEN];
   char    vcbName[NAMELEN];
   char    text[0];
}HBCMD_VideoChat_RoomChatMsg_t;

typedef struct _tag_HBCMD_VideoChat_RoomUpMic_Req
{
	uint32  vcbId;
	uint32  runnerId;
	uint32  userId;
	uint8   micType;   //麦类型:1-公麦,2-管理麦,3-私麦,4-密麦,5-收费麦,6-礼物麦
	uint8   pubMicIndex;
}HBCMD_VideoChat_RoomUpMic_Req_t;

typedef struct _tag_HBCMD_VideoChat_RoomUpMic_Resp
{
	int     errorCode;
	uint32  vcbId;
	uint32  runnerId;
	uint32  userId;
	uint8   micType;
	uint8   pubMicIndex;
}HBCMD_VideoChat_RoomUpMic_Resp_t;

typedef struct _tag_HBCMD_VideoChat_RoomUpMic_Noty
{
	uint32  vcbId;
	uint32  runnerId;
	uint32  userId;
	uint8   micType;
	uint8   pubMicIndex;
	uint8   pubMicRemainTime;
	uint8   reserved_01;
	uint32  userRoomState;
}HBCMD_VideoChat_RoomUpMic_Noty_t;

typedef struct _tag_HBCMD_VideoChat_RoomDownMic_Req
{
	uint32  vcbId;
	uint32  runnerId;
	uint32  userId;
}HBCMD_VideoChat_RoomDownMic_Req_t;

typedef struct _tag_HBCMD_VideoChat_RoomDownMic_Resp
{
	int     errorCode;
	uint32  vcbId;
	uint32  runnerId;
	uint32  userId;
}HBCMD_VideoChat_RoomDownMic_Resp_t;

typedef struct _tag_HBCMD_VideoChat_RoomDownMic_Noty
{
	int     errorCode;
	uint32  vcbId;
	uint32  runnerId;
	uint32  userId;
	uint32  userRoomState;
}HBCMD_VideoChat_RoomDownMic_Noty_t;

typedef struct _tag_HBCMD_VideoChat_ExitRoom_Req
{
	uint32 vcbId;
	uint32 userId;
}HBCMD_VideoChat_ExitRoom_Req_t;

typedef struct _tag_HBCMD_VideoChat_ExitRoom_Resp
{
	int    errorCode;
	uint32 vcbId;
	uint32 userId;
}HBCMD_VideoChat_ExitRoom_Resp_t;

typedef struct _tag_HBCMD_VideoChat_ExitRoom_Noty
{
	uint32 vcbId;
	uint32 userId;
}HBCMD_VideoChat_ExitRoom_Noty_t;

typedef struct _tag_HBCMD_VideoChat_RoomKickUser_Req
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
	uint8 blackMode;  //拉黑模式: 0-无,1-房间拉黑
	uint8 textLen;
    char  text[0];
}HBCMD_VideoChat_RoomKickUser_Req_t;

typedef struct _tag_HBCMD_VideoChat_RoomKickUser_Resp
{
	int errorCode;
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
	uint8 blackMode;  //拉黑模式: 0-无,1-房间拉黑
	uint8 textLen;
	char  text[0];
}HBCMD_VideoChat_RoomKickUser_Resp_t;

typedef struct _tag_HBCMD_VideoChat_RoomKickUser_Noty
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
	uint8 blackMode;  //拉黑模式: 0-无,1-房间拉黑
	uint8 textLen;
	char  text[0];
}HBCMD_VideoChat_RoomKickUser_Noty_t;

typedef struct _tag_HBCMD_VideoChat_SetRoomInfo_Req
{
	int runnerId;
	uint32 vcbId;
	uint32 vcbCreatorId;
	uint32 opUser01;
	uint32 opUser02;
	uint32 opUser03;
	uint32 opUser04;
	uint32 opUser05;
	uint32 opUser06;
	uint32 roomState;
	uint32 setMode;   //组合设置模式, 0-无, 1-修改基本信息, 2-修改密码
	uint8  vcbIsUsedPwd;
	char   vcbName[NAMELEN];
	char   vcbPwd[PWDLEN];
}HBCMD_VideoChat_SetRoomInfo_Req_t;

typedef struct _tag_HBCMD_VideoChat_SetRoomInfo_Resp
{
    int errorCode;
	int runnerId;
	uint32 vcbId;
}HBCMD_VideoChat_SetRoomInfo_Resp_t;

typedef struct _tag_HBCMD_VideoChat_SetRoomNotice_Req
{
	int runnerId;
	uint32 vcbId;
	uint16 textLen;
	int8   textIndex;
	char   text[0];
}HBCMD_VideoChat_SetRoomNotice_Req_t;

typedef struct _tag_HBCMD_VideoChat_SetRoomNotice_Resp
{
	int errorCode;
	int runnerId;
	uint32 vcbId;
}HBCMD_VideoChat_SetRoomNotice_Resp_t;

typedef struct _tag_HBCMD_VideoChat_SetUserInfo_Req
{
    uint32 userId;
	uint32 setMode;
	char   userName[NAMELEN];
	char   userPwd[PWDLEN];
}HBCMD_VideoChat_SetUserInfo_Req_t;

typedef struct _tag_HBCMD_VideoChat_SetUserInfo_Resp
{
	int errorCode;
	uint32 userId;
	char  userName[NAMELEN];
}HBCMD_VideoChat_SetUserInfo_Resp_t;

typedef struct _tag_HBCMD_VideoChat_RoomAddMgr_Req
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
}HBCMD_VideoChat_RoomAddMgr_Req_t;

typedef struct _tag_HBCMD_VideoChat_RoomAddMgr_Resp
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
}HBCMD_VideoChat_RoomAddMgr_Resp_t;

typedef struct _tag_HBCMD_VideoChat_RoomAddMgr_Noty
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
	uint32 userRoomState;
}HBCMD_VideoChat_RoomAddMgr_Noty_t;

typedef struct _tag_HBCMD_VideoChat_RoomDelMgr_Req
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
}HBCMD_VideoChat_RoomDelMgr_Req_t;

typedef struct _tag_HBCMD_VideoChat_RoomDelMgr_Resp
{
	int errorCode;
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
}HBCMD_VideoChat_RoomDelMgr_Resp_t;

typedef struct _tag_HBCMD_VideoChat_RoomDelMgr_Noty
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
	uint32 userRoomState;
}HBCMD_VideoChat_RoomDelMgr_Noty_t;

typedef struct _tag_HBCMD_VideoChat_RoomNB2NK_Req
{
	uint32 vcbId;
	uint32 userId;
	uint32 money;
}HBCMD_VideoChat_RoomNB2NK_Req_t;

typedef struct _tag_HBCMD_VideoChat_RoomNB2NK_Resp
{
   int errorCode;
   uint32 vcbId;
   uint32 userId;
   uint32 money;
}HBCMD_VideoChat_RoomNB2NK_Resp_t;

typedef struct _tag_HBCMD_VideoChat_RoomTransfer_Req
{
	uint32 vcbId;
	uint32 srcId;
	uint32 toId;
	uint32 money;
}HBCMD_VideoChat_RoomTransfer_Req_t;

typedef struct _tag_HBCMD_VideoChat_RoomTransfer_Resp
{
	int errorId;
	uint32 vcbId;
	uint32 srcId;
	uint32 toId;
	uint32 money;
}HBCMD_VideoChat_RoomTransfer_Resp_t;

typedef struct _tag_HBCMD_VideoChat_RoomTransfer_Noty
{
	uint32 vcbId;
	uint32 srcId;
	uint32 toId;
	uint32 money;
}HBCMD_VideoChat_RoomTransfer_Noty_t;

typedef struct _tag_HBCMD_VideoChat_RoomNB2RMB_Req
{
   uint32 vcbId;
   uint32 userId;
   uint32 money;
}HBCMD_VideoChat_RoomNB2RMB_Req_t;

typedef struct _tag_HBCMD_VideoChat_RoomNB2RMB_Resp
{
	int errorCode;
	uint32 vcbId;
	uint32 userId;
	uint32 money;
}HBCMD_VideoChat_RoomNB2RMB_Resp_t;

typedef struct _tag_HBCMD_VideoChat_RoomKeepLive_Req
{
	uint32 vcbId;
	uint32 userId;
}HBCMD_VideoChat_RoomKeepLive_Req_t;

typedef struct _tag_HBCMD_VideoChat_RoomKeepLive_Resp
{
	uint32 vcbId;
	uint32 userId;
}HBCMD_VideoChat_RoomKeepLive_Resp_t;

typedef struct _tag_HBCMD_VideoChat_Lottery_XinYun_Noty
{
	uint32 vcbId;
	uint32 userId;
	uint16 giftId;
	uint32 giftNum;
	uint16 multiple[10];
}HBCMD_VideoChat_Lottery_XinYun_Noty_t;

typedef struct _tag_HBCMD_VideoChat_Lottery_BaoZha_Noty
{
	uint32 vcbId;
	uint32 userId;
	uint16 giftId;
	uint32 giftNum;
	uint16 multiple;
}HBCMD_VideoChat_Lottery_BaoZha_Noty_t;

typedef struct _tag_HBCMD_VideoChat_GetUserAccount_Req
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
}HBCMD_VideoChat_GetUserAccount_Req_t;

typedef struct _tag_HBCMD_VideoChat_GetUserAccount_Resp
{
	int errorCode;
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
    uint64 nk;
	uint64 nb;
}HBCMD_VideoChat_GetUserAccount_Resp_t;

typedef struct _tag_HBCMD_VideoChat_UserAccount_Noty
{
	uint32 vcbId;
	uint32 userId;
	uint64 nk;
	uint64 nb;
}HBCMD_VideoChat_UserAccount_Noty_t;

typedef struct _tag_HBCMD_VideoChat_RoomAddMuteUser_Req
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
}HBCMD_VideoChat_RoomAddMuteUser_Req_t;

typedef struct _tag_HBCMD_VideoChat_RoomAddMuteUser_Resp
{
	int errorCode;
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
}HBCMD_VideoChat_RoomAddMuteUser_Resp_t;

typedef struct tag_HBCMD_VideoChat_RoomAddMuteUser_Noty
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
	uint32 userRoomState;
}HBCMD_VideoChat_RoomAddMuteUser_Noty_t;

typedef struct _tag_HBCMD_VideoChat_RoomDelMuteUser_Req
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
}HBCMD_VideoChat_RoomDelMuteUser_Req_t;

typedef struct _tag_HBCMD_VideoChat_RoomDelMuteUser_Resp
{
	int errorCode;
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
}HBCMD_VideoChat_RoomDelMuteUser_Resp_t;

typedef struct tag_HBCMD_VideoChat_RoomDelMuteUser_Noty
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
	uint32 userRoomState;
}HBCMD_VideoChat_RoomDelMuteUser_Noty_t;

typedef struct tag_HBCMD_VideoChat_RoomAddBlackUser_Req
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
	uint8 blackMode;  //拉黑模式: 0-无,1-房间拉黑 
}HBCMD_VideoChat_RoomAddBlackUser_Req_t;

typedef struct tag_HBCMD_VideoChat_RoomAddBlackUser_Resp
{
	int errorCode;
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
	uint8 blackMode;  
}HBCMD_VideoChat_RoomAddBlackUser_Resp_t;

typedef struct tag_HBCMD_VideoChat_RoomAddBlackUser_Noty
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
	uint8 blackMode;  
}HBCMD_VideoChat_RoomAddBlackUser_Noty_t;

typedef struct tag_HBCMD_VideoChat_RoomDelBlackUser_Req
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
}HBCMD_VideoChat_RoomDelBlackUser_Req_t;

typedef struct _tag_HBCMD_VideoChat_RoomDelBlackUser_Resp
{
	int errorCode;
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
}HBCMD_VideoChat_RoomDelBlackUser_Resp_t;

typedef struct _tag_HBCMD_VideoChat_RoomDelBlackUser_Noty
{
	uint32 vcbId;
	uint32 runnerId;
	uint32 userId;
}HBCMD_VideoChat_RoomDelBlackUser_Noty_t;





#pragma pack()
//////////////////////////////////////////////////////////////////////////

#endif //__MESSAGE_COMMAND_VIDEOCHAT_H__

