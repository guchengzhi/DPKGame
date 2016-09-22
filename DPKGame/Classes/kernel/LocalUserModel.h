//
//  LocalUserModel.h
//  JInShiDPK
//
//  Created by gu  on 16/8/5.
//  Copyright © 2016年 gu . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalUserModel : NSObject

@property(nonatomic, assign) BOOL isWebLogined;
@property(nonatomic, assign) BOOL isHallLogined;

@property(nonatomic, copy)NSString* strUserLoginName;
@property(nonatomic, assign) int userId;


-(void) reset;
@end
