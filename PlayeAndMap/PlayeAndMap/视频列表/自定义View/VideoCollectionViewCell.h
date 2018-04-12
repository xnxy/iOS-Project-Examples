//
//  VideoCollectionViewCell.h
//  PlayeAndMap
//
//  Created by dev on 2018/4/9.
//  Copyright © 2018年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PlayBlock)(UIButton *btn);

@interface VideoCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *paceImageView;

@property (nonatomic, strong) UIButton *playBtn;

@property (nonatomic, copy) PlayBlock playBlock;

@end
