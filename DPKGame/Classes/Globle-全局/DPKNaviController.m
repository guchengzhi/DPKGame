//
//  DPKNaviController.m
//  DPKGame
//
//  Created by 王征 on 16/9/10.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKNaviController.h"

@interface DPKNaviController ()

@end

@implementation DPKNaviController

/**
 *  统一设置导航栏的状态
 */
+ (void)initialize {
    //拿到整体的bar
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"nav_top"] forBarMetrics:UIBarMetricsDefault];
    //设置导航栏中间字体的颜色
    [bar setTitleTextAttributes:@{NSFontAttributeName :[UIFont boldSystemFontOfSize:20],NSForegroundColorAttributeName :DPKGRGBColor(171, 122, 49)}];
    
    //设置item
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    //设置正常情况下导航栏上按钮的样式
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    [item setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
    
    //设置按钮不可用状态下的样式
    NSMutableDictionary *itemDisabledAttrs = [NSMutableDictionary dictionary];
    itemDisabledAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:itemDisabledAttrs forState:UIControlStateDisabled];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
