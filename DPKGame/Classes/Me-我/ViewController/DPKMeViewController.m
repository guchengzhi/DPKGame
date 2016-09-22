//
//  DPKMeViewController.m
//  DPKGame
//
//  Created by 王征 on 16/9/10.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKMeViewController.h"
#import "DPKMeButton.h"

@interface DPKMeViewController ()

/**背景图片*/
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
/**顶部的图片*/
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;

@end

@implementation DPKMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建按钮
    [self setupButton];
    
}


/**创建按钮*/
- (void)setupButton {
    //图片的数组
    NSArray *picArr = @[@"icon_paipu_01",@"me_icon_undezhouquan",@"me_icon_fenxiang-1",@"me_icon_shangdian",@"me_icon_kefu",@"me_icon_shezhi"];
    NSArray *titleArr = @[@"牌谱收藏",@"我的德州圈",@"分享德州圈",@"商店",@"客服",@"设置"];
    //一行最多3列
    NSInteger maxCols = 3;
    //按钮的宽度
    CGFloat btnW = DPKScreenW / maxCols;
    CGFloat btnH = 110;
    
    CGFloat btnY = CGRectGetMaxY(self.topImageView.frame);
    for (int i = 0; i < 6; i++) {
        DPKMeButton *meBtn = [[DPKMeButton alloc]init];
        meBtn.backgroundColor = [UIColor blackColor];
        //meBtn.backgroundColor = [UIColor redColor];
        [meBtn setTitle:titleArr[i] forState:UIControlStateNormal];
        [meBtn setImage:[UIImage imageNamed:picArr[i]] forState:UIControlStateNormal];
        
     
        //计算frame
        NSInteger col = i % maxCols;
        NSInteger row = i / maxCols;
        
        meBtn.x = col *(btnW+1);
        meBtn.y = row *(btnH+1) + btnY;
        meBtn.width = btnW;
        meBtn.height = btnH;
        
        
        [self.bgImageView addSubview:meBtn];
        if (i == 1) {
            UIImage *img = [UIImage imageNamed:@"weikaifang"];
            UIImageView *iv = [[UIImageView alloc]init];
            iv.width = 44;
            iv.height = 47;
            iv.image = img;
            [self.bgImageView addSubview:iv];
           iv.x = btnW*2 - iv.width;
            iv.y = CGRectGetMaxY(self.topImageView.frame);
            
            
           
            //iv.backgroundColor = [UIColor redColor];
           
        }

    }
    
    
    
    
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
