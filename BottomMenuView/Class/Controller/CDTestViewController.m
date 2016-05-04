//
//  CDTestViewController.m
//  BottomMenuView
//
//  Created by Cindy on 16/5/3.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import "CDTestViewController.h"
#import "CDTabBarView.h"


@interface CDTestViewController () <CDTabBarViewDelegate>
{
    NSArray *_dataArray;
    
    CDTabBarView *_tabaer;
}
@end

@implementation CDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Test Bottom Menu";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _dataArray = @[@{CDTitleKey:@"itemOne", CDImageNameKey:@"botm-nav-mudd"},@{CDTitleKey:@"itemTwo", CDImageNameKey:@"botm-nav-mudd"},@{CDTitleKey:@"itemThree", CDImageNameKey:@"botm-nav-mudd"},@{CDTitleKey:@"itemFour", CDImageNameKey:@"botm-nav-mudd"},@{CDTitleKey:@"itemFive", CDImageNameKey:@"botm-nav-mudd"}];

    self.constraintViewBottomSpace.constant = -60.0;
    [self.view layoutIfNeeded];
}

- (void)viewWillAppear:(BOOL)animated
{
    /**
     *  使用xib文件生成的TabBarView
     */
    [self.tabBarView setNewItemArray:_dataArray];
    self.tabBarView.delegate = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.constraintViewBottomSpace.constant = 10;
        [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
        }];
    });
    
    
    /**
     * 直接创建一个TabBarView,添加到self.view
     */
//    [self createNewTabBarView];
    
}

- (void)createNewTabBarView
{
    /**
     * 直接创建一个TabBarView,添加到self.view
     */
    _tabaer = [[CDTabBarView alloc] initWithItemArray:_dataArray];
    [self.view addSubview:_tabaer];
    _tabaer.clipsToBounds = YES;
    [_tabaer mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-10);
        make.height.equalTo(@(55));
    }];
    [self.view layoutIfNeeded];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CDTabBarViewDelegate
- (void)cdTabBarView:(CDTabBarView *)cdTabBar itemClickOn:(NSInteger)index
{
    NSLog(@"已经接收touch事件！ 位置%zi的item被点击了",index);
}

@end
