//
//  DPKTCPSocket.h
//  JInShiDPK
//
//  Created by gu  on 16/8/5.
//  Copyright © 2016年 gu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"
#import "msg_defines.h"
#import "msg_commands.h"

@class DPKTCPSocket;

//protocal
@protocol DPKTCPSocketSink <NSObject>

@end



//////////////////////////////////////////////////////////////////////////
@interface DPKTCPSocket : NSObject

@end
