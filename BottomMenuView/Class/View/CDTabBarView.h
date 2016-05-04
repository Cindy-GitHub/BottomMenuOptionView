//
//  CDTabBarView.h
//  BottomMenuView
//
//  Created by Cindy on 16/5/4.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

extern NSString *const CDTitleKey;
extern NSString *const CDImageNameKey;


@interface CDTabBarView : UIView

- (instancetype)initWithItemArray:(NSArray *)items;

- (void)setNewItemArray:(NSArray *)items;

@end
