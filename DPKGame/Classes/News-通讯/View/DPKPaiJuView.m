//
//  DPKPaiJuView.m
//  DPKGame
//
//  Created by 王征 on 16/9/21.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKPaiJuView.h"
#import "DPKPaiJuModel.h"


@interface DPKPaiJuView()

@property (weak, nonatomic) IBOutlet UILabel *paiJuName;
@property (weak, nonatomic) IBOutlet UIButton *paiJuChouMa;

@property (weak, nonatomic) IBOutlet UIButton *paiJuRen;


@property (weak, nonatomic) IBOutlet UIButton *paiJuTime;

@end

@implementation DPKPaiJuView

+ (instancetype)paiJuView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

- (void)setPaiJuModel:(DPKPaiJuModel *)paiJuModel {
    _paiJuModel = paiJuModel;
    
    self.paiJuName.text = paiJuModel.paiJuName;
    [self.paiJuChouMa setTitle:paiJuModel.paiJuChouMa forState:UIControlStateNormal];
    [self.paiJuTime setTitle:paiJuModel.paiJuTime forState:UIControlStateNormal];
#warning 设置牌局的人数
    
}


@end
