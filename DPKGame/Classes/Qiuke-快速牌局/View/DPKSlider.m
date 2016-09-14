//
//  DPKSlider.m
//  测试
//
//  Created by 王征 on 16/9/14.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKSlider.h"

@implementation DPKSlider

-(CGRect)minimumValueImageRectForBounds:(CGRect)bounds; {
    for(UIView *view in [self subviews]) {
        if ([view isKindOfClass:[UIImageView class]]) {
            view.clipsToBounds = YES;
            view.contentMode = UIViewContentModeBottomLeft;
        }
    }
    return bounds;
}

@end
