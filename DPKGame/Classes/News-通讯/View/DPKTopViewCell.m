//
//  DPKTopViewCell.m
//  DPKGame
//
//  Created by 王征 on 16/9/13.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKTopViewCell.h"
#import "DPKButton.h"

@interface DPKTopViewCell()

/**数组存放按钮*/
@property (nonatomic,strong) NSMutableArray *allButtonArr;

@end

@implementation DPKTopViewCell

- (NSMutableArray *)allButtonArr {
    if (!_allButtonArr) {
        _allButtonArr = [NSMutableArray array];
    }
    return _allButtonArr;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        //self.backgroundColor = [UIColor colorWithRed:19/255.0 green:24/255.0 blue:30/255.0 alpha:0.3];
        self.backgroundColor = DPKBGColor(19, 24, 30, 0.3);
        
        //新朋友
        [self setupDPKButton:@"sessionList_tianjiahaoyou_normal" title:@"新朋友" type: DPKButtonTypeXinFriendBtn];
        [self setupDPKButton:@"game_renshu" title:@"好友" type:DPKButtonTypeGoodFriendBtn];
        [self setupDPKButton:@"game_renshu" title:@"俱乐部" type:DPKButtonTypeJuLeBuBtn];

    }
    
    return self;
}


- (void)setupDPKButton:(NSString *)imageName title:(NSString *)title type:(DPKButtonType)type {
    DPKButton *btn = [[DPKButton  alloc]init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.tag = type;
    //添加点击事件
    [btn addTarget:self action:@selector(clcikItemButton:) forControlEvents:UIControlEventTouchUpInside];
//    btn.titleLabel.font = [UIFont systemFontOfSize:14];
   
    [self.contentView addSubview:btn];
    [self.allButtonArr addObject:btn];
    
    
}


#pragma mark -- 点击按钮
- (void)clcikItemButton:(DPKButton *)btn {
    
    if ([self.delegate respondsToSelector:@selector(topViewCell:didDPKButtonType:)]) {
        [self.delegate topViewCell:self didDPKButtonType:btn.tag];
    }
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat btnW = 60;
    CGFloat btnH = 75;
    CGFloat btnX = 40;
    CGFloat btnY = (self.height - btnH)*0.5;
   
    CGFloat margin = ([UIScreen mainScreen].bounds.size.width - 3*btnW-2*btnX)/2;
    for (int i = 0; i < self.allButtonArr.count; i++) {
        DPKButton *btn = self.allButtonArr[i];
        btn.width = btnW;
        btn.height = btnH;
        btn.x = i*(btnW+margin) + btnX;
        btn.y = btnY;
        
    }
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
