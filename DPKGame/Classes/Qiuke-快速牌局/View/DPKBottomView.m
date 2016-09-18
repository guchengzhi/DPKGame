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


@property (nonatomic,strong) DPKSlider *bottomSlider;

/**底部的按钮*/
@property (nonatomic,strong) UIButton *bottomBtn;

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

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        CGFloat x = (DPKScreenW - 293) / 2;
        self.bottomSlider = [[DPKSlider alloc]initWithFrame:CGRectMake(x, 90, 293, 16)];
        [self addSubview:self.bottomSlider];
        CGFloat y = CGRectGetMaxY(self.bottomSlider.frame) + 50;
         x = (DPKScreenW - 250) / 2;
        self.bottomBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, 250, 34)];
        self.bottomBtn.backgroundColor = DPKGRGBColor(171, 138, 71);
        [self.bottomBtn setTitle:@"开始" forState:UIControlStateNormal];
        self.bottomBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.bottomBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.bottomBtn];
        
        [self setupBasic];
    }
    return self;
}

#pragma mark -- 点击开始按钮
- (void)clickButton:(UIButton *)btn {
    //选中的时长
    NSString *str = self.labelArr[self.index];
    
    if ([self.delegate respondsToSelector:@selector(bottomView:selectedTimeStr:)]) {
        [self.delegate bottomView:self selectedTimeStr:str];
    }
}



- (void)setupBasic {
    //设置滑块的图片
    [self.bottomSlider setThumbImage:[UIImage imageNamed:@"shijian_icon"] forState:UIControlStateNormal];
    
    //设置划过的颜色
    
    [self.bottomSlider setMinimumTrackImage:[UIImage imageNamed:@"game_shijian_select"] forState:UIControlStateNormal];
    
    //没划过的图片
    [self.bottomSlider setMaximumTrackImage:[UIImage imageNamed:@"game_shijian_normal"] forState:UIControlStateNormal];
    
    [self.bottomSlider addTarget:self action:@selector(upadatThumbe:) forControlEvents:UIControlEventValueChanged];
    
    self.bottomSlider.continuous = NO;
    self.index = 0;
    
    self.labelArr = @[@"30分钟",@"1小时",@"1.5小时",@"2小时",@"3小时",@"4小时",@"6小时"];
    
    //创建label;
    [self setupLabel];
    
    [self upadatThumbe:self.bottomSlider];
    

}



//创建label
- (void)setupLabel {
    
    for (int i = 0; i < self.labelArr.count; i++) {
        UILabel *label = [[UILabel alloc]init];
        label.tag = i;
        label.font = [UIFont systemFontOfSize:9];
        label.textColor = [UIColor whiteColor];
        //label.textAlignment = NSTextAlignmentCenter;
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
    CGFloat width = self.bottomSlider.width;

    CGFloat perW = width /6;
    for (int i = 0; i < self.arr.count; i++) {
        UILabel *label = self.arr[i];
        label.font = [UIFont systemFontOfSize:9];
        label.textColor = [UIColor whiteColor];
        
        label.text = self.labelArr[i];
        [label sizeToFit];
        label.x = perW *i +self.bottomSlider.x *0.65;
        if (self.index == label.tag) {//选中
            label.y = self.bottomSlider.y-label.height-30;
            label.backgroundColor = [UIColor blackColor];
        }else {//未选中
            label.y = self.bottomSlider.y-label.height-20;
            label.backgroundColor = [UIColor clearColor];
            
        }
        
    }
    
}



-(void)upadatThumbe:(UISlider *)slider {
    
    //获取slider的宽度
    //CGRect rect = slider.frame;
    CGFloat width = self.bottomSlider.width;
   
    CGFloat perW = width /6;
    
    NSInteger i =  round(slider.value *width / perW);
    
    slider.value = perW *i/width;
    
    
    
    //取出当前的label
    self.index = i;
    
    [self setNeedsLayout];
    

    
    
    
    
}





@end
