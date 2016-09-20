//
//  DPKFinishZhuCeViewController.m
//  DPKGame
//
//  Created by 王征 on 16/9/19.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKFinishZhuCeViewController.h"
#import "DPKTabBarViewController.h"

@interface DPKFinishZhuCeViewController ()

@end

@implementation DPKFinishZhuCeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"注册";
}

//点击注册完成
- (IBAction)clickFinishZhuCe:(UIButton *)sender {
    
    DPKTabBarViewController *tabVc = [[DPKTabBarViewController alloc]init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = tabVc;
    
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
