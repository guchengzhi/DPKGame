//
//  UIView+Extension.h
//  weibo
//
//  Created by 王征 on 15/9/30.
//  Copyright (c) 2015年 王征. All rights reserved.
//

#import <UIKit/UIKit.h>
// 分类不能添加成员属性
// @property如果在分类里面，只会自动生成get,set方法的声明，不会生成成员属性，和方法的实现


@interface UIView (Extension)
@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGSize size;
@property (nonatomic,assign) CGPoint origin;
@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;
@property (nonatomic,assign) CGPoint center;

/**
 *判断一个控件是否真正的显示在窗口上
 */
- (BOOL)isShowOnKeyWindow;
@end
