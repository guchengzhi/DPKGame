//
//  DPKJuLeBuDetailTableViewController.m
//  DPKGame
//
//  Created by 王征 on 16/9/20.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKJuLeBuDetailTableViewController.h"
#import "DPKIConImageCell.h"

@interface DPKJuLeBuDetailTableViewController ()

/**顶部的视图*/
@property (strong, nonatomic) IBOutlet UIView *topView;

@property (strong, nonatomic) IBOutlet UITableViewCell *cell1;

@property (strong, nonatomic) IBOutlet UITableViewCell *cell2;

@property (strong, nonatomic) IBOutlet UITableViewCell *cell3;
@property (strong, nonatomic) IBOutlet UITableViewCell *cell4;
/**不是群的创建者时*/
@property (strong, nonatomic) IBOutlet UITableViewCell *cell5;

/**群的创建者*/
@property (strong, nonatomic) IBOutlet UITableViewCell *cell6;

/**是否是群主*/
@property (nonatomic,assign) BOOL isQunZhu;

@end

@implementation DPKJuLeBuDetailTableViewController
 static NSString *imageCellId = @"imageCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = self.topView;
    //加载背景图
    UIImageView *img = [[UIImageView alloc]initWithFrame:self.view.bounds];
    img.image = [UIImage imageNamed:@"zhuce_di011_667h"];
    self.tableView.backgroundView = img;
    
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 0;
    
    //self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   
    //注册
    [self.tableView registerClass:[DPKIConImageCell class] forCellReuseIdentifier:imageCellId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.isQunZhu) {
        return 3;
    }else {
        return 4;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.isQunZhu) {
        if (section == 0) {
            return 2;
        }else if (section == 1){
            return 1;
        }else {
            return 3;
        }
    }else {
        if (section == 0 || section == 1) {
            return 1;
        }else if (section == 2){
            return 3;
        }else {
            return 1;
        }
    }

    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                return _cell1;
            }else {
                return  self.isQunZhu ? _cell6 : nil;
            }
           
        }else if (indexPath.section == 1){
            DPKIConImageCell *cell = [tableView dequeueReusableCellWithIdentifier:imageCellId];
            return cell;
        }else if (indexPath.section == 2){
            if (indexPath.row == 0) {
                return _cell2;
            }else if (indexPath.row == 1){
                return _cell3;
            }else {
                return _cell4;
            }
        }else {
            return  self.isQunZhu ? nil : _cell5;
        }
    
    
   
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 41;
    }else if (indexPath.section == 1){
        return 60;
    }else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return 82;

        }else {
            return 41;
        }
        
    }else {
        return 50;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1 || section == 2) {
        return 30;
    }else {
        return self.isQunZhu ? 0 : 20;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
      UILabel *lab = [[UILabel alloc]init];
        lab.x = 10;

   
    if (section == 1) {
        // lab.backgroundColor = [UIColor redColor];
        lab.textAlignment = NSTextAlignmentLeft;
        lab.textColor = [UIColor whiteColor];
        lab.font = [UIFont systemFontOfSize:16];
        lab.text = [NSString stringWithFormat:@"   会员%zd/1000",999];
        
       
    }
   
     return lab;
   
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
