//
//  DPKPaiJuViewController.h
//  DPKGame
//
//  Created by 王征 on 16/9/13.
//  Copyright © 2016年 王征. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DPKPaiJuModel;
typedef void(^PaiJuBlock)(DPKPaiJuModel *paiJuModel);

@interface DPKPaiJuViewController : UITableViewController

@property (nonatomic,copy) PaiJuBlock block;

/**样式*/
@property (nonatomic,strong) NSString *type;

@end
