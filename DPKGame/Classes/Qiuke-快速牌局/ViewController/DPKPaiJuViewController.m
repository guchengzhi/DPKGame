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

@interface DPKPaiJuViewController ()

@property (strong, nonatomic) IBOutlet UITableViewCell *cell1;

@property (strong, nonatomic) IBOutlet UITableViewCell *cell2;

@property (strong, nonatomic) IBOutlet UITableViewCell *cell4;

@property (strong, nonatomic) IBOutlet UITableViewCell *cell5;


@property (weak, nonatomic) IBOutlet DPKSlider *slider;


@property (nonatomic,strong) NSArray *labelArr;
@property (strong, nonatomic) IBOutlet UIView *bottomView;

//存放label的数组

@property (nonatomic,strong) NSMutableArray *arr;


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
    
    DPKBottomView *bottomView = [DPKBottomView bottomView];
    
    self.tableView.tableFooterView = bottomView;
    
    
    
    
    
    
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
        return 44;
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
