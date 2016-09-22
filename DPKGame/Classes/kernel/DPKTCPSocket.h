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

@class DPKTCPSocket;

//protocal
@protocol DPKTCPSocketSink <NSObject>

@end



//////////////////////////////////////////////////////////////////////////
@interface DPKTCPSocket : NSObject

@end
