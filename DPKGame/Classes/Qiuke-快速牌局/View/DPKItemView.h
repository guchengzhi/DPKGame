//
//  DPKItemView.h
//  DPKGame
//
//  Created by 王征 on 16/9/18.
//  Copyright © 2016年 王征. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    /**牌型提示*/
    DPKItemButtonTypePaiXing,
    /**房主管理*/
    DPKItemButtonTypeFangzhu,
    /**补充计分牌*/
    DPKItemButtonTypeJiFen,
    /**站起围观*/
    DPKItemButtonTypeWeiGuan,
    /**返回大厅*/
    DPKItemButtonTypeFanHui,
    /**退出牌局*/
    DPKItemButtonTypeExitPaiJu
    
}DPKItemButtonType;

@class DPKItemView;

@protocol DPKItemViewDelegate <NSObject>

- (void)ItemView:(DPKItemView *)itemView didclickButtonType:(DPKItemButtonType)type;

@end

@interface DPKItemView : UIView
/**菜单显示在哪个view上面，如果没有的话，就是keywindow*/
@property (nonatomic,strong)UIView *containerView;

@property (nonatomic,assign) id<DPKItemViewDelegate>delegate;



@end
