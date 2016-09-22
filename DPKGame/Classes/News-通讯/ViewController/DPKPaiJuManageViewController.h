//
//  DPKPaiJuManageViewController.h
//  DPKGame
//
//  Created by 王征 on 16/9/21.
//  Copyright © 2016年 王征. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PaiJuManageBlock)(NSMutableArray *paiJuArr);

@interface DPKPaiJuManageViewController : UIViewController

/**牌局数组*/
@property (nonatomic,strong) NSMutableArray *paiJuArr;

@property (nonatomic,strong) NSString *type;

//block传值
@property (nonatomic,copy)PaiJuManageBlock manageBlock;

@end
