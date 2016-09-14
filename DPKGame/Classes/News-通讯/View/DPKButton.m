//
//  DPKButton.m
//  DPKGame
//
//  Created by 王征 on 16/9/13.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKButton.h"

@implementation DPKButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textColor = [UIColor whiteColor];
        
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //调整图片的位置
    self.imageView.x = 10;
    self.imageView.y = 10;
    self.imageView.width = 31;
    self.imageView.height = 26;
    
    /**
     *  设置labeld的位置
     */
    //self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height + 15;
    self.titleLabel.width = self.width;
    self.titleLabel.centerX = self.imageView.centerX;
    //self.titleLabel.height = self.height - self.imageView.height;
    self.titleLabel.textAlignment =  NSTextAlignmentCenter;
    
    
    
}

@end
