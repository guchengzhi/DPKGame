//
//  DPKPaiJuView.h
//  DPKGame
//
//  Created by 王征 on 16/9/21.
//  Copyright © 2016年 王征. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DPKPaiJuModel;

@interface DPKPaiJuView : UIView

+ (instancetype)paiJuView;

@property (nonatomic,strong) DPKPaiJuModel *paiJuModel;

@end
