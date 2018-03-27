//
//  PlayerListCell.h
//  PlayeAndMap
//
//  Created by dev on 2018/3/26.
//  Copyright © 2018年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PlayBlock)(UIButton *btn, UIImageView *packView, NSIndexPath *path);

@interface PlayerListCell : UITableViewCell

@property (nonatomic, strong) UIImageView *packImageView;
@property (nonatomic, strong) UIButton *playBtn;

@property (nonatomic, strong) NSIndexPath *indexPath;


@property (nonatomic, copy) PlayBlock playBlock;


@end
