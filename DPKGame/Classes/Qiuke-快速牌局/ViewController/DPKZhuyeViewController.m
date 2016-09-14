//
//  DPKZhuyeViewController.m
//  DPKGame
//
//  Created by 王征 on 16/9/11.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKZhuyeViewController.h"
#import "DPKQuikeCell.h"
#import "DPKPaiJuViewController.h"
#import "DPKNaviController.h"

@interface DPKZhuyeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DPKZhuyeViewController
    static NSString *quickCellId = @"quickCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"快速牌局";
    
//    UISlider *slider = [[UISlider alloc]init];
//    
//    [slider setThumbImage:[UIImage imageNamed:@"chouma_icon"] forState:UIControlStateNormal];
//    
//    //[slider setValue:[UIImage imageNamed:@"chouma_icon"] forKeyPath:@"currentThumbImage"];
//   
//    [self.view addSubview:slider];
    
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DPKQuikeCell class]) bundle:nil] forCellReuseIdentifier:quickCellId];
    
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DPKQuikeCell *cell = [tableView dequeueReusableCellWithIdentifier:quickCellId];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//     [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -- 组建牌局

- (IBAction)creatPaiJu:(UIButton *)sender {
    
    DPKPaiJuViewController *paijuVc = [[DPKPaiJuViewController alloc]init];
    DPKNaviController *navi = [[DPKNaviController alloc]initWithRootViewController:paijuVc];
    
    [self presentViewController:navi animated:YES completion:nil];
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
