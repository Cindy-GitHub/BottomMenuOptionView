//
//  CDTabarView.m
//  BottomMenuView
//
//  Created by Cindy on 16/5/3.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import "CDTabarView.h"


NSString *const TitleKey = @"title";
NSString *const ImageNameKey = @"iamgeName";


@interface CDTabarView()
{
    NSArray *_items;
    UILabel *label[10];
    UIImageView *imageIcon[10];
    UIView *view[10];
}
@end


@implementation CDTabarView

- (instancetype)initWithSize:(CGSize)size itemArray:(NSArray *)items
{
    self = [super init];
    if (self) {
        _items = items;
        self.frame = CGRectMake(0, 0, size.width, size.height);
    }
    
    [self initMenuItem];
    return self;
}

- (void)layoutSubviews
{
    [self initMenuItem];
}

- (void)initMenuItem
{
    @synchronized (self) {
        BOOL  added = NO;
        NSInteger count = 0;
        if ([[self subviews] count] > 0) {
            added = YES;
        }
        if ([_items count] > 10) {
            count = 10;
        } else {
            count = [_items count];
        }
        
        CGFloat width = (self.bounds.size.width - count + 1)/count;
        
        if (added) {
            //  已经存添加了菜单项
            for (int i = 0 ;  i < count; i ++) {
                NSDictionary *item = _items[i];
                label[i].text = [item objectForKey:TitleKey];
                imageIcon[i].image = [UIImage imageNamed:[item objectForKey:ImageNameKey]];
                
                [view[i] mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self);
                    make.left.equalTo(self).offset(i*(width + 1));
                    make.width.equalTo(@(width));
                    make.height.equalTo(self);
                }]; //  添加约束条件
                
            }
            
        } else {
            //  没有添加菜单项
            for (int i = 0 ;  i < count; i ++) {
                view[i] = [[UIView alloc] init];
                view[i].backgroundColor = [UIColor yellowColor];
                [self addSubview:view[i]];
                [view[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self);
                    make.left.equalTo(self).offset(i*(width + 1));
                    make.width.equalTo(@(width));
                    make.height.equalTo(self);
                }];  //  添加约束条件
                
                
                NSDictionary *item = _items[i];
                //  图标
                imageIcon[i] = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[item objectForKey:ImageNameKey]]];
                imageIcon[i].contentMode = UIViewContentModeScaleAspectFit;
                [view[i] addSubview:imageIcon[i]];
                [imageIcon[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(view[i]);
                    make.height.equalTo(@(20));
                    make.centerX.equalTo(@(0));
                    make.centerY.equalTo(@(-5));
                }];//  添加约束条件
                //  底部标签
                label[i] = [[UILabel alloc] init];
                label[i].text = [item objectForKey:TitleKey];
                label[i].textAlignment = NSTextAlignmentCenter;
                label[i].textColor = [UIColor darkGrayColor];
                label[i].font = [UIFont systemFontOfSize:10];
                [view[i] addSubview:label[i]];
                [label[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(imageIcon[i].mas_bottom);
                    make.width.equalTo(view[i]);
                    make.centerX.equalTo(imageIcon[i]);
                }];//  添加约束条件
            }
            
            
             [self layoutIfNeeded];
        }
    }

}

@end
