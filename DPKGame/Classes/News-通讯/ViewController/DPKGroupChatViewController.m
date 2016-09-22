//
//  DPKGroupChatViewController.m
//  DPKGame
//
//  Created by 王征 on 16/9/20.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKGroupChatViewController.h"
#import "DPKPaiJuViewController.h"
#import "DPKNaviController.h"
#import "DPKJuLeBuDetailTableViewController.h"
#import "DPKStartButton.h"
#import "DPKKaiJuChatCell.h"
#import "DPKPaiJuModel.h"
#import "DPKGameViewController.h"
#import "DPKPaiJuManageViewController.h"



@interface DPKGroupChatViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstant;



/**存放牌局的数组*/
@property (nonatomic,strong) NSMutableArray *paiJuModelArr;

/**开始按钮*/
@property (nonatomic,weak) DPKStartButton *startBtn;

/**开具按钮*/
@property (nonatomic,weak) UIButton *kaiJuBtn;

@end
 static NSString *chatCellId = @"chatCellId";

@implementation DPKGroupChatViewController

- (NSMutableArray *)paiJuModelArr {
    if (!_paiJuModelArr) {
        _paiJuModelArr = [NSMutableArray array];
    }
    return _paiJuModelArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem getRightUIBarButtonItem:@"详情" target:self action:@selector(clikDetailItem)];
    
    
    
    //创建进行时按钮
    DPKStartButton *startBtn = [[DPKStartButton alloc]init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"chat_game_jxz"] forState:UIControlStateNormal];
    startBtn.width = startBtn.currentBackgroundImage.size.width;
    startBtn.height = startBtn.currentBackgroundImage.size.height;
    [startBtn addTarget:self action:@selector(clickJinXinButton) forControlEvents:UIControlEventTouchUpInside];
    startBtn.x = DPKScreenW -startBtn.width-5;
    startBtn.y =10;
    startBtn.hidden = YES;
    //设置进行中按钮的数字
    [startBtn setTitle:@"1" forState:UIControlStateNormal];
    [self.view addSubview:startBtn];
    self.startBtn = startBtn;
    
    
    //创建开局按钮
    UIButton *kaiJuBtn = [[UIButton alloc]init];
    [kaiJuBtn setBackgroundImage:[UIImage imageNamed:@"chat_game_begin"] forState:UIControlStateNormal];

    kaiJuBtn.width = kaiJuBtn.currentBackgroundImage.size.width;
    kaiJuBtn.height = kaiJuBtn.currentBackgroundImage.size.height;
    kaiJuBtn.x = DPKScreenW -kaiJuBtn.width-5;
    kaiJuBtn.y =10;
    [kaiJuBtn addTarget:self action:@selector(kaiJu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:kaiJuBtn];
    self.kaiJuBtn = kaiJuBtn;
    
    //监听键盘尺寸的改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KeyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(exitKeyBorad)];
    tap.cancelsTouchesInView = NO;
    
    [self.tableView addGestureRecognizer:tap];
   self.tableView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(kaiJuBtn.frame), 0, 0, 0);
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DPKKaiJuChatCell class]) bundle:nil] forCellReuseIdentifier:chatCellId];
    
    
}

#pragma mark -- 开具进入游戏
- (void)kaiJu {
   __block typeof(self)weakSelf = self;
   DPKPaiJuViewController *paiJuVc = [[DPKPaiJuViewController alloc]init];
    paiJuVc.block = ^(DPKPaiJuModel *paiJuModel){
        
//        weakSelf.paiJuModel = paiJuModel;
      
    
        [weakSelf.paiJuModelArr addObject:paiJuModel];
        weakSelf.kaiJuBtn.hidden = YES;
        weakSelf.startBtn.hidden = NO;
        
        [weakSelf.tableView reloadData];
        
        //跳转界面
        DPKGameViewController *gameVc = [[DPKGameViewController alloc] init];
        
        [weakSelf presentViewController:gameVc animated:YES completion:nil];
    };
    
    paiJuVc.type = self.type;
    DPKNaviController *navi = [[DPKNaviController alloc]initWithRootViewController:paiJuVc];
    [self presentViewController:navi animated:YES completion:nil];
}

#pragma mark -- 点击进行时按钮
- (void)clickJinXinButton {
    
    DPKPaiJuManageViewController *manageVc = [[DPKPaiJuManageViewController alloc]init];
        
    
    manageVc.manageBlock = ^(NSMutableArray *paiJuArr){
        self.paiJuModelArr = paiJuArr;
        [self.tableView reloadData];
    };
    manageVc.type = self.type;
    manageVc.paiJuArr = self.paiJuModelArr;
    [self.navigationController pushViewController:manageVc animated:YES];
    
}

#pragma mark -- 点击手势退出键盘
- (void)exitKeyBorad {
    [self.view endEditing:YES];
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
        
        self.bottomConstant.constant = DPKScreenH - keyY;
        
        
        [self.view layoutIfNeeded];
        
    }];
}


#pragma mark -- tableViewData

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *str = [NSString stringWithFormat:@"%zd",self.paiJuModelArr.count];
    [self.startBtn setTitle:str forState:UIControlStateNormal];
    return self.paiJuModelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DPKKaiJuChatCell *cell = [tableView dequeueReusableCellWithIdentifier:chatCellId];
    DPKPaiJuModel *paijuModel = self.paiJuModelArr.count== 0 ? nil : [self.paiJuModelArr objectAtIndex:indexPath.row];
    cell.paiJuModel = paijuModel;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 106;
}





#pragma mark -- 点击详情
- (void)clikDetailItem {
    DPKJuLeBuDetailTableViewController *detailVc = [[DPKJuLeBuDetailTableViewController alloc]init];
    [self.navigationController pushViewController:detailVc animated:YES];
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
