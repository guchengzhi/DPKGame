//
//  UIBarButtonItem+Common.h
//  DPKGame
//
//  Created by 王征 on 16/9/14.
//  Copyright © 2016年 王征. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Common)

/**图片创建（图片宽高的一半）*/
+(UIBarButtonItem *)getUIBarButtonItem:(UIImage *)image target:(id)target action:(SEL)action;

/**以图片的原大小创建*/
+(UIBarButtonItem *)getOtherUIBarButtonItem:(UIImage *)image target:(id)target action:(SEL)action;

/**以文字创建*/
+(UIBarButtonItem *)getRightUIBarButtonItem:(NSString *)title target:(id)target action:(SEL)action;

/**以文字创建自定义文字的颜色*/
+(UIBarButtonItem *)getColorUIBarButtonItem:(NSString *)title color:(UIColor *)color target:(id)target action:(SEL)action;

@end
