//
//  DPKNewsCell.m
//  DPKGame
//
//  Created by 王征 on 16/9/13.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKNewsCell.h"

@implementation DPKNewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
     self.backgroundColor = DPKBGColor(19, 24, 30, 0.3);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
