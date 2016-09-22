//
//  DPKGameViewController.m
//  DPKGame
//
//  Created by 王征 on 16/9/17.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKGameViewController.h"
#import "DPKIconView.h"
#import "NirKxMenu.h"
#import "DPKItemView.h"
#import "DPKRightViewController.h"
#import "DPKZhuyeViewController.h"
#import "DPKTabBarViewController.h"
#import "DPKNaviController.h"

@interface DPKGameViewController ()<DPKItemViewDelegate>

@property (nonatomic,strong) UIView *iconView;

//所有的按钮
@property (nonatomic,strong) NSMutableArray *allButtonArr;

//创建一个Window
@property (nonatomic,strong) UIWindow *window;

//背景图
@property (nonatomic,weak) UIView *bgView;

@end


@implementation DPKGameViewController



- (NSMutableArray *)allButtonArr {
    if (!_allButtonArr) {
        _allButtonArr = [NSMutableArray array];
    }
    
    return _allButtonArr;
}

- (UIView *)iconView {
    if (!_iconView) {
        _iconView = [DPKIconView iconView];
        [self.view addSubview:_iconView];
    }
    return _iconView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //中间的开始按钮
    UIButton *startBtn = [[UIButton alloc]init];
    startBtn.center = self.view.center;
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    startBtn.backgroundColor = [UIColor darkGrayColor];
    startBtn.tag = 100;
    startBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    startBtn.width = 70;
    startBtn.height = 25;
    startBtn.layer.cornerRadius = 5;
    startBtn.layer.masksToBounds = YES;
    [self.view addSubview:startBtn];
    //创建顶部的按钮
    [self setupTopButton];
    
    //创建按钮
    [self setupButton];
    
}

