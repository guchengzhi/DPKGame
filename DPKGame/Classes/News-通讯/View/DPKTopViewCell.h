//
//  DPKTopViewCell.h
//  DPKGame
//
//  Created by 王征 on 16/9/13.
//  Copyright © 2016年 王征. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    DPKButtonTypeXinFriendBtn=100,//新朋友
    DPKButtonTypeGoodFriendBtn,//好友
    DPKButtonTypeJuLeBuBtn,//俱乐部
    
    
}DPKButtonType;

@class DPKTopViewCell;
@protocol DPKTopViewCellDelegate <NSObject>

- (void)topViewCell:(DPKTopViewCell *)cell didDPKButtonType:(DPKButtonType)type;

@end

@interface DPKTopViewCell : UITableViewCell

@property (nonatomic,assign) id<DPKTopViewCellDelegate>delegate;


@end
