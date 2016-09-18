//
//  DPKIconView.m
//  DPKGame
//
//  Created by 王征 on 16/9/17.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKIconView.h"

@implementation DPKIconView

+ (instancetype)iconView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    
}


@end
