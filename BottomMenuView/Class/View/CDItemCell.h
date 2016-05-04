//
//  CDItemCell.h
//  BottomMenuView
//
//  Created by Cindy on 16/5/4.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import <UIKit/UIKit.h>


UIKIT_EXTERN NSString *const CDTitleKey;
UIKIT_EXTERN NSString *const CDImageNameKey;


@interface CDItemCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

- (void)setDataToDisplayWithData:(NSDictionary *)item;

@end
