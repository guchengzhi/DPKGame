//
//  DPKLoginViewController.m
//  DPKGame
//
//  Created by 王征 on 16/9/18.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKLoginViewController.h"
#import "DPKTextField.h"
#import "DPKZhuCeViewController.h"
#import "DPKNaviController.h"
#import "AppDelegate.h"
#import "DPK_NW_Application.h"
#import <MBProgressHUD.h>
#include "NSString+Common.h"
#import <SVProgressHUD.h>

@interface DPKLoginViewController ()


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak,nonatomic) DPKTextField *pwdTextFiled;
@property (weak, nonatomic) DPKTextField *nameTextFiled;

@end

@implementation DPKLoginViewController

- (void)viewDidLoad {
    NSLog(@"DPKLoginViewController::viewDidLoad()");
    
    [super viewDidLoad];
    
    //添加基本的视图
    [self setBasicView];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"DPKLoginViewController::viewWillDisappear()");
}

-(void)dealloc{
    NSLog(@"DPKLoginViewController:dealloc()");
}

#pragma mark -- 创建基本的视图
- (void)setBasicView {
    //添加顶部的图片
    UIImage *image = [UIImage imageNamed:@"denglu_logo"];
    UIImageView *imgVc = [[UIImageView alloc]initWithImage:image];
    
    imgVc.width = 175;
    imgVc.height = 170;
    imgVc.y = 30;
    imgVc.centerX = DPKScreenW / 2;
    [self.scrollView addSubview:imgVc];
    
    //创建label
    UILabel *addressLab = [[UILabel alloc] init];
    addressLab.text = @"国家/地区 中国";
    addressLab.font = [UIFont systemFontOfSize:14];
    [addressLab sizeToFit];
    addressLab.y = CGRectGetMaxY(imgVc.frame) + 15;
    addressLab.x = (DPKScreenW - 270)*0.5;
    addressLab.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:addressLab];
    
    //创建textFiled
    DPKTextField *nameTextFiled = [[DPKTextField alloc]init];
    nameTextFiled.background = [UIImage imageNamed:@"denglu_shurukuang"];
    nameTextFiled.textColor = [UIColor whiteColor];
    nameTextFiled.placeholder = @"请输入手机号";
    nameTextFiled.font = [UIFont systemFontOfSize:14];
    nameTextFiled.y = CGRectGetMaxY(addressLab.frame)+10;
    nameTextFiled.width = 270;
    nameTextFiled.height = 40;
    nameTextFiled.centerX = DPKScreenW / 2;
    [nameTextFiled setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];

    [self.scrollView addSubview:nameTextFiled];
    self.nameTextFiled = nameTextFiled;
    
    DPKTextField *pwdTextFiled = [[DPKTextField alloc]init];
    pwdTextFiled.background = [UIImage imageNamed:@"denglu_shurukuang"];
    pwdTextFiled.textColor = [UIColor whiteColor];
    pwdTextFiled.placeholder = @"密 码";
    pwdTextFiled.font = [UIFont systemFontOfSize:14];
    pwdTextFiled.y = CGRectGetMaxY(nameTextFiled.frame) +30;
    pwdTextFiled.width = 270;
    pwdTextFiled.height = 40;
   
   
    pwdTextFiled.centerX = DPKScreenW / 2;
    [pwdTextFiled setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    //pwdTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.scrollView addSubview:pwdTextFiled];
    self.pwdTextFiled = pwdTextFiled;
    
    //创建按钮
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setBackgroundImage:[UIImage imageNamed:@"denglu_denglu_normal"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onBtnLogon) forControlEvents:UIControlEventTouchUpInside];
    
    btn.width = 270;
    btn.y = CGRectGetMaxY(pwdTextFiled.frame) + 40;
    btn.height = 40;
    btn.centerX = DPKScreenW / 2;
    [self.scrollView addSubview:btn];
    
    //注册
    UIButton *zhuCeBtn = [[UIButton alloc] init];
    [zhuCeBtn setTitle:@"注册" forState:UIControlStateNormal];
    [zhuCeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    zhuCeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [zhuCeBtn setBackgroundImage:[UIImage imageNamed:@"denglu_zhuce_normal"] forState:UIControlStateNormal];
    [zhuCeBtn addTarget:self action:@selector(clickZhuCeButton) forControlEvents:UIControlEventTouchUpInside];
    zhuCeBtn.width = 270;
    zhuCeBtn.height = 40;
    zhuCeBtn.y = CGRectGetMaxY(btn.frame) + 15;
     zhuCeBtn.centerX = DPKScreenW / 2;
    [self.scrollView addSubview:zhuCeBtn];
    
    //忘记密码 按钮
    UIButton *forgetPwd = [[UIButton alloc]init];
    [forgetPwd setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgetPwd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    forgetPwd.titleLabel.font = [UIFont systemFontOfSize:14];
    forgetPwd.width = 270;
    forgetPwd.y = CGRectGetMaxY(zhuCeBtn.frame) + 20;
    forgetPwd.height = 40;
    forgetPwd.centerX = DPKScreenW / 2;
    
    [self.scrollView addSubview:forgetPwd];
    
    self.scrollView.contentSize = CGSizeMake(0, (CGRectGetMaxY(forgetPwd.frame)+40));
    
}

#pragma mark --点击注册
- (void)clickZhuCeButton {
    DPKZhuCeViewController *zhuCeVc = [[DPKZhuCeViewController alloc]init];
    DPKNaviController *naviVc = [[DPKNaviController alloc]initWithRootViewController:zhuCeVc];
    
    [self presentViewController:naviVc animated:YES completion:nil];
}

#pragma mark --点击登录
-(void)onBtnLogon {
    
    NSString* strUserLogonName = self.nameTextFiled.text;
    NSString* strUserLogonPwd = self.pwdTextFiled.text;
    if([strUserLogonName length] == 0 || [strUserLogonPwd length] == 0)
    {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"账号或密码不能为空" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil];
        [alter show];
        return;
    }
    
    strUserLogonName = [NSString md5:strUserLogonName];
    strUserLogonPwd =[NSString md5:strUserLogonPwd];
    
    const char* account = (const char*)[strUserLogonName cStringUsingEncoding:NSASCIIStringEncoding];
    const char* pwd = (const char*)[strUserLogonPwd cStringUsingEncoding:NSASCIIStringEncoding];
    
    AppDelegate* delegate =(AppDelegate*)([UIApplication sharedApplication].delegate);
    [delegate do_userLogon:1 UserLogonName:account UserLogonPwd:pwd];

    //直接返回首页
    //test code
    //NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //[userDefaults setBool:YES forKey:@"isLogin"];
    //[userDefaults synchronize];
    //重新选择大厅页面
    //AppDelegate* delegate =(AppDelegate*)([UIApplication sharedApplication].delegate);
    //[delegate appNewSetup];

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
