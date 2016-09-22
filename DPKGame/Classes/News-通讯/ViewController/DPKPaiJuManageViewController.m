//
//  DPKPaiJuManageViewController.m
//  DPKGame
//
//  Created by 王征 on 16/9/21.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKPaiJuManageViewController.h"
#import "DPKPaiJuView.h"
#import "DPKPaiJuViewController.h"
#import "DPKNaviController.h"
#import "DPKPaiJuModel.h"
#import "DPKGameViewController.h"

@interface DPKPaiJuManageViewController ()
/**第一个按钮*/
@property (nonatomic,strong) UIButton *firstBtn;

/**所有的view*/
@property (nonatomic,strong) NSMutableArray *allViewButtonArr;

@end

@implementation DPKPaiJuManageViewController

- (NSMutableArray *)allViewButtonArr {
    if (!_allViewButtonArr) {
        _allViewButtonArr = [NSMutableArray array];
    }
    return _allViewButtonArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"牌局";
    
    //设置按钮
    [self setupView];
    
   
}


- (void)setupView {
    [self.allViewButtonArr removeAllObjects];
    for (NSInteger i = 0; i < self.paiJuArr.count+1; i++) {
        if (i == 0) {
            self.firstBtn = [[UIButton alloc] init];
            [self.firstBtn setImage:[UIImage imageNamed:@"chat_game_sng_zhuozi"] forState:UIControlStateNormal];
            [self.firstBtn addTarget:self action:@selector(clickAddPaiJu) forControlEvents:UIControlEventTouchUpInside];
            [self.allViewButtonArr addObject:self.firstBtn];
        }else {
            DPKPaiJuView *paiJuView = [DPKPaiJuView paiJuView];
            paiJuView.paiJuModel = self.paiJuArr[i-1];
            
            [self.allViewButtonArr addObject:paiJuView];
            
        }
        
    }
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    //[self.allViewButtonArr removeAllObjects];
        CGFloat btnW = DPKPaiJuWidth;
        CGFloat btnH = DPKPaiJuHeight;
    //最大的列数
    NSInteger maxCols = 2;
    CGFloat btnY = DPKPaiJuMargin;
    CGFloat margin = (DPKScreenW - btnW*2)/(maxCols+1);
    
    for (NSInteger i = 0; i < self.allViewButtonArr.count; i++) {
        UIView *btnView = self.allViewButtonArr[i];
        NSInteger col = i % maxCols;
        NSInteger row = i / maxCols;
        btnView.x = col *(btnW+margin)+margin;
        btnView.y = row *(btnH +btnY) + btnY;
        btnView.width = btnW;
        btnView.height = btnH;
        
        [self.view addSubview:btnView];
        
    }

    
}

#pragma mark -- 创建牌局
- (void)clickAddPaiJu {
    
     __block typeof(self)weakSelf = self;
    
     DPKPaiJuViewController *paiJuVc = [[DPKPaiJuViewController alloc]init];
    paiJuVc.type = weakSelf.type;
    paiJuVc.block = ^(DPKPaiJuModel *paiJuModel){
        [weakSelf.paiJuArr addObject:paiJuModel];
        [weakSelf setupView];
        [weakSelf.view setNeedsLayout];
        
        weakSelf.manageBlock(weakSelf.paiJuArr);
        //跳转界面
        DPKGameViewController *gameVc = [[DPKGameViewController alloc] init];
        
        [weakSelf presentViewController:gameVc animated:YES completion:nil];
    };
    DPKNaviController *navi = [[DPKNaviController alloc]initWithRootViewController:paiJuVc];
    [self presentViewController:navi animated:YES completion:nil];
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
