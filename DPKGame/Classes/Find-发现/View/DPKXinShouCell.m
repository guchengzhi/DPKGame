//
//  DPKXinShouCell.m
//  DPKGame
//
//  Created by 王征 on 16/9/12.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKXinShouCell.h"

@implementation DPKXinShouCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.iconImage.layer.cornerRadius = 25;
    self.iconImage.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.iconImage.layer.borderWidth = 1;
    
    [self.iconImage.layer masksToBounds];
    
    self.backgroundColor = [UIColor colorWithRed:19/255.0 green:24/255.0 blue:30/255.0 alpha:0.3];
    
    
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
