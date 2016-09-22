//
//  DPKKaiJuChatButton.m
//  DPKGame
//
//  Created by 王征 on 16/9/21.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKKaiJuChatButton.h"

@implementation DPKKaiJuChatButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
}

- (void)layoutSubviews {
    [super layoutSubviews];
   
   
}


@end
