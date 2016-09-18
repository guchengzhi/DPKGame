//
//  DPKItemButton.m
//  DPKGame
//
//  Created by 王征 on 16/9/18.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKItemButton.h"

@implementation DPKItemButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.width = 25;
    self.imageView.height = 25;
    self.imageView.x = 15;
    
    self.imageView.centerY =self.titleLabel.centerY;
}

@end
