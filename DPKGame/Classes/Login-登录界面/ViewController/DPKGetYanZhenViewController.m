//
//  DPKGetYanZhenViewController.m
//  DPKGame
//
//  Created by 王征 on 16/9/19.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKGetYanZhenViewController.h"
#import "DPKFinishZhuCeViewController.h"

@interface DPKGetYanZhenViewController ()

@end

@implementation DPKGetYanZhenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"获取验证码";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)next:(UIButton *)sender {
    
    DPKFinishZhuCeViewController *finishVc = [[DPKFinishZhuCeViewController alloc]init];
    
    [self.navigationController pushViewController:finishVc animated:YES];
    
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
