//
//  DPKBottomView.h
//  DPKGame
//
//  Created by 王征 on 16/9/14.
//  Copyright © 2016年 王征. All rights reserved.
//



#import <UIKit/UIKit.h>
@class DPKBottomView;
@protocol DPKBottomViewDelegate <NSObject>

- (void)bottomView:(DPKBottomView *)bottomView selectedTimeStr:(NSString *)timeStr;

@end

@interface DPKBottomView : UIView

+ (instancetype)bottomView;

@property (nonatomic,assign) id<DPKBottomViewDelegate>delegate;

@end
