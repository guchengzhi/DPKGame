//
//  DPKFindViewController.m
//  DPKGame
//
//  Created by 王征 on 16/9/12.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKFindViewController.h"
#import "DPKXinShouCell.h"
#import "DPKLoginViewController.h"

@interface DPKFindViewController ()

@end

 static NSString *cellId = @"xinShouCell";

@implementation DPKFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1111
   
    
    //加载背景图
    UIImageView *img = [[UIImageView alloc]initWithFrame:self.view.bounds];
    img.image = [UIImage imageNamed:@"zhuye_di011_568h"];
    self.tableView.backgroundView = img;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DPKXinShouCell class]) bundle:nil] forCellReuseIdentifier:cellId];
    
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 0;
    
    self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem getRightUIBarButtonItem:@"登录" target:self action:@selector(login)];
    
}

- (void)login {
    DPKLoginViewController *loginVc = [[DPKLoginViewController alloc]init];
    
    [self presentViewController:loginVc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }else {
        
        return 3;
    }

  
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 20;
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
       
        if (indexPath.row == 0) {
           UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            cell.imageView.image = [UIImage imageNamed:@"discovery_dzq_icon"];
            cell.textLabel.text = @"战鱼德州圈";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.textColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor colorWithRed:19/255.0 green:24/255.0 blue:30/255.0 alpha:0.3];
            //添加下划线
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, DPKScreenW, 1)];
            lineView.backgroundColor = [UIColor colorWithRed:17/255.0 green:38/255.0 blue:57/255.0 alpha:1.0];
            [cell addSubview:lineView];
            
            return cell;
        }else {
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell2"];
            cell.imageView.image = [UIImage imageNamed:@"discovery_xyx_icon"];
            cell.textLabel.text = @"小游戏";
            cell.detailTextLabel.text = @"敬请期待";
            cell.detailTextLabel.textColor = [UIColor whiteColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.textColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor colorWithRed:19/255.0 green:24/255.0 blue:30/255.0 alpha:0.3];
            
            return cell;
            
        }
        
    }else {
        
        DPKXinShouCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        return cell;
        
        
    }
    
    
    

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 65;
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
