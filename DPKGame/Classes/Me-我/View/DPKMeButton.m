//
//  DPKMeButton.m
//  DPKGame
//
//  Created by 王征 on 16/9/20.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKMeButton.h"

@implementation DPKMeButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return self;
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    
 
    self.imageView.width = 106;
    self.imageView.height = 77;
    self.imageView.x = 5;
    self.imageView.y = 5;
    
    //self.titleLabel.y = self.height - CGRectGetMaxY(self.imageView.frame)-5;
    
    self.titleLabel.centerX = self.imageView.centerX;
    self.titleLabel.centerY = self.imageView.centerY +30;
    self.titleLabel.width = self.width;
    
    
    
    
    
}

@end
