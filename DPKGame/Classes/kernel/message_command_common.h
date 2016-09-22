
#ifndef __MESSAGE_COMMAND_COMMON_H__
#define __MESSAGE_COMMAND_COMMON_H__

#include "yc_datatypes.h"

#define MAX_HB_MESSAGE_SIZE   16*1024

//////////////////////////////////////////////////////////////////////////
#pragma pack(1)

//12 bytes
typedef struct _tag_HBNetHead {
	uint32 length;
	uint16 mainCmd;
	uint16 subCmd;
	uint32 xcode;
	char   content[0];
}HBNetHead_t;

typedef struct _tag_HBCMD_COMMON_ClientHello
{
	int32 a;
	int32 b;
	int32 c;
	int32 d;
}HBCMD_COMMON_ClientHello_t;

typedef struct _tag_HBCMD_COMMON_ServerPing
{

}HBCMD_COMMON_ServerPing_t;

typedef struct  _tag_HBCMD_COMMON_ClientPing
{

}HBCMD_COMMON_ClientPing_t;

#pragma pack()
//////////////////////////////////////////////////////////////////////////

#endif //__MESSAGE_COMMAND_COMMON_H__


