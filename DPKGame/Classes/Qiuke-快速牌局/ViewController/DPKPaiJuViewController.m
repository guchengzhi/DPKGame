//
//  DPKPaiJuViewController.m
//  DPKGame
//
//  Created by 王征 on 16/9/13.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKPaiJuViewController.h"
#import "DPKBottomView.h"
#import "DPKSlider.h"
#import "DPKChatViewController.h"
#import "DPKTabBarViewController.h"
#import "DPKPaiJuModel.h"

@interface DPKPaiJuViewController ()<DPKBottomViewDelegate>

@property (strong, nonatomic) IBOutlet UITableViewCell *cell1;

@property (strong, nonatomic) IBOutlet UITableViewCell *cell2;

@property (strong, nonatomic) IBOutlet UITableViewCell *cell4;

@property (strong, nonatomic) IBOutlet UITableViewCell *cell5;

@property (weak, nonatomic) IBOutlet UISlider *slider;
//分池购买和快速购买按钮
@property (weak, nonatomic) IBOutlet UIButton *selButton;

//存放label的数组

@property (nonatomic,strong) NSMutableArray *arr;

//牌局的名字
@property (weak, nonatomic) IBOutlet UITextField *paiJuName;

/**筹码*/
@property (weak, nonatomic) IBOutlet UILabel *chouMaLab;

///**牌局创建的时长*/
//@property (nonatomic,strong) NSString *time;


@end

@implementation DPKPaiJuViewController


- (NSMutableArray *)arr {
    if (!_arr) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"建立牌局";
    
    //创建左边的顶部按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem getColorUIBarButtonItem:@"取消" color:DPKGRGBColor(171, 122, 49) target:self action:@selector(clickButton)];
    
    //加载背景图
    UIImageView *img = [[UIImageView alloc]initWithFrame:self.view.bounds];
    img.image = [UIImage imageNamed:@"zhuce_di011_667h"];
    self.tableView.backgroundView = img;
    
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 0;
    
    self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    
    //添加底部的bottomView
    
    DPKBottomView *bottomView = [[DPKBottomView alloc]initWithFrame:CGRectMake(0, 0, DPKScreenW, 200)];
    bottomView.delegate =self;
    self.tableView.tableFooterView = bottomView;
    
    
    //设置slider
    [self.slider setThumbImage:[UIImage imageNamed:@"chouma_icon"] forState:UIControlStateNormal];
    
    //设置划过的颜色
    [self.slider setMinimumTrackImage:[UIImage imageNamed:@"chouma02"] forState:UIControlStateNormal];
    
    //设置未划过的颜色
    [self.slider setMaximumTrackImage:[UIImage imageNamed:@"chouma01"] forState:UIControlStateNormal];
    
    //添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(exitKeyBorad)];
    tap.cancelsTouchesInView = NO;
    
    [self.tableView addGestureRecognizer:tap];
}

#pragma mark -- 点击手势退出键盘
- (void)exitKeyBorad {
    [self.view endEditing:YES];
}



- (IBAction)switchButton:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}

//点击保险模式
- (IBAction)baoxianButton:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    self.selButton.enabled = sender.selected;
    
}

//点击分池购买或快速购买
- (IBAction)clickSelButton:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
}


- (void)clickButton {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 1;
    }else if (section == 2){
        return 2;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return _cell1;
    }else if (indexPath.section == 1){
        return _cell2;
    }else if (indexPath.section == 2){
        if (indexPath.row == 0 ) {
            return _cell4;
        }else {
            return _cell5;
        }
    }
    
  
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 44;
    }else if(indexPath.section == 1){
        return 161;
    }else if (indexPath.section == 2){
        return 60;
    }
    
    return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 30;
    }else if (section == 2){
        return 15;
    }
    return 0;
}

#pragma  mark -- 点击开始的代理方法
- (void)bottomView:(DPKBottomView *)bottomView selectedTimeStr:(NSString *)timeStr {
 
    if ([self.type isEqualToString:DPKJuLeBu] && self.block) {
        
        //创建模型
        DPKPaiJuModel *paiJuModel = [[DPKPaiJuModel alloc]init];
        paiJuModel.paiJuTime = timeStr;
        paiJuModel.paiJuName = self.paiJuName.text;
        paiJuModel.paiJuChouMa = self.chouMaLab.text;
        
        [self clickButton];
        self.block(paiJuModel);
        
        
        
    }else {
        
        DPKChatViewController *chatVc = [[DPKChatViewController alloc]init];
        chatVc.title = self.paiJuName.text;
        DPKTabBarViewController *tabbar = (DPKTabBarViewController *)self.presentingViewController;
        
        [self dismissViewControllerAnimated:YES completion:nil];
        [tabbar.selectedViewController  pushViewController:chatVc animated:YES];
    }
    
   
    
   
   
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
