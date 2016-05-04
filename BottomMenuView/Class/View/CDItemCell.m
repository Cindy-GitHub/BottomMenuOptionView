//
//  CDItemCell.m
//  BottomMenuView
//
//  Created by Cindy on 16/5/4.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import "CDItemCell.h"

NSString *const CDTitleKey = @"title";
NSString *const CDImageNameKey = @"iamgeName";

@implementation CDItemCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1) {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
    }
    
    return self;
}

- (void)setDataToDisplayWithData:(NSDictionary *)item
{
    self.labelName.text = [item objectForKey:CDTitleKey];
    self.imageViewIcon.image = [UIImage imageNamed:[item objectForKey:CDImageNameKey]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
