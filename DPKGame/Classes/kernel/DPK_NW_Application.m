//
//  DPK_NW_Application.m
//  JInShiDPK
//
//  Created by gu  on 16/8/4.
//  Copyright © 2016年 gu . All rights reserved.
//

#import "DPK_NW_Application.h"


static DPK_NW_Application* DPKApp_ShareObj =nil;

@implementation DPK_NW_Application


+(DPK_NW_Application*) sharedInstance
{
    NSLog(@"DPK_NW_Application:sharedInstance");
    @synchronized(self) {
        if(DPKApp_ShareObj ==nil) {
            DPKApp_ShareObj =[[self alloc] init];
            [DPKApp_ShareObj myInit];
        }
    }
    return DPKApp_ShareObj;
}

+(void) destoryInstance {
    //nothing abcd
}

-(void)myInit {
    self.localUserModel =[[LocalUserModel alloc]init];
}

@end
