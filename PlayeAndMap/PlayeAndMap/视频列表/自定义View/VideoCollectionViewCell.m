//
//  VideoCollectionViewCell.m
//  PlayeAndMap
//
//  Created by dev on 2018/4/9.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "VideoCollectionViewCell.h"

@implementation VideoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *packImageView = [[UIImageView alloc]init];
        packImageView.backgroundColor = [UIColor randomColor];
        packImageView.tag = 10086;
        packImageView.userInteractionEnabled = YES;
        
        self.playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.playBtn addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
        [self.playBtn setImage:[UIImage imageNamed:@"video_list_cell_big_icon"] forState:UIControlStateNormal];
        
        [self.contentView addSubview:packImageView];
        [packImageView addSubview:self.playBtn];
        
        self.paceImageView = packImageView;
        
        //layout
        [packImageView makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.equalTo(self.contentView);
        }];
        
        [self.playBtn makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(packImageView);
        }];
        
    }
    return self;
}

- (void)play:(UIButton *)btn{
    if (self.playBlock) {
        self.playBlock(btn);
    }
}


@end
