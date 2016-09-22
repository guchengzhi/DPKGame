//
//  LocalUserModel.m
//  JInShiDPK
//
//  Created by gu  on 16/8/5.
//  Copyright © 2016年 gu . All rights reserved.
//

#import "LocalUserModel.h"

@implementation LocalUserModel


-(void)reset {
    self.isWebLogined = NO;
    self.isHallLogined = NO;
    self.strUserLoginName =@"";
    self.userId = 0;
    
}
@end
