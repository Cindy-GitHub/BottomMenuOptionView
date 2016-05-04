//
//  CDTabBarView.m
//  BottomMenuView
//
//  Created by Cindy on 16/5/4.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import "CDTabBarView.h"

@interface CDTabBarView() <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSArray *_items;
    UICollectionView *_collectionView;
}
@end


@implementation CDTabBarView

- (instancetype)initWithItemArray:(NSArray *)items
{
    self = [super init];
    if (self) {
        _items = items;
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
        if (_collectionView == nil) {
            //  初始化装载控件
            UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
            //        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
            flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
            _collectionView.collectionViewLayout = flowLayout;
            _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 50) collectionViewLayout:flowLayout];
            _collectionView.backgroundColor = [UIColor clearColor];
            _collectionView.delegate = self;
            _collectionView.dataSource = self;
            [self addSubview:_collectionView];
            [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self);
                make.left.equalTo(self);
                make.bottom.equalTo(self);
                make.right.equalTo(self);
            }]; //  添加约束条件
            
            
            /**
             *  添加边框和圆角的效果
             */
            self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
            self.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4].CGColor;
            self.layer.borderWidth = 0.5f;
            self.layer.cornerRadius = 2.0;
            
        }
        [_collectionView reloadData];
    }
}

#pragma mark - Public Method
- (void)setNewItemArray:(NSArray *)items
{
    _items = items;
    [self initMenuItem];
}

- (CDItemCell *)cellAtIndex:(NSInteger)index
{
    CDItemCell *cell = (CDItemCell *)[_collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
    return cell;
}

#pragma mark  - UICollectionView Delegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"CDItemCollectionCellID";
    [_collectionView registerClass:[CDItemCell class] forCellWithReuseIdentifier:CellIdentifier];
    CDItemCell * cell = (CDItemCell *)[_collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell setDataToDisplayWithData:_items[[indexPath row]]];
    
    NSLog(@"%zi",[indexPath row]);
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(cdTabBarView:itemClickOn:)]) {
        [self.delegate cdTabBarView:self itemClickOn:[indexPath row]];
    } else {
        NSLog(@"请在使用CDTabBarView控件的位置实现其 (cdTabBarView:itemClickOn:) 的代理方法，以便接收Item项的点击事件");
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.bounds.size.width - ([_items count] -1)*0.5)/[_items count], self.bounds.size.height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_items count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

@end
