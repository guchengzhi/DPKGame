//
//  DPKChatViewController.m
//  DPKGame
//
//  Created by 王征 on 16/9/17.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKChatViewController.h"
#import "DPKChatButton.h"
#import "DPKGameViewController.h"


@interface DPKChatViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewConstraint;
@property (weak, nonatomic) IBOutlet DPKChatButton *btn;

@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;




@end

@implementation DPKChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //监听键盘尺寸的改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KeyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    NSString *str = [NSString stringWithFormat:@"邀请码\n829851\n点击分享"];
    [self.btn setTitle:str forState:UIControlStateNormal];
    
    self.leftLabel.layer.cornerRadius = 5;
    self.rightLabel.layer.cornerRadius = 5;
    self.leftLabel.layer.masksToBounds = YES;
    self.rightLabel.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 键盘尺寸的改变
- (void)KeyboardWillChange:(NSNotification *)noti {
    NSDictionary *userInfo = noti.userInfo;
    //动画的时间
    double duration = [userInfo[ UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //键盘的frame值
    CGRect keyboardF = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    //键盘的y值
    CGFloat keyY = keyboardF.origin.y;
    
    
    
    [UIView animateWithDuration:duration   animations:^{
        
        self.bottomConstraint.constant = DPKScreenH - keyY;
        
        self.topViewConstraint.constant = - self.bottomConstraint.constant;
        
        [self.view layoutIfNeeded];
        
    }];
}



//开始游戏
- (IBAction)beginGame:(UIButton *)sender {
    
    DPKGameViewController *gameVc = [[DPKGameViewController alloc]init];
    
    [self presentViewController:gameVc animated:YES completion:nil];
    
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
