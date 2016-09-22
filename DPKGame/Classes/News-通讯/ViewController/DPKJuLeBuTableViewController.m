//
//  DPKJuLeBuTableViewController.m
//  DPKGame
//
//  Created by 王征 on 16/9/20.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKJuLeBuTableViewController.h"
#import "DPKXinShouCell.h"
#import "DPKGroupChatViewController.h"

@interface DPKJuLeBuTableViewController ()

@end

@implementation DPKJuLeBuTableViewController

static NSString *cellId = @"xinShouCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"俱乐部";
    
    //加载背景图
    UIImageView *img = [[UIImageView alloc]initWithFrame:self.view.bounds];
    img.image = [UIImage imageNamed:@"zhuce_di011_667h"];
    self.tableView.backgroundView = img;
    
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 0;
    
    //self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIBarButtonItem *newsItem = [UIBarButtonItem getRightUIBarButtonItem:@"消息" target:self action:@selector(clickNews)];
    UIBarButtonItem *moreItem = [UIBarButtonItem getRightUIBarButtonItem:@"更多" target:self action:@selector(clickMore)];
    self.navigationItem.rightBarButtonItems = @[moreItem,newsItem];
    
    //注册
  [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DPKXinShouCell class]) bundle:nil] forCellReuseIdentifier:cellId];

}

#pragma mark -- 点击顶部的消息 更多
- (void)clickNews {
    
}

- (void)clickMore {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DPKXinShouCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}



- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @"7个俱乐部";
    lab.width = DPKScreenW;
    lab.height = 30;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.backgroundColor = [UIColor clearColor];
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont systemFontOfSize:14];
    
    return lab;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 30;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DPKGroupChatViewController *groupChatVc = [[DPKGroupChatViewController alloc] init];
    groupChatVc.type = DPKJuLeBu;
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.navigationController pushViewController:groupChatVc animated:YES];
    
    
}


@end
