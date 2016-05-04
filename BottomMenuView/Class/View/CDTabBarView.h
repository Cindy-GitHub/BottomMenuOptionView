//
//  CDTabBarView.h
//  BottomMenuView
//
//  Created by Cindy on 16/5/4.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "CDItemCell.h"


@protocol CDTabBarViewDelegate;
@interface CDTabBarView : UIView

@property (nonatomic,assign) id <CDTabBarViewDelegate> delegate;

- (instancetype)initWithItemArray:(NSArray *)items;
- (void)setNewItemArray:(NSArray *)items;
- (CDItemCell *)cellAtIndex:(NSInteger)index;
@end


@protocol CDTabBarViewDelegate <NSObject>
- (void)cdTabBarView:(CDTabBarView *)cdTabBar itemClickOn:(NSInteger)index;
@end