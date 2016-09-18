//
//  DPKItemView.m
//  DPKGame
//
//  Created by 王征 on 16/9/18.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKItemView.h"
#import "DPKItemButton.h"
#import "DPKCoverButton.h"

@interface DPKItemView()

@property (nonatomic,strong) DPKCoverButton *coverView;

@end

@implementation DPKItemView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        
        //创建按钮
        [self setupItemButton];
        
        
        
        
        
    }
    return self;
}

- (void)setupItemButton {
    NSArray *imageArr = @[@"tip_menu_1",@"control_menu_1",@"chip_menu_1",@"standup_menu_1",@"back_menu_1",@"exit_menu_1"];
    NSArray *titleArr = @[@"牌型提示",@"房主管理",@"补充记分牌",@"站起围观",@"返回大厅",@"退出牌局"];
  
    
    for (int i = 0; i < 6; i++) {
        DPKItemButton *btn = [[DPKItemButton alloc]init];
        NSString *imageStr = imageArr[i];
        NSString *titleStr = titleArr[i];
        btn.tag = i;
        [btn setTitle:titleStr forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickItemButton:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            [btn setBackgroundImage:[UIImage imageNamed:@"menu_bg_up_1"] forState:UIControlStateNormal];
            
           
            
        }else if (i == 5){
            [btn setBackgroundImage:[UIImage imageNamed:@"menu_bg_bottom_1"] forState:UIControlStateNormal];
            
            
        }else {
            [btn setBackgroundImage:[UIImage imageNamed:@"menu_bg_mid_1"] forState:UIControlStateNormal];
            
        }
        
        
        
        [self  addSubview:btn];
      
    }
    
    //创建遮盖
    [self setupCover];

}

#pragma mark -- 点击项目按钮

- (void)clickItemButton:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(ItemView:didclickButtonType:)]) {
        [self.delegate ItemView:self didclickButtonType:btn.tag];
    }
    
    [self coverClick];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    CGFloat btnW = self.width;
    CGFloat btnH = self.height / count;
   
    CGFloat btnX = 0;
   
    for (int i = 0; i < count; i++) {
        DPKItemButton *btn = self.subviews[i];
        btn.width = btnW;
       
        btn.x = btnX;
        btn.height = btnH;
        btn.y = btnH * i;
       

        
    }
    
    
}

//创建遮盖
- (void)setupCover {
    if (self.coverView) {//有遮盖按钮不需添加
        return;
    }
    
    
    DPKCoverButton *btn = [[DPKCoverButton alloc]init];
    btn.frame = CGRectMake(0, 0, DPKScreenW, DPKScreenH);
    [btn setBackgroundImage:[UIImage imageNamed:@"menu_box"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
    self.coverView = btn;
    [[self containerView] addSubview:btn];
    [btn addSubview:self];
}

//点击背景
- (void)coverClick {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.y = -self.height;
        
    } completion:^(BOOL finished) {
        [self.coverView removeFromSuperview];
        self.coverView = nil;
        [self removeFromSuperview];
    }];
    

    
}

//获取相对于window 的位置
//menuView添加到视图的相对位置
- (CGRect)menuViewOriY {
    CGRect rect = [self convertRect:self.bounds toView:[self containerView]];
    
    return rect;
}



- (UIView *)containerView {
    if (_containerView) {
        return _containerView;
    }else {
        return [UIApplication sharedApplication].keyWindow;
    }
}


@end
