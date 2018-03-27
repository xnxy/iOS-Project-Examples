//
//  PlayerListCell.m
//  PlayeAndMap
//
//  Created by dev on 2018/3/26.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "PlayerListCell.h"

@implementation PlayerListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *packImageView = [UIImageView new];
        packImageView.contentMode = UIViewContentModeScaleToFill;
        packImageView.userInteractionEnabled = YES;
        packImageView.backgroundColor = [UIColor orangeColor];
        packImageView.tag = 10086;

        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"video_list_cell_big_icon"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(playBtnClick:) forControlEvents:UIControlEventTouchUpInside];

        self.packImageView = packImageView;
        self.playBtn = btn;

        [self.contentView addSubview:packImageView];
        [packImageView addSubview:btn];
        

        //layout
        [self.packImageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.top).offset(5);
            make.bottom.equalTo(self.contentView.bottom).offset(-5);
            make.left.right.equalTo(self.contentView);
            make.height.equalTo(self.packImageView.width).multipliedBy(9.0f/16.f).priority(MASLayoutPriorityDefaultHigh);
        }];

        [self.playBtn makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.packImageView);
        }];
        
   
    }
    return self;
}

- (void)playBtnClick:(UIButton *)btn{
    
    if (self.playBlock) {
        self.playBlock(btn, self.packImageView,self.indexPath);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
