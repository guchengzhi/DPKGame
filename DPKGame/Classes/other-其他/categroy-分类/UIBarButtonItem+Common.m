//
//  UIBarButtonItem+Common.m
//  DPKGame
//
//  Created by 王征 on 16/9/14.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "UIBarButtonItem+Common.h"

@implementation UIBarButtonItem (Common)

+(UIBarButtonItem *)getUIBarButtonItem:(UIImage *)image target:(id)target action:(SEL)action{
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    [leftButton setBackgroundImage:image
                          forState:UIControlStateNormal];
    
    [leftButton addTarget:target
                   action:action
         forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]
                             initWithCustomView:leftButton];
    
    return item;
    
}

+(UIBarButtonItem *)getOtherUIBarButtonItem:(UIImage *)image target:(id)target action:(SEL)action{
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [leftButton setBackgroundImage:image
                          forState:UIControlStateNormal];
    
    [leftButton addTarget:target
                   action:action
         forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]
                             initWithCustomView:leftButton];
    
    return item;
    
}






+(UIBarButtonItem *)getRightUIBarButtonItem:(NSString *)title target:(id)target action:(SEL)action{
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.frame=CGRectMake(0, 0, 60, 44);
    
    btn.titleLabel.font=[UIFont boldSystemFontOfSize:14];
    btn.titleLabel.textAlignment=NSTextAlignmentRight;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    
    [btn addTarget:target
            action:action
  forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]
                             initWithCustomView:btn];
    
    return item;
    
}

+(UIBarButtonItem *)getColorUIBarButtonItem:(NSString *)title color:(UIColor *)color target:(id)target action:(SEL)action{
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.frame=CGRectMake(0, 0, 60, 44);
    btn.titleLabel.textAlignment=NSTextAlignmentRight;
    btn.titleLabel.font=[UIFont boldSystemFontOfSize:14];
    [btn setTitleColor:color forState:UIControlStateNormal];
    
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [btn addTarget:target
            action:action
  forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]
                             initWithCustomView:btn];
    
    return item;
    
}




@end
