//
//  CDTabarView.h
//  BottomMenuView
//
//  Created by Cindy on 16/5/3.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"


extern NSString *const TitleKey;
extern NSString *const ImageNameKey;


@interface CDTabarView : UIView



- (instancetype)initWithSize:(CGSize)size itemArray:(NSArray *)items;
@end
