//
//  DPK_NW_Application.h
//  JInShiDPK
//
//  Created by gu  on 16/8/4.
//  Copyright © 2016年 gu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocalUserModel.h"

@interface DPK_NW_Application : NSObject


@property(nonatomic, strong)LocalUserModel * localUserModel;


+(DPK_NW_Application*) sharedInstance;
+(void) destoryInstance;

@end
