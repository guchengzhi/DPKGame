
#ifndef __YC_COMM_DEFINES_HH__20130906__
#define __YC_COMM_DEFINES_HH__20130906__


///////////////////////////////////////////////////////
#define MD5LEN        32
#define PWDLEN        64
#define NAMELEN       32
#define NAMELEN2      64
#define URLLEN        64
#define URLLEN4       256
#define IPADDRLEN     32
#define GIFTTEXTLEN   64
#define GATEADDRLEN   128
#define MEDIAADDRLEN  128
#define DEVICENAMELEN 128
#define BIRTHLEN      32
#define ERRORLEN      32
#define T128LEN       128
#define T1024LEN      1024
#define T2048LEN      2048
#define T4096LEN      4096
#define PAIMAI_MAXSIZE  2000
///////////////////////////////////////////////////////

#define LLNB_SOCKET_RECVBUFFER_MAXSIZE   4096*10



//ע��: ���ֵΪ2^4= 16,����ʱ����
enum {
	RoomMgrType_Null      = 0,    //û��
	RoomMgrType_Fangzhu   = 1,    //����
	RoomMgrType_FuFangzhu = 2,    //������
	RoomMgrType_Guan      = 3,    //����
	RoomMgrType_LinGuan   = 4,    //�ٹ�
	RoomMgrType_Quzhang   = 5,    //����
	RoomMgrType_Daili    = 6,    //�����
	RoomMgrType_Quzhang2  = 7,    //������
	RoomMgrType_FuQuzhang = 8,    //������
	RoomMgrType_FuQuzhang2  = 9,  //��������
	RoomMgrType_ZengsongLinGuan   = 10, //ĳЩ�ȼ��������Ѵ󻧶��⸽���Ĺ����־,�������Ĺ�����ٹܲ�һ��,ֻ�Ǿ߱�����ĳЩ����Ȩ��,
	                                    //����ʲô����Ȩ��,����������������
	RoomMgrType_Quzhang_zhuli = 11, //��������
	RoomMgrType_Quzhang_zhuli2 = 12, //����������
};
#endif //__YC_COMM_DEFINES_HH__20130906__