//创建顶部的按钮
- (void)setupTopButton {
    //左边的按钮
    UIButton * leftButton = [[UIButton alloc]init];
    [leftButton setImage:[UIImage imageNamed:@"icon_menu_1"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(clickLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    CGSize size =  leftButton.currentImage.size;
    leftButton.width = size.width*0.4;
    leftButton.height = size.height*0.4;
    leftButton.tag = 101;
    leftButton.x = 10;
    leftButton.y = 20;
    [self.view addSubview:leftButton];
    
    //右边的按钮
    UIButton *rightBtn = [[UIButton alloc]init];
    [rightBtn addTarget:self action:@selector(clickRightButton:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setImage:[UIImage imageNamed:@"icon_record_1"] forState:UIControlStateNormal];
    CGSize rightSize = rightBtn.currentImage.size;
    rightBtn.width = size.width*0.4;
    rightBtn.height = size.height*0.4;
    rightBtn.tag = 102;
    
    rightBtn.x = DPKScreenW - 10 -rightSize.width*0.4;
    rightBtn.y = 15;
    [self.view addSubview:rightBtn];
    
    
    
    
}
                                                                                   
#pragma mark -- 点击左边的
- (void)clickLeftButton:(UIButton *)btn {
   
    DPKItemView *itemView = [[DPKItemView alloc]initWithFrame:CGRectMake(0, -360, 150, 360)];
    itemView.delegate = self;
    [UIView animateWithDuration:0.25 animations:^{
        itemView.y = 0;
    }];
    itemView.containerView = self.view;
                                                                                       
}

#pragma mark -- 点击项目
- (void)ItemView:(DPKItemView *)itemView didclickButtonType:(DPKItemButtonType)type {
    switch (type) {
        case DPKItemButtonTypePaiXing:{//牌型提示
            
            
        }
            
            break;
        case DPKItemButtonTypeFangzhu:{//房主管理
            
        }
            break;
        case DPKItemButtonTypeJiFen:{//补充计分牌
            
            
        }
            break;
        case DPKItemButtonTypeWeiGuan:{//站起来围观
           
            if (_iconView == nil) {
                
                return;
            }
            [self.iconView removeFromSuperview];
            self.iconView = nil;
            [self setupButton];
            
        }
            break;
        case DPKItemButtonTypeFanHui:{//返回大厅
            
      
            [self dismissViewControllerAnimated:YES completion:nil];
         
            
           
        }
            break;
        case DPKItemButtonTypeExitPaiJu:{//退出牌局
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
            
        
    }
}




                                                                                   
#pragma mark -- 点击右边的按钮
- (void)clickRightButton:(UIButton *)btn {
    
    //创建一个新窗口
    UIWindow *window =[[UIWindow alloc]initWithFrame:CGRectMake(DPKScreenW, 0, DPKScreenW / 4 *3, DPKScreenH)];
    window.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.7];
    window.hidden = NO;
    window.windowLevel = UIWindowLevelNormal;
    //呈现并显示
    [window makeKeyAndVisible];
    DPKRightViewController *rightVc = [[DPKRightViewController alloc] init];
    window.rootViewController = rightVc;
    self.window = window;
    
    //设置背景阴影
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(DPKScreenW, 0.0, DPKScreenW, DPKScreenH)];
   
    [UIView animateWithDuration:0.25 animations:^{
        
        [window setFrame:CGRectMake(DPKScreenW -DPKScreenW /6 *5, 0.0, DPKScreenW / 6 *5, DPKScreenH)];
        
        [bgView setFrame:self.view.bounds];
    }];
    bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
   
    //手势点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [bgView addGestureRecognizer:tap];
    [self.view addSubview:bgView];
    self.bgView = bgView;
                                                                                       
    
}

//点击手势
- (void)tapAction {
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.alpha = 0;
        [self.window setFrame:CGRectMake(DPKScreenW, 0.0, DPKScreenW / 6 * 5, DPKScreenH)];
        [self.bgView setFrame:CGRectMake(DPKScreenW, 0.0, DPKScreenW, DPKScreenH)];
    } completion:^(BOOL finished) {
        [self.bgView removeFromSuperview];
        [self.window resignKeyWindow];
        self.window = nil;
        self.bgView = nil;
    }];
}

//创建按钮
- (void)setupButton {
  
    for (int i = 0; i < 9; i++) {
        UIButton *btn = [[UIButton alloc]init];
        btn.width = 40;
        btn.height = 40;
        
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.backgroundColor = [UIColor darkGrayColor];
        [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.cornerRadius = 20;
        btn.layer.masksToBounds = YES;
        [btn setTitle:@"坐下" forState:UIControlStateNormal];
        
        if (i == 0) {
            btn.x = 60;
            btn.y = 60;
        }else if (i == 1){
            btn.x = DPKScreenW - 110;
            btn.y = 60;
        }else if (i %2 == 0 && i != 8){
            btn.x = 20;
            btn.y = 150 + (i-2)*50;
        }else if (i== 8){
            btn.centerX = DPKScreenW/2;
            btn.y = DPKScreenH -150;
          
        }else {
            btn.x = DPKScreenW -60;
            btn.y = 150 + (i-3)*50;
        }
        
        [self.allButtonArr addObject:btn];
        
        [self.view addSubview:btn];
        
    }
    
}


//点击按钮的事件
- (void)clickButton:(UIButton *)btn {
    
    
    for (UIView *btnView in self.view.subviews) {
        if ([btnView isKindOfClass:[UIButton class]] && btnView.tag != 100 && btnView.tag != 101 && btnView.tag != 102) {
           
            [UIView animateWithDuration:1 animations:^{
                
                btnView.x = btn.x;
                btnView.y = btn.y;
                
            }];
            
            //[btnView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.2];

            [btnView removeFromSuperview];
        }
    }
  
    self.iconView.centerX = btn.centerX;
    self.iconView.y = btn.y;
    
    [UIView animateWithDuration:1 animations:^{
        
        self.iconView.centerX = DPKScreenW /2;
        self.iconView.y = DPKScreenH - 150;
    }];
    
    
    
    
    
}



@end
