//
//  DPKChatButton.m
//  DPKGame
//
//  Created by 王征 on 16/9/17.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKChatButton.h"

@implementation DPKChatButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
         self.titleLabel.font = [UIFont systemFontOfSize:14];
        
    }
    
    return self;
}

- (void)awakeFromNib {
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    //self.titleLabel.backgroundColor = [UIColor yellowColor];
    self.titleLabel.numberOfLines = 0;
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    
//    self.titleLabel.frame = self.frame;
//}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    
    [self sizeToFit];
}

@end
