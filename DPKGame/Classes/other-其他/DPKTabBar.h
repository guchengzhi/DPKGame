//
//  DPKTabBar.h
//  DPKGame
//
//  Created by 王征 on 16/9/10.
//  Copyright © 2016年 王征. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DPKTabBar;
@protocol DPKTabBarDelegate <NSObject>

- (void)tabBar:(DPKTabBar *)tabBar didClickButton:(UIButton *)btn;

@end

@interface DPKTabBar : UITabBar

@property (nonatomic,assign) id<DPKTabBarDelegate> delegate;

@end
