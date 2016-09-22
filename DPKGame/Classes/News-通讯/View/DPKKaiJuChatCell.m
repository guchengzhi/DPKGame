//
//  DPKKaiJuChatCell.m
//  DPKGame
//
//  Created by 王征 on 16/9/21.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKKaiJuChatCell.h"
#import "DPKPaiJuModel.h"

@interface DPKKaiJuChatCell()

@property (weak, nonatomic) IBOutlet UILabel *paiJuName;

@property (weak, nonatomic) IBOutlet UIButton *paiJuTime;

@property (weak, nonatomic) IBOutlet UIButton *chouMaLab;



@end

@implementation DPKKaiJuChatCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPaiJuModel:(DPKPaiJuModel *)paiJuModel {
    _paiJuModel = paiJuModel;
    
    self.paiJuName.text = paiJuModel.paiJuName;
    [self.paiJuTime setTitle:paiJuModel.paiJuTime forState:UIControlStateNormal];
    [self.chouMaLab setTitle:paiJuModel.paiJuChouMa forState:UIControlStateNormal];
}

@end
