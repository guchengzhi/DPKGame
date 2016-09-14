//
//  DPKBottomView.m
//  DPKGame
//
//  Created by 王征 on 16/9/14.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKBottomView.h"
#import "DPKSlider.h"


@interface DPKBottomView()

@property (nonatomic,strong) NSArray *labelArr;

@property (weak, nonatomic) IBOutlet DPKSlider *slider;

//存放label的数组

@property (nonatomic,strong) NSMutableArray *arr;


@property (nonatomic,assign) NSInteger index;

@end

@implementation DPKBottomView

+ (instancetype)bottomView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

- (NSMutableArray *)arr {
    if (!_arr) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    //设置滑块的图片
    [self.slider setThumbImage:[UIImage imageNamed:@"shijian_icon"] forState:UIControlStateNormal];
    
    //设置划过的颜色
    
    [self.slider setMinimumTrackImage:[UIImage imageNamed:@"game_shijian_select"] forState:UIControlStateNormal];
    
    //没划过的图片
    [self.slider setMaximumTrackImage:[UIImage imageNamed:@"game_shijian_normal"] forState:UIControlStateNormal];
    
    [self.slider addTarget:self action:@selector(upadatThumbe:) forControlEvents:UIControlEventValueChanged];
    
    self.slider.continuous = NO;
    self.index = 0;
    
    self.labelArr = @[@"30分钟",@"1小时",@"1.5小时",@"2小时",@"3小时",@"4小时",@"6小时"];
    
    //创建label;
    [self setupLabel];
    
    [self upadatThumbe:self.slider];

    
    
}


//创建label
- (void)setupLabel {
    
    for (int i = 0; i < self.labelArr.count; i++) {
        UILabel *label = [[UILabel alloc]init];
        label.tag = i;
        label.font = [UIFont systemFontOfSize:9];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = self.labelArr[i];
        [label sizeToFit];
        
        [self.arr addObject:label];
        [self addSubview:label];
    }
}





- (void)layoutSubviews {
    [super layoutSubviews];
    
    //每个节点的距离
    //CGRect rect = self.slider.frame;
    CGFloat width = self.slider.width;

    CGFloat perW = width /6;
    for (int i = 0; i < self.arr.count; i++) {
        UILabel *label = self.arr[i];
        label.font = [UIFont systemFontOfSize:9];
        label.textColor = [UIColor whiteColor];
        
        label.text = self.labelArr[i];
        [label sizeToFit];
        label.x = perW *i +10;
        if (self.index == label.tag) {//选中
            label.y = self.slider.y-label.height-20;
            label.backgroundColor = [UIColor blackColor];
        }else {//未选中
            label.y = self.slider.y-label.height-10;
            label.backgroundColor = [UIColor clearColor];
            
        }
        
    }
    
}



-(void)upadatThumbe:(UISlider *)slider {
    
    //获取slider的宽度
    //CGRect rect = slider.frame;
    CGFloat width = self.slider.width;
   
    CGFloat perW = width /6;
    
    NSInteger i =  round(slider.value *width / perW);
    
    slider.value = perW *i/width;
    
    
    
    //取出当前的label
    self.index = i;
    
    [self setNeedsLayout];
    

    
    
    
    
}





@end
