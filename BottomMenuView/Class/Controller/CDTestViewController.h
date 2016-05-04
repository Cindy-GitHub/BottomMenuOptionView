//
//  CDTestViewController.h
//  BottomMenuView
//
//  Created by Cindy on 16/5/3.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CDTabBarView;

@interface CDTestViewController : UIViewController

@property (weak, nonatomic) IBOutlet CDTabBarView *tabBarView;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintViewBottomSpace;


@end
