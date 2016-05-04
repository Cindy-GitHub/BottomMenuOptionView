//
//  CDTestViewController.m
//  BottomMenuView
//
//  Created by Cindy on 16/5/3.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import "CDTestViewController.h"
#import "CDTabarView.h"


@interface CDTestViewController ()
{
    CDTabarView *_tabaer;
}
@end

@implementation CDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Test Bottom Menu";
    
    
    NSArray *array = @[@{TitleKey:@"itemOne", ImageNameKey:@"botm-nav-mudd"},@{TitleKey:@"itemTwo", ImageNameKey:@"botm-nav-mudd"},@{TitleKey:@"itemThree", ImageNameKey:@"botm-nav-mudd"},@{TitleKey:@"itemFour", ImageNameKey:@"botm-nav-mudd"},@{TitleKey:@"itemFive", ImageNameKey:@"botm-nav-mudd"}];
    _tabaer = [[CDTabarView alloc] initWithSize:CGSizeMake(self.view.bounds.size.width, 50.0) itemArray:array];
    [self.view addSubview:_tabaer];
    _tabaer.clipsToBounds = YES;

}

- (void)viewWillAppear:(BOOL)animated
{
    [_tabaer mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-10);
        make.height.equalTo(@(55));
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
