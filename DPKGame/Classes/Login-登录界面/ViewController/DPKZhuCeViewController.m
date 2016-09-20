//
//  DPKZhuCeViewController.m
//  DPKGame
//
//  Created by 王征 on 16/9/19.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKZhuCeViewController.h"
#import "DPKTextField.h"
#import "DPKGetYanZhenViewController.h"

@interface DPKZhuCeViewController ()
@property (weak, nonatomic) IBOutlet DPKTextField *textFeild;

@end

@implementation DPKZhuCeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"注册";
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    btn.frame=CGRectMake(0, 0, 60, 44);
    
    btn.titleLabel.font=[UIFont boldSystemFontOfSize:14];
    btn.titleLabel.textAlignment=NSTextAlignmentRight;
    [btn setTitleColor:DPKGRGBColor(171, 138, 71) forState:UIControlStateNormal];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    [btn addTarget:self
            action:@selector(cancel)
  forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]
                             initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
    [self.textFeild setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    
    
}

//取消
- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//获取验证码
- (IBAction)ClickGetYanZhen:(UIButton *)sender {
    
    DPKGetYanZhenViewController *yanzhenVc = [[DPKGetYanZhenViewController alloc]init];
    [self.navigationController pushViewController:yanzhenVc animated:YES];
    
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
