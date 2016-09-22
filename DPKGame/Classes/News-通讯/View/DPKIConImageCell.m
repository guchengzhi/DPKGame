//
//  DPKIConImageCell.m
//  DPKGame
//
//  Created by 王征 on 16/9/20.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKIConImageCell.h"

@interface DPKIConImageCell()

@property (nonatomic,strong) NSMutableArray *imagesArr;

@end

@implementation DPKIConImageCell

- (NSMutableArray *)imagesArr {
    if (!_imagesArr) {
        _imagesArr = [NSMutableArray array];
        
    }
    return _imagesArr;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor colorWithRed:19/255.0 green:24/255.0 blue:30/255.0 alpha:0.3];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupImage];
    }
    return self;
}



- (void)setupImage {
  
    NSInteger margin = 10;
    NSInteger imageW = (DPKScreenW - margin*6)/5;
    UIImage *img  = [UIImage imageNamed:@"touxiang_nan"];
    for (int i = 0; i < 5; i++) {
        UIImageView *imageV =[[UIImageView alloc]init];
        //imageV.backgroundColor = [UIColor yellowColor];
        imageV.image = img;
        
        imageV.width = imageW-10;
        imageV.height = imageW-10;
        imageV.x = (margin + imageW)*i+margin;
        imageV.y = 5;
        [self.contentView addSubview:imageV];
        [self.imagesArr addObject:imageV];
       
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
