//
//  DPKStartButton.m
//  DPKGame
//
//  Created by 王征 on 16/9/21.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKStartButton.h"

@implementation DPKStartButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
         [self setBackgroundImage:[UIImage imageNamed:@"chat_game_jxz"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        
        
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.centerX = self.currentBackgroundImage.size.width *0.5;
    self.titleLabel.height = 15;
    self.titleLabel.y = self.currentBackgroundImage.size.height - self.titleLabel.height;
    
}
@end
