//
//  DPKTabBar.m
//  DPKGame
//
//  Created by 王征 on 16/9/10.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKTabBar.h"
#import "DPKNaviController.h"
#import "DPKZhuyeViewController.h"
#import "DPKTabBarViewController.h"

@interface DPKTabBar()

@property (nonatomic,strong) UIButton *publishButton;

@end

@implementation DPKTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 设置tabbar的背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_backGround"]];
        //添加加号按钮
        UIButton *plusBtn = [[UIButton alloc]init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_icon_zhuye_normal"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_icon_zhuye_press"] forState:UIControlStateHighlighted];
        [plusBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        [self addSubview:plusBtn];
        self.publishButton = plusBtn;
        
    }
    
    return self;
}

//按钮的点击
- (void)clickBtn:(UIButton *)button {
    //    WZPublishViewController *vc = [[WZPublishViewController alloc]init];
    
    
//   DPKZhuyeViewController *vc = [[DPKZhuyeViewController alloc]init];
//    DPKNaviController *navi = [[DPKNaviController alloc]initWithRootViewController:vc];
//    
//    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navi animated:YES completion:nil];
  
    if ([self.delegate respondsToSelector:@selector(tabBar:didClickButton:)]) {
        [self.delegate tabBar:self didClickButton:button];
    }
    
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //设置加号按钮的位置
    CGFloat width = self.width;
    CGFloat height = self.height;
    self.publishButton.center = CGPointMake(self.width / 2, self.height / 2-8);
    
    CGFloat btnW = width / 5;
    CGFloat btnH = height;
    
    CGFloat btnY = 0;
    
    //索引
    CGFloat index = 0;
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            //设置宽度
            view.width = btnW;
            view.x = index * btnW;
            view.height = btnH;
            view.y = btnY;
            //增加索引
            index ++;
            if (index == 2) {
                index++;
            }
            
        }
    }
    
}



@end
