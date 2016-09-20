//
//  DPKTextField.m
//  DPKGame
//
//  Created by 王征 on 16/9/18.
//  Copyright © 2016年 王征. All rights reserved.
//

#import "DPKTextField.h"
#import <objc/runtime.h>

@implementation DPKTextField

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self basicTextFeild];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self basicTextFeild];
}


- (void)basicTextFeild {
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    UILabel *paddingLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 10, 20)];
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.leftView = paddingLabel;
    
    self.leftViewMode = UITextFieldViewModeAlways;
    [self setValue:[UIColor whiteColor] forKeyPath:@"_clearButton.backgroundColor"];
}


@end
