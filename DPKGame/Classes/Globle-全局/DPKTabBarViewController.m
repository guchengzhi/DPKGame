//
//  DPKTabBarViewController.m
//  DPKGame
//
//  Created by 王征 on 16/9/10.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKTabBarViewController.h"
#import "DPKFindViewController.h"
#import "DPKMeViewController.h"
#import "DPKNewsViewController.h"
#import "DPKResultViewController.h"
#import "DPKNaviController.h"
#import "DPKTabBar.h"
#import "DPKZhuyeViewController.h"

@interface DPKTabBarViewController ()<DPKTabBarDelegate>

@end

@implementation DPKTabBarViewController

+ (void)initialize
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    dic[NSForegroundColorAttributeName] = DPKGRGBColor(171, 122, 49);
    
    NSMutableDictionary *selectedDic = [NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    dic[NSForegroundColorAttributeName] = DPKGRGBColor(171, 122, 49);

    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedDic forState:UIControlStateSelected];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //发现
    
    [self setupChildVc:[[DPKFindViewController alloc]init] title:@"发现" imageName:@"tabbar_icon_faxian_normal" selectedImageName:@"tabbar_icon_faxian_press"];
    
    /**
     *  通讯
     */
    [self setupChildVc:[[DPKNewsViewController alloc]init] title:@"通讯" imageName:@"tabbar_icon_liaotian_normal" selectedImageName:@"tabbar_icon_liaotian_press"];
    

    /**
     *  战绩
     */
    [self setupChildVc:[[DPKResultViewController alloc]init] title:@"战绩" imageName:@"tabbar_icon_zhanji_normal" selectedImageName:@"tabbar_icon_zhanji_press"];
    
    /**
     *  我
     */
    [self setupChildVc:[[DPKMeViewController alloc]init] title:@"我" imageName:@"tabbar_icon_wo_normal" selectedImageName:@"tabbar_icon_wo_press"];
    
    DPKTabBar *tabBar = [[DPKTabBar alloc]init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
   
    [self tabBar:tabBar didClickButton:nil];
    
}



/**
 *  初始化控制器
 */

- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    
    //设置图片和文字
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    /**
     *  为每一个控制器添加导航控制器
     */
    DPKNaviController *navi = [[DPKNaviController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:navi];
    
}


#pragma mark --- tabbar的代理方法

- (void)tabBar:(DPKTabBar *)tabBar didClickButton:(UIButton *)btn {
    
        /**快速创建牌局*/
        DPKZhuyeViewController *vc = [[DPKZhuyeViewController alloc]init];
        DPKNaviController *navi = [[DPKNaviController alloc]initWithRootViewController:vc];
    
        [self addChildViewController:navi];
    
        self.selectedIndex = self.childViewControllers.count -1;
   
}

@end
